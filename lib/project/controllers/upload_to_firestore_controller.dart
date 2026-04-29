// import 'dart:developer';
// import 'package:cloud_firestore/cloud_firestore.dart';

// Future<bool> uploadFoodData() async {
//   final firestore = FirebaseFirestore.instance;

//   try {
//     final data = [
//       {
//         "id": "chinese",
//         "name": "Chinese",
//         "dishes": [
//           {
//             "name": "Veg Hakka Noodles",
//             "price": 120,
//             "isVeg": true,
//             "rating": 4.3,
//           },
//           {
//             "name": "Chicken Manchurian",
//             "price": 180,
//             "isVeg": false,
//             "rating": 4.5,
//           },
//         ],
//       },
//       {
//         "id": "italian",
//         "name": "Italian",
//         "dishes": [
//           {
//             "name": "Margherita Pizza",
//             "price": 250,
//             "isVeg": true,
//             "rating": 4.6,
//           },
//           {
//             "name": "Chicken Alfredo Pasta",
//             "price": 300,
//             "isVeg": false,
//             "rating": 4.4,
//           },
//         ],
//       },
//       {
//         "id": "indian",
//         "name": "Indian",
//         "dishes": [
//           {
//             "name": "Paneer Butter Masala",
//             "price": 220,
//             "isVeg": true,
//             "rating": 4.7,
//           },
//           {
//             "name": "Chicken Biryani",
//             "price": 260,
//             "isVeg": false,
//             "rating": 4.8,
//           },
//         ],
//       },
//       {
//         "id": "thai",
//         "name": "Thai",
//         "dishes": [
//           {"name": "Pad Thai", "price": 280, "isVeg": false, "rating": 4.5},
//           {"name": "Green Curry", "price": 240, "isVeg": true, "rating": 4.4},
//         ],
//       },
//       {
//         "id": "mexican",
//         "name": "Mexican",
//         "dishes": [
//           {"name": "Veg Tacos", "price": 180, "isVeg": true, "rating": 4.2},
//           {
//             "name": "Chicken Burrito",
//             "price": 220,
//             "isVeg": false,
//             "rating": 4.3,
//           },
//         ],
//       },
//       {
//         "id": "fast_food",
//         "name": "Fast Food",
//         "dishes": [
//           {"name": "Veg Burger", "price": 120, "isVeg": true, "rating": 4.1},
//           {
//             "name": "Chicken Fries",
//             "price": 150,
//             "isVeg": false,
//             "rating": 4.3,
//           },
//         ],
//       },
//       {
//         "id": "desserts",
//         "name": "Desserts",
//         "dishes": [
//           {
//             "name": "Chocolate Cake",
//             "price": 140,
//             "isVeg": true,
//             "rating": 4.8,
//           },
//           {
//             "name": "Ice Cream Sundae",
//             "price": 160,
//             "isVeg": true,
//             "rating": 4.6,
//           },
//         ],
//       },
//     ];

//     for (var category in data) {
//       final categoryRef = firestore
//           .collection('categories')
//           .doc(category['id'] as String);

//       // Add category
//       await categoryRef.set({"name": category['name']});

//       // Add dishes
//       final dishes = category['dishes'] as List;
//       for (var dish in dishes) {
//         await categoryRef.collection('dishes').add(dish);
//       }
//     }
//     log("🔥 Data uploaded successfully!");

//     return true;
//   } catch (e) {
//     log(e.toString());
//     log('Upload failed');
//     return false;
//   }
// }
