// To parse this JSON data, do
//
//     final cartModel = cartModelFromMap(jsonString);

import 'dart:convert';

CartModel cartModelFromMap(String str) => CartModel.fromMap(json.decode(str));

String cartModelToMap(CartModel data) => json.encode(data.toMap());

class CartModel {
  String? status;
  String? message;
  int? numOfCartItems;
  String? cartId;
  Data? data;

  CartModel({
    this.status,
    this.message,
    this.numOfCartItems,
    this.cartId,
    this.data,
  });

  factory CartModel.fromMap(Map<String, dynamic> json) => CartModel(
    status: json["status"],
    message: json["message"],
    numOfCartItems: json["numOfCartItems"],
    cartId: json["cartId"],
    data: json["data"] == null ? null : Data.fromMap(json["data"]),
  );

  Map<String, dynamic> toMap() => {
    "status": status,
    "message": message,
    "numOfCartItems": numOfCartItems,
    "cartId": cartId,
    "data": data?.toMap(),
  };
}

class Data {
  String? id;
  String? cartOwner;
  List<Product>? products;
  DateTime? createdAt;
  DateTime? updatedAt;
  int? v;
  int? totalCartPrice;

  Data({
    this.id,
    this.cartOwner,
    this.products,
    this.createdAt,
    this.updatedAt,
    this.v,
    this.totalCartPrice,
  });

  factory Data.fromMap(Map<String, dynamic> json) => Data(
    id: json["_id"],
    cartOwner: json["cartOwner"],
    products: json["products"] == null ? [] : List<Product>.from(json["products"]!.map((x) => Product.fromMap(x))),
    createdAt: json["createdAt"] == null ? null : DateTime.parse(json["createdAt"]),
    updatedAt: json["updatedAt"] == null ? null : DateTime.parse(json["updatedAt"]),
    v: json["__v"],
    totalCartPrice: json["totalCartPrice"],
  );

  Map<String, dynamic> toMap() => {
    "_id": id,
    "cartOwner": cartOwner,
    "products": products == null ? [] : List<dynamic>.from(products!.map((x) => x.toMap())),
    "createdAt": createdAt?.toIso8601String(),
    "updatedAt": updatedAt?.toIso8601String(),
    "__v": v,
    "totalCartPrice": totalCartPrice,
  };
}

class Product {
  int? count;
  String? id;
  String? product;
  int? price;

  Product({
    this.count,
    this.id,
    this.product,
    this.price,
  });

  factory Product.fromMap(Map<String, dynamic> json) => Product(
    count: json["count"],
    id: json["_id"],
    product: json["product"],
    price: json["price"],
  );

  Map<String, dynamic> toMap() => {
    "count": count,
    "_id": id,
    "product": product,
    "price": price,
  };
}
