import 'dart:convert';
import 'dart:developer';
import 'package:http/http.dart' as http;
import 'package:food_cafe_user/project/features/auth/model/address_model.dart';

class Api {
  static const String baseUrl = "https://api.postalpincode.in/pincode";

  Future<Address?> fetchStateAndCity(String pincode) async {
    try {
      final url = Uri.parse("$baseUrl/$pincode");

      log("Full URL: $url");

      final response = await http.get(url);
      final data = jsonDecode(response.body);

      final first = data[0];

      if (first['Status'] != "Success") {
        throw Exception(first['Message']);
      }

      final postOffices = first['PostOffice'];

      if (postOffices == null || postOffices.isEmpty) {
        throw Exception("No data found");
      }

      final postOffice = postOffices.first;

      final city = postOffice['Name'] ?? "";
      final state = postOffice['State'] ?? "";
      final country = postOffice['Country'] ?? "";

      log('city -- >> $city, state -- >> $state country -->> $country');

      return Address(city: city, state: state, country: country);
    } catch (e) {
      log("Error : $e");
      return null;
    }
  }
}
