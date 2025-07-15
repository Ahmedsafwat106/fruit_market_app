import 'package:flutter/material.dart';

class FruitListPage extends StatelessWidget {
  const FruitListPage({super.key});

  final List<String> fruits = const [
    'assets/images/fruit1.jpg',
    'assets/images/fruit.jpg',
    'assets/images/fruitmarket.jpg',
    'assets/images/fruit2.jpg',
    'assets/images/fruit3.jpg',
    'assets/images/fruit4.jpg',
    'assets/images/fruit5.jpg',
    'assets/images/fruit6.jpg',
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("Fruit Market"),
        backgroundColor: Colors.green,
      ),
      body: GridView.builder(
        padding: const EdgeInsets.all(16),
        gridDelegate:
        const SliverGridDelegateWithFixedCrossAxisCount(crossAxisCount: 2, crossAxisSpacing: 12, mainAxisSpacing: 12),
        itemCount: fruits.length,
        itemBuilder: (_, index) {
          return Container(
            decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(12),
              image: DecorationImage(
                image: AssetImage(fruits[index]),
                fit: BoxFit.cover,
              ),
            ),
          );
        },
      ),
    );
  }
}