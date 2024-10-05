import 'package:flutter/material.dart';
import 'package:flutter_basic/models/item.dart';

class ItemPage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    final itemArgs = ModalRoute.of(context)!.settings.arguments as Item;
    return Scaffold(
      appBar: AppBar(
        title: const Text('Shoping list'),
      ),
      body: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Hero(
            tag: 'item ${itemArgs.name}',
            child: Image.asset(
              itemArgs.gambar,
              height: 300,
              width: double.infinity,
              fit: BoxFit.cover,
            ),
          ),
          Container(
            padding: const EdgeInsets.all(25),
            child: Column(
              children: [
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Text(
                      'Rp.${itemArgs.price}',
                      style: const TextStyle(
                        fontSize: 18,
                        color: Colors.green,
                      ),
                    ),
                    Text(
                      ' Stok : ${itemArgs.stok}',
                      style: const TextStyle(
                        fontSize: 18,
                      ),
                    ),
                  ],
                ),
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Text(
                      itemArgs.name,
                      style: const TextStyle(
                          fontSize: 24, fontWeight: FontWeight.bold),
                    ),
                    Row(
                      children: [
                        Text(
                          '${itemArgs.rating}',
                          style: const TextStyle(fontSize: 20),
                        ),
                        const Icon(Icons.star,
                            color: Color.fromARGB(255, 212, 157, 4))
                      ],
                    )
                  ],
                )
              ],
            ),
          )
        ],
      ),
    );
  }
}
