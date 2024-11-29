import 'package:flutter/material.dart';
import 'models/pizza.dart';
import 'httphelper.dart';

class PizzaDetailScreen extends StatefulWidget {
  final Pizza pizza;
  final bool isNew;

  const PizzaDetailScreen(
      {super.key, required this.pizza, required this.isNew});
  @override
  State<PizzaDetailScreen> createState() => _PizzaDetailScreenState();
}

class _PizzaDetailScreenState extends State<PizzaDetailScreen> {
  final TextEditingController txtId = TextEditingController();
  final TextEditingController txtName = TextEditingController();
  final TextEditingController txtPrice = TextEditingController();
  final TextEditingController txtDescription = TextEditingController();
  final TextEditingController txtImageUrl = TextEditingController();

  String operationResult = '';

  @override
  void dispose() {
    txtId.dispose();
    txtName.dispose();
    txtPrice.dispose();
    txtDescription.dispose();
    txtImageUrl.dispose();
    super.dispose();
  }

  Future postPizza() async {
    Httphelper helper = Httphelper();
    int id = int.parse(txtId.text);
    String pizzaName = txtName.text;
    double price = double.parse(txtPrice.text);
    String description = txtDescription.text;
    String imageUrl = txtImageUrl.text;
    Pizza pizza = Pizza(
        id: id,
        pizzaName: pizzaName,
        description: description,
        price: price,
        imageUrl: imageUrl);
    String result =
        await (widget.isNew ? helper.postPizza(pizza) : helper.putPizza(pizza));

    setState(() {
      operationResult = result;
    });
  }

  @override
  void initState() {
    if (!widget.isNew) {
      txtId.text = widget.pizza.id.toString();
      txtName.text = widget.pizza.pizzaName;
      txtPrice.text = widget.pizza.description;
      txtPrice.text = widget.pizza.price.toString();
      txtDescription.text = widget.pizza.imageUrl;
    }
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          title: const Text('Pizza Detail'),
        ),
        body: Padding(
          padding: const EdgeInsets.all(12.0),
          child: SingleChildScrollView(
            child: Column(
              children: [
                Text(
                  operationResult,
                  style: TextStyle(
                    backgroundColor: Colors.green[200],
                    color: Colors.black,
                  ),
                ),
                const SizedBox(height: 24),
                TextField(
                    controller: txtId,
                    decoration: const InputDecoration(hintText: 'Insert Id')),
                const SizedBox(height: 24),
                TextField(
                  controller: txtName,
                  decoration:
                      const InputDecoration(hintText: 'Insert Pizza Name'),
                ),
                const SizedBox(
                  height: 24,
                ),
                TextField(
                  controller: txtDescription,
                  decoration: const InputDecoration(
                      hintText: 'Insert Pizza Description'),
                ),
                const SizedBox(
                  height: 24,
                ),
                TextField(
                  controller: txtPrice,
                  decoration: const InputDecoration(hintText: "Insert Price"),
                ),
                const SizedBox(height: 24),
                TextField(
                  controller: txtImageUrl,
                  decoration:
                      const InputDecoration(hintText: 'Insert Image Url'),
                ),
                const SizedBox(
                  height: 48,
                ),
                ElevatedButton(
                    child: const Text('Send Post'),
                    onPressed: () {
                      postPizza();
                    })
              ],
            ),
          ),
        ));
  }
}
