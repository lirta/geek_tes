import 'dart:convert';

import 'package:geek_garden/model/ProductsModel.dart';

import 'package:http/http.dart' as http;

class ApiService {
  String baseUrl = 'https://fakestoreapi.com';

  Future<List<ProductModel>> getProducts() async {
    var url = '$baseUrl/products';

    var headers = {'Content-Type': 'application/json'};
    var response = await http.get(Uri.parse("$baseUrl/products"));
    // var response = await http.get(Uri.parse(url, headers:headers));
    if (response.statusCode == 200) {
      List data = jsonDecode(response.body);
      List<ProductModel> products = [];
      for (var item in data) {
        products.add(ProductModel.fromJson(item));
      }
      print("service");
      print(products);

      return products;
    } else {
      throw Exception('Gagal Get Products!');
    }
  }
}
