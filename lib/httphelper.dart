import 'dart:io';
import 'package:flutter_basic/models/pizza.dart';
import 'package:http/http.dart' as http;
import 'dart:convert';
import 'models/pizza.dart';

class Httphelper {
  final String authority = "https://wm89g.wiremockapi.cloud/";
  final String path = "pizzalist";

  Future<List<Pizza>> getPizzaList() async {
    final Uri url = Uri.parse(authority + path);
    final http.Response result = await http.get(url);
    if (result.statusCode == HttpStatus.ok) {
      final jsonResponse = jsonDecode(result.body);
      final List<Pizza> pizzas =
          jsonResponse.map<Pizza>((i) => Pizza.fromJson(i)).toList();

      return pizzas;
    } else {
      return [];
    }
  }

  Future<String> postPizza(Pizza pizza) async {
    const postPath = "pizza";
    String post = json.encode(pizza.toJson());
    final Uri url = Uri.parse(authority + postPath);
    final http.Response result = await http.post(url, body: post);
    return result.body;
  }

  Future<String> putPizza(Pizza pizza) async {
    const putPath = "pizza";
    String put = json.encode(pizza.toJson());
    final Uri url = Uri.parse(authority + putPath);
    final http.Response result = await http.put(url, body: put);
    return result.body;
  }

  Future<String> deletePizza(int id) async {
    const deletePath = "pizza";
    final Uri url = Uri.parse(authority + deletePath);
    final http.Response result = await http.delete(url);
    return result.body;
  }
}
