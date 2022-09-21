// import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:geek_garden/model/ProductsModel.dart';
import 'package:geek_garden/network/ApiService.dart';

class ApiProvider with ChangeNotifier {
  List<ProductModel> _products = [];

  List<ProductModel> get products => _products;

  set products(List<ProductModel> products) {
    _products = products;
    notifyListeners();
  }

  Future<void> getProducts() async {
    try {
      List<ProductModel> products = await ApiService().getProducts();
      _products = products;
    } catch (e) {
      print(e);
    }
  }
}
