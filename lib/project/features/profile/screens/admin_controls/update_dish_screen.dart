import 'dart:io';
import 'package:flutter/material.dart';
import 'package:food_cafe_user/project/controllers/admin_controller.dart';
import 'package:food_cafe_user/project/model/dish_model.dart';
import 'package:image_picker/image_picker.dart';

class UpdateDishScreen extends StatefulWidget {
  final String categoryId;
  final String dishId;
  final DishModel dish;

  const UpdateDishScreen({
    super.key,
    required this.categoryId,
    required this.dishId,
    required this.dish,
  });

  @override
  State<UpdateDishScreen> createState() => _UpdateDishScreenState();
}

class _UpdateDishScreenState extends State<UpdateDishScreen> {
  final nameController = TextEditingController();
  final priceController = TextEditingController();
  final ratingController = TextEditingController();

  bool isVeg = true;
  File? imageFile;

  final service = DishService();

  @override
  void initState() {
    super.initState();

    // ✅ Pre-fill data
    nameController.text = widget.dish.name;
    priceController.text = widget.dish.price.toString();
    ratingController.text = widget.dish.rating.toString();
    isVeg = widget.dish.isVeg;
  }

  Future<void> pickImage() async {
    final picked = await ImagePicker().pickImage(source: ImageSource.gallery);

    if (picked != null) {
      setState(() => imageFile = File(picked.path));
    }
  }

  Future<void> updateDish() async {
    final name = nameController.text.trim();
    final priceText = priceController.text.trim();
    final ratingText = ratingController.text.trim();

    if (name.isEmpty || priceText.isEmpty || ratingText.isEmpty) {
      _show("Fill all fields");
      return;
    }

    final price = double.tryParse(priceText);
    final rating = double.tryParse(ratingText);

    if (price == null) {
      _show("Invalid price");
      return;
    }

    if (rating == null || rating < 0 || rating > 5) {
      _show("Rating must be 0–5");
      return;
    }

    try {
      await service.updateDish(
        categoryId: widget.categoryId,
        dishId: widget.dishId,
        dish: DishModel(name: name, price: price, isVeg: isVeg, rating: rating),
        imageFile: imageFile,
      );

      _show("Dish Updated ✅");
      Navigator.pop(context);
    } catch (e) {
      _show("Error: $e");
    }
  }

  void _show(String msg) {
    ScaffoldMessenger.of(context).showSnackBar(SnackBar(content: Text(msg)));
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text("Update Dish")),
      body: Padding(
        padding: const EdgeInsets.all(16),
        child: SingleChildScrollView(
          child: Column(
            children: [
              // ❌ NO CATEGORY FIELD HERE
              TextField(
                controller: nameController,
                decoration: const InputDecoration(labelText: "Dish Name"),
              ),

              const SizedBox(height: 15),

              TextField(
                controller: priceController,
                keyboardType: TextInputType.number,
                decoration: const InputDecoration(labelText: "Price"),
              ),

              const SizedBox(height: 15),

              TextField(
                controller: ratingController,
                keyboardType: TextInputType.number,
                decoration: const InputDecoration(labelText: "Rating (0-5)"),
              ),

              const SizedBox(height: 15),

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
              else if (widget.dish.image != null)
                Image.network(widget.dish.image!, height: 120)
              else
                const Text("No Image"),

              ElevatedButton(
                onPressed: pickImage,
                child: const Text("Change Image"),
              ),

              const SizedBox(height: 25),

              ElevatedButton(
                onPressed: updateDish,
                child: const Text("Update Dish"),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
