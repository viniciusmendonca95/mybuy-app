import 'package:app/models/productShoppingCart.dart';
import 'package:app/models/purchaseStatus.dart';

class ShoppingCart {
  String id;
  String userId;
  String purchaseStatusId;
  PurchaseStatus purchaseStatus;
  int subTotal;
  List<ProductShoppingCarts> productShoppingCarts;

  ShoppingCart(
      {this.id,
      this.userId,
      this.purchaseStatusId,
      this.purchaseStatus,
      this.subTotal,
      this.productShoppingCarts});

  ShoppingCart.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    userId = json['userId'];
    purchaseStatusId = json['purchaseStatusId'];
    subTotal = json['subTotal'];
    purchaseStatus = json['purchaseStatus'] != null
        ? new PurchaseStatus.fromJson(json['purchaseStatus'])
        : null;
    if (json['productShoppingCarts'] != null) {
      productShoppingCarts = new List<ProductShoppingCarts>();
      json['productShoppingCarts'].forEach((v) {
        productShoppingCarts.add(new ProductShoppingCarts.fromJson(v));
      });
    } 
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['id'] = this.id;
    data['userId'] = this.userId;
    data['subTotal'] = this.subTotal;
    data['purchaseStatusId'] = this.purchaseStatusId;
    if (this.purchaseStatus != null) {
      data['purchaseStatus'] = this.purchaseStatus.toJson();
    }
    if (this.productShoppingCarts != null) {
      data['productShoppingCarts'] =
          this.productShoppingCarts.map((v) => v.toJson()).toList();
    }
    return data;
  }
}
