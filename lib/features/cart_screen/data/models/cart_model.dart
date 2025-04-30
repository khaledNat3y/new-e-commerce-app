// To parse this JSON data, do
//
//     final cartModel = cartModelFromMap(jsonString);

import 'dart:convert';

CartModel cartModelFromMap(String str) => CartModel.fromMap(json.decode(str));

String cartModelToMap(CartModel data) => json.encode(data.toMap());

class CartModel {
  int? id;
  int? userId;
  DateTime? date;
  List<Product>? products;
  int? v;

  CartModel({
    this.id,
    this.userId,
    this.date,
    this.products,
    this.v,
  });

  factory CartModel.fromMap(Map<String, dynamic> json) => CartModel(
    id: json["id"],
    userId: json["userId"],
    date: json["date"] == null ? null : DateTime.parse(json["date"]),
    products: json["products"] == null ? [] : List<Product>.from(json["products"]!.map((x) => Product.fromMap(x))),
    v: json["__v"],
  );

  Map<String, dynamic> toMap() => {
    "id": id,
    "userId": userId,
    "date": date?.toIso8601String(),
    "products": products == null ? [] : List<dynamic>.from(products!.map((x) => x.toMap())),
    "__v": v,
  };
}

class Product {
  int? productId;
  int? quantity;

  Product({
    this.productId,
    this.quantity,
  });

  factory Product.fromMap(Map<String, dynamic> json) => Product(
    productId: json["productId"],
    quantity: json["quantity"],
  );

  Map<String, dynamic> toMap() => {
    "productId": productId,
    "quantity": quantity,
  };
}
