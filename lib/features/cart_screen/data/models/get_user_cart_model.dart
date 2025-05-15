// To parse this JSON data, do
//
//     final getUserCartModel = getUserCartModelFromMap(jsonString);

import 'dart:convert';

GetUserCartModel getUserCartModelFromMap(String str) => GetUserCartModel.fromMap(json.decode(str));

String getUserCartModelToMap(GetUserCartModel data) => json.encode(data.toMap());

class GetUserCartModel {
  String? status;
  int? numOfCartItems;
  String? cartId;
  Data? data;

  GetUserCartModel({
    this.status,
    this.numOfCartItems,
    this.cartId,
    this.data,
  });

  factory GetUserCartModel.fromMap(Map<String, dynamic> json) => GetUserCartModel(
    status: json["status"],
    numOfCartItems: json["numOfCartItems"],
    cartId: json["cartId"],
    data: json["data"] == null ? null : Data.fromMap(json["data"]),
  );

  Map<String, dynamic> toMap() => {
    "status": status,
    "numOfCartItems": numOfCartItems,
    "cartId": cartId,
    "data": data?.toMap(),
  };
}

class Data {
  String? id;
  String? cartOwner;
  List<ProductElement>? products;
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
    products: json["products"] == null ? [] : List<ProductElement>.from(json["products"]!.map((x) => ProductElement.fromMap(x))),
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

class ProductElement {
  int? count;
  String? id;
  ProductProduct? product;
  int? price;

  ProductElement({
    this.count,
    this.id,
    this.product,
    this.price,
  });

  factory ProductElement.fromMap(Map<String, dynamic> json) => ProductElement(
    count: json["count"],
    id: json["_id"],
    product: json["product"] == null ? null : ProductProduct.fromMap(json["product"]),
    price: json["price"],
  );

  Map<String, dynamic> toMap() => {
    "count": count,
    "_id": id,
    "product": product?.toMap(),
    "price": price,
  };
}

class ProductProduct {
  List<Category>? subcategory;
  String? id;
  String? title;
  int? quantity;
  String? imageCover;
  Category? category;
  dynamic brand;
  double? ratingsAverage;
  String? productId;

  ProductProduct({
    this.subcategory,
    this.id,
    this.title,
    this.quantity,
    this.imageCover,
    this.category,
    this.brand,
    this.ratingsAverage,
    this.productId,
  });

  factory ProductProduct.fromMap(Map<String, dynamic> json) => ProductProduct(
    subcategory: json["subcategory"] == null ? [] : List<Category>.from(json["subcategory"]!.map((x) => Category.fromMap(x))),
    id: json["_id"],
    title: json["title"],
    quantity: json["quantity"],
    imageCover: json["imageCover"],
    category: json["category"] == null ? null : Category.fromMap(json["category"]),
    brand: json["brand"],
    ratingsAverage: json["ratingsAverage"]?.toDouble(),
    productId: json["id"],
  );

  Map<String, dynamic> toMap() => {
    "subcategory": subcategory == null ? [] : List<dynamic>.from(subcategory!.map((x) => x.toMap())),
    "_id": id,
    "title": title,
    "quantity": quantity,
    "imageCover": imageCover,
    "category": category?.toMap(),
    "brand": brand,
    "ratingsAverage": ratingsAverage,
    "id": productId,
  };
}

class Category {
  String? id;
  String? name;
  String? slug;
  String? image;
  String? category;

  Category({
    this.id,
    this.name,
    this.slug,
    this.image,
    this.category,
  });

  factory Category.fromMap(Map<String, dynamic> json) => Category(
    id: json["_id"],
    name: json["name"],
    slug: json["slug"],
    image: json["image"],
    category: json["category"],
  );

  Map<String, dynamic> toMap() => {
    "_id": id,
    "name": name,
    "slug": slug,
    "image": image,
    "category": category,
  };
}
