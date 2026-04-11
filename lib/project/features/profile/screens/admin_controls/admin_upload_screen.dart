import 'package:flutter/material.dart';
import 'package:food_cafe_user/project/features/profile/screens/admin_controls/add_dish_screen.dart';
import 'package:food_cafe_user/project/features/profile/screens/admin_controls/category_selection_screen.dart';

class AdminPanelScreen extends StatelessWidget {
  const AdminPanelScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text("Admin Panel")),
      body: Padding(
        padding: const EdgeInsets.all(16),
        child: Column(
          children: [
            ElevatedButton(
              onPressed: () {
                Navigator.push(
                  context,
                  MaterialPageRoute(builder: (_) => const AddCategoryDishScreen()),
                );
              },
              child: const Text("➕ Add Dish"),
            ),

            const SizedBox(height: 20),

            ElevatedButton(
              onPressed: () {
                Navigator.push(
                  context,
                  MaterialPageRoute(
                    builder: (_) => const CategorySelectionScreen(),
                  ),
                );
              },
              child: const Text("✏️ Update Dish"),
            ),
          ],
        ),
      ),
    );
  }
}
