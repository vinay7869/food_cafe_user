class Category {
  final String id;
  final String name;
  final String image;

  Category({required this.id, required this.name, required this.image});

  factory Category.fromFirestore(dynamic doc) {
    final data = doc.data() as Map<String, dynamic>;
    return Category(
      id: doc.id,
      name: data['name'] ?? '',
      image: data['image'] ?? '',
    );
  }
}
