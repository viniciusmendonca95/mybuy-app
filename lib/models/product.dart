import 'category.dart';
import 'complementaryProductData.dart';
import 'photos.dart';

class Product {
  String id;
  String name;
  String description;
  String categoryId;
  int price;
  int quantity;
  Category category;
  ComplementaryProductData complementaryProductData;
  List<Photos> photos;

  Product(
      {this.id,
      this.name,
      this.description,
      this.categoryId,
      this.price,
      this.quantity,
      this.category,
      this.complementaryProductData,
      this.photos});

  Product.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    name = json['name'];
    description = json['description'];
    categoryId = json['categoryId'];
    price = json['price'];
    quantity = json['quantity'];
    category = json['category'] != null
        ? new Category.fromJson(json['category'])
        : null;
    complementaryProductData = json['complementaryProductData'] != null
        ? new ComplementaryProductData.fromJson(
            json['complementaryProductData'])
        : null;
    if (json['photos'] != null) {
      photos = new List<Photos>();
      json['photos'].forEach((v) {
        photos.add(new Photos.fromJson(v));
      });
    }
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['id'] = this.id;
    data['name'] = this.name;
    data['description'] = this.description;
    data['categoryId'] = this.categoryId;
    data['price'] = this.price;
    data['quantity'] = this.quantity;
    if (this.category != null) {
      data['category'] = this.category.toJson();
    }
    if (this.complementaryProductData != null) {
      data['complementaryProductData'] = this.complementaryProductData.toJson();
    }
    if (this.photos != null) {
      data['photos'] = this.photos.map((v) => v.toJson()).toList();
    }
    return data;
  }
}
