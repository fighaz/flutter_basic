import 'package:flutter/material.dart';
import 'package:flutter_basic/models/item.dart';
import 'package:flutter_basic/pages/footer.dart';
import 'package:flutter_basic/pages/product_card.dart';

class HomePage extends StatelessWidget {
  final List<Item> items = [
    Item(
        name: 'Sugar',
        price: 5000,
        gambar: "images/sugar.jpeg",
        rating: 4.2,
        stok: 50),
    Item(
        name: 'Salt',
        price: 2000,
        gambar: 'images/salt.png',
        rating: 4.4,
        stok: 40),
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          title: const Text('Shoping list'),
        ),
        body: Container(
            margin: const EdgeInsets.all(8),
            child: GridView.builder(
                gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
                  crossAxisCount: 2, // Jumlah kolom dalam grid
                  crossAxisSpacing: 8.0, // Jarak antar kolom
                  mainAxisSpacing: 8.0, // Jarak antar baris
                  childAspectRatio: 0.7, // Mengatur rasio aspek item grid
                ),
                padding: EdgeInsets.all(8),
                itemCount: items.length,
                itemBuilder: (context, index) {
                  final item = items[index];
                  return ProductCard(item: item);
                })),
        bottomNavigationBar: const Footer());
  }
}
