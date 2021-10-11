import 'package:app/models/product.dart';

class ProductShoppingCarts {
  String productId;
  String shoppingCartId;
  int quantity;
  Product product;

  ProductShoppingCarts(
      {this.productId, this.shoppingCartId, this.quantity, this.product});

  ProductShoppingCarts.fromJson(Map<String, dynamic> json) {
    productId = json['productId'];
    shoppingCartId = json['shoppingCartId'];
    quantity = json['quantity'];
    product =
        json['product'] != null ? new Product.fromJson(json['product']) : null;
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['productId'] = this.productId;
    data['shoppingCartId'] = this.shoppingCartId;
    data['quantity'] = this.quantity;
    if (this.product != null) {
      data['product'] = this.product.toJson();
    }
    return data;
  }
}
