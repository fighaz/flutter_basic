import 'package:flutter/material.dart';
import 'package:flutter_basic/models/item.dart';

class ProductCard extends StatelessWidget {
  final Item item;

  const ProductCard({super.key, required this.item});

  @override
  Widget build(BuildContext context) {
    // TODO: implement build
    return InkWell(
      onTap: () {
        Navigator.pushNamed(context, '/item', arguments: item);
      },
      child: Card(
        child: Container(
          margin: const EdgeInsets.all(8),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Expanded(
                child: Hero(
                  tag: 'item ${item.name}', // unik untuk tiap item
                  child: Image.asset(
                    item.gambar,
                    height: double.infinity,
                    width: double.infinity,
                    fit: BoxFit.cover,
                  ),
                ),
              ),
              const SizedBox(height: 8),
              Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Row(
                    crossAxisAlignment: CrossAxisAlignment.center,
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Expanded(
                        child: Text(
                          item.name,
                          style: const TextStyle(
                            fontSize: 16,
                            fontWeight: FontWeight.bold,
                          ),
                          overflow: TextOverflow
                              .ellipsis, // Agar teks yang panjang terpotong
                        ),
                      ),
                      Row(
                        children: [
                          Text('${item.rating}'),
                          const Icon(Icons.star,
                              color: Color.fromARGB(255, 212, 157, 4)),
                        ],
                      ),
                    ],
                  ),
                  const SizedBox(height: 4),
                  Text(
                    'Rp.${item.price}',
                    style: const TextStyle(
                      fontSize: 14,
                      color: Colors.green,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                  Text('Stok ${item.stok}'),
                ],
              ),
            ],
          ),
        ),
      ),
    );
  }
}
