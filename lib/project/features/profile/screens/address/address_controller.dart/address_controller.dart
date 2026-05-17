import 'dart:developer';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:food_cafe_user/project/apis/api.dart';
import 'package:food_cafe_user/project/features/auth/model/address_model.dart';
import 'package:food_cafe_user/project/features/checkout/controller/checkout_controller.dart';
import 'package:food_cafe_user/project/helpers/custome_code/pref.dart';
import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:get/get.dart';

class AddressController extends GetxController {
  final isApiSuccess = false.obs;
  final addressModel = Rxn<Address>();
  final apiService = Api();
  final selectedAddressType = AddressType.home.obs;
  final firestore = FirebaseFirestore.instance;
  final isLoading = false.obs;
  final uid = Pref.getString('uid');
  final addresses = <Address>[].obs;
  final checkoutController = Get.find<CheckoutController>();

  Future<void> fetchStateAndCity(String pincode) async {
    isLoading.value = true;
    final response = await apiService.fetchStateAndCity(pincode);

    if (response != null) {
      isLoading.value = false;
      isApiSuccess.value = true;
      addressModel.value = response;
    } else {
      isApiSuccess.value = false;
      addressModel.value = null;
      isLoading.value = false;
    }
  }

  void setAddressType(AddressType type) => selectedAddressType.value = type;

  Future<void> addAddress(Address address) async {
    if (uid == null) return;

    try {
      isLoading.value = true;

      final doc = firestore.collection('user').doc(uid);

      await doc.update({
        "address": FieldValue.arrayUnion([address.toJson()]),
      });

      await fetchAddresses();

      Fluttertoast.showToast(
        msg: "Address addded successfully",
        toastLength: Toast.LENGTH_LONG,
      );
    } catch (e) {
      log("Add Address Error: $e");
    } finally {
      isLoading.value = false;
    }
  }

  Future<List<Address?>> fetchAddresses() async {
    try {
      isLoading.value = true;

      final snapshots = await firestore.collection('user').doc(uid).get();

      final data = snapshots.data();

      if (data != null) {
        addresses.value = (data['address'] as List)
            .map((e) => Address.fromJson(e))
            .toList();

        if (addresses.length == 1) {
          Pref.setString('defaultAdd', addresses[0].id);
        }

        log(
          "addresss s--->>>>>>>>> ${addresses.map((e) => e.toJson()).toList()}",
        );
        return addresses;
      }
      return [];
    } catch (e) {
      log("Fetch Address Error: $e");
      return [];
    } finally {
      isLoading.value = false;
    }
  }

  Future<void> updateAddress(Address address, String id) async {
    if (uid == null) return;

    try {
      isLoading.value = true;

      final docRef = firestore.collection('user').doc(uid);
      final snapshot = await docRef.get();

      final data = snapshot.data();

      if (data != null && data['address'] != null) {
        List<dynamic> addressList = List.from(data['address']);

        final index = addressList.indexWhere((e) => e['id'] == id);

        if (index != -1) {
          addressList[index] = address.toJson();

          await docRef.update({"address": addressList});

          await fetchAddresses();

          Fluttertoast.showToast(
            msg: "Address updated successfully",
            toastLength: Toast.LENGTH_LONG,
          );
        } else {
          log("Address not found");
        }
      }
    } catch (e) {
      log('Update Address Error: $e');
    } finally {
      isLoading.value = false;
    }
  }

  void setDefaultAddress(String id) {
    Pref.setString('defaultAdd', id);
    checkoutController.fetchDefaultAdd();
  }
}

@JsonEnum()
enum AddressType { home, work, other }

extension AddressTypeExtension on AddressType {
  String get label {
    switch (this) {
      case AddressType.home:
        return "Home";
      case AddressType.work:
        return "Work";
      case AddressType.other:
        return "Other";
    }
  }

  IconData get icon {
    switch (this) {
      case AddressType.home:
        return Icons.home;
      case AddressType.work:
        return Icons.work;
      case AddressType.other:
        return Icons.location_on;
    }
  }
}
