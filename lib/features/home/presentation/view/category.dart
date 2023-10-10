import 'package:flutter/material.dart';

class CategoryScreen extends StatelessWidget {
  // const CategoryScreen({super.key});
  final iconImage;
  final String categoryName;

  const CategoryScreen({
    super.key,
    required this.iconImage,
    required this.categoryName,
  });

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(left: 5.0),
      child: Container(
        padding: const EdgeInsets.all(20),
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(12),
          color: Colors.deepPurple[100],
        ),
        child: Row(
          children: [
            Image.network(
              iconImage,
              height: 50,
            ),
            const SizedBox(
              width: 10,
            ),
            Text(categoryName),
          ],
        ),
      ),
    );
  }
}
