import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:food_cafe_user/project/features/profile/screens/admin_controls/update_dish_screen.dart';
import 'package:food_cafe_user/project/model/dish_model.dart';

class DishListScreen extends StatelessWidget {
  final String categoryId;

  const DishListScreen({super.key, required this.categoryId});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text("Select Dish")),
      body: StreamBuilder<QuerySnapshot>(
        stream: FirebaseFirestore.instance
            .collection('categories')
            .doc(categoryId)
            .collection('dishes')
            .snapshots(),
        builder: (context, snapshot) {
          if (!snapshot.hasData) {
            return const Center(child: CircularProgressIndicator());
          }

          final dishes = snapshot.data!.docs;

          return ListView.builder(
            itemCount: dishes.length,
            itemBuilder: (context, index) {
              final doc = dishes[index];
              final data = doc.data() as Map<String, dynamic>;

              final dish = DishModel.fromJson(data).copyWith(id: doc.id);

              return ListTile(
                title: Text(dish.name),
                subtitle: Text("₹${dish.price}"),
                trailing: const Icon(Icons.edit),
                onTap: () {
                  Navigator.push(
                    context,
                    MaterialPageRoute(
                      builder: (_) => UpdateDishScreen(
                        categoryId: categoryId,
                        dish: dish,
                        dishId: doc.id,
                      ),
                    ),
                  );
                },
              );
            },
          );
        },
      ),
    );
  }
}
