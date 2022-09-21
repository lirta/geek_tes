import 'package:geek_garden/model/RatingModel.dart';

class ProductModel {
  int? id;
  String? title;
  double? price;
  String? description;
  String? category;
  String? image;
  RatingModel? rating;
  // DateTime createdAt;
  // DateTime updatedAt;
  // List<List> galleries;
  ProductModel(
      {this.id,
      this.title,
      this.price,
      this.description,
      this.category,
      this.image,
      this.rating});

  // ProductModel({
  //   this.id;
  // });

  // ProductModel.fromJson(json) {
  //   id = json['id'];
  //   title = json['title'];
  //   price = double.parse(json['price'].toString());
  //   description = json['description'];
  //   category = json['category'];
  //   image = json['image'];
  //   rating = RatingModel.fromJson(json['rating']);
  // }
  ProductModel.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    title = json['title'];
    price = double.parse(json['price'].toString());
    description = json['description'];
    category = json['category'];
    image = json['image'];
    rating = RatingModel.fromJson(json['rating']);
  }

  Map<String, dynamic> toJson() {
    return {
      'id': id,
      'name': title,
      'price': price,
      'description': description,
      'category': category,
      'image': image,
      'rating': rating,
    };
  }
}

class UninitializedProductModel extends ProductModel {}
