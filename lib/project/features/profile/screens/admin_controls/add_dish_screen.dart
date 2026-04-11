import 'dart:io';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:food_cafe_user/project/controllers/admin_controller.dart';
import 'package:food_cafe_user/project/model/dish_model.dart';
import 'package:image_picker/image_picker.dart';

class AddCategoryDishScreen extends StatefulWidget {
  const AddCategoryDishScreen({super.key});

  @override
  State<AddCategoryDishScreen> createState() => _AddCategoryDishScreenState();
}

class _AddCategoryDishScreenState extends State<AddCategoryDishScreen> {
  final categoryController = TextEditingController();
  final dishNameController = TextEditingController();
  final priceController = TextEditingController();

  double rating = 3.0;

  bool isVeg = true;
  File? imageFile;

  final service = DishService();

  Future<void> pickImage() async {
    final picked = await ImagePicker().pickImage(source: ImageSource.gallery);

    if (picked != null) {
      setState(() => imageFile = File(picked.path));
    }
  }

  Future<void> saveData() async {
    final categoryName = categoryController.text.trim().toLowerCase();

    if (categoryName.isEmpty ||
        dishNameController.text.isEmpty ||
        priceController.text.isEmpty ||
        imageFile == null) {
      _show("Fill all fields");
      return;
    }

    try {
      // 🔥 CHECK IF CATEGORY EXISTS
      final exists = await service.checkCategoryExists(categoryName);

      if (exists) {
        _show("Category already exists ❌");
        return;
      }

      // ✅ CREATE CATEGORY + FIRST DISH
      await service.createCategoryWithDish(
        categoryId: categoryName,
        categoryName: categoryController.text.trim(),
        dish: DishModel(
          name: dishNameController.text.trim(),
          price: double.parse(priceController.text.trim()),
          isVeg: isVeg,
          rating: rating,
        ),
        imageFile: imageFile,
      );

      _show("Category & Dish Added ✅");
      if (!mounted) return;
      Navigator.pop(context);
    } catch (e) {
      _show("Error: $e");
    }
  }

  void _show(String msg) {
    ScaffoldMessenger.of(context).showSnackBar(SnackBar(content: Text(msg)));
  }

  @override
  void dispose() {
    categoryController.dispose();
    dishNameController.dispose();
    priceController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text("Add Category & Dish")),
      body: Padding(
        padding: const EdgeInsets.all(16),
        child: SingleChildScrollView(
          child: Column(
            children: [
              // 🧩 CATEGORY
              TextField(
                controller: categoryController,
                decoration: const InputDecoration(labelText: "Category Name"),
              ),

              const SizedBox(height: 15),

              // 🍽 DISH NAME
              TextField(
                controller: dishNameController,
                decoration: const InputDecoration(labelText: "Dish Name"),
              ),

              const SizedBox(height: 15),

              // 💰 PRICE
              TextField(
                controller: priceController,
                keyboardType: TextInputType.number,
                decoration: const InputDecoration(labelText: "Price"),
              ),
              SizedBox(height: 30.h),

              //  Rating
              Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text("Rating: ${rating.toStringAsFixed(1)} ⭐"),
                  Slider(
                    value: rating,
                    min: 0,
                    max: 5,
                    divisions: 10,
                    onChanged: (val) {
                      setState(() => rating = val);
                    },
                  ),
                ],
              ),

              const SizedBox(height: 15),

              // 🥗 VEG SWITCH
              Row(
                children: [
                  const Text("Veg"),
                  Switch(
                    value: isVeg,
                    onChanged: (val) {
                      setState(() => isVeg = val);
                    },
                  ),
                ],
              ),

              const SizedBox(height: 15),

              // 🖼 IMAGE
              if (imageFile != null)
                Image.file(imageFile!, height: 120)
              else
                const Text("No Image Selected"),

              ElevatedButton(
                onPressed: pickImage,
                child: const Text("Pick Image"),
              ),

              const SizedBox(height: 25),

              ElevatedButton(onPressed: saveData, child: const Text("Save")),
            ],
          ),
        ),
      ),
    );
  }
}
