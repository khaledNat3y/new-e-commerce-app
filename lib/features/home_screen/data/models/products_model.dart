// To parse this JSON data, do
//
//     final productModel = productModelFromJson(jsonString);

import 'package:meta/meta.dart';
import 'dart:convert';

ProductsModel productModelFromJson(String str) => ProductsModel.fromJson(json.decode(str));

String productModelToJson(ProductsModel data) => json.encode(data.toJson());

class ProductsModel {
  final int results;
  final Metadata metadata;
  final List<ProductDatum> data;

  ProductsModel({
    required this.results,
    required this.metadata,
    required this.data,
  });

  factory ProductsModel.fromJson(Map<String, dynamic> json) => ProductsModel(
    results: json["results"] ?? 0,
    metadata: Metadata.fromJson(json["metadata"] ?? {}),
    data: List<ProductDatum>.from((json["data"] ?? []).map((x) => ProductDatum.fromJson(x))),
  );

  Map<String, dynamic> toJson() => {
    "results": results,
    "metadata": metadata.toJson(),
    "data": List<dynamic>.from(data.map((x) => x.toJson())),
  };
}

class ProductDatum {
  final int sold;
  final List<String> images;
  final List<CategoryClass> subcategory;
  final int ratingsQuantity;
  final String id;
  final String title;
  final String slug;
  final String description;
  final int quantity;
  final int price;
  final String imageCover;
  final CategoryClass category;
  final dynamic brand;
  final double ratingsAverage;
  final DateTime createdAt;
  final DateTime updatedAt;
  final String datumId;
  final int priceAfterDiscount;
  final List<dynamic> availableColors;

  ProductDatum({
    required this.sold,
    required this.images,
    required this.subcategory,
    required this.ratingsQuantity,
    required this.id,
    required this.title,
    required this.slug,
    required this.description,
    required this.quantity,
    required this.price,
    required this.imageCover,
    required this.category,
    required this.brand,
    required this.ratingsAverage,
    required this.createdAt,
    required this.updatedAt,
    required this.datumId,
    required this.priceAfterDiscount,
    required this.availableColors,
  });

  factory ProductDatum.fromJson(Map<String, dynamic> json) => ProductDatum(
    sold: json["sold"] ?? 0,
    images: List<String>.from((json["images"] ?? []).map((x) => x?.toString() ?? "")),
    subcategory: List<CategoryClass>.from((json["subcategory"] ?? []).map((x) => CategoryClass.fromJson(x))),
    ratingsQuantity: json["ratingsQuantity"] ?? 0,
    id: json["_id"] ?? "",
    title: json["title"] ?? "",
    slug: json["slug"] ?? "",
    description: json["description"] ?? "",
    quantity: json["quantity"] ?? 0,
    price: json["price"] ?? 0,
    imageCover: json["imageCover"] ?? "",
    category: CategoryClass.fromJson(json["category"] ?? {}),
    brand: json["brand"],
    ratingsAverage: (json["ratingsAverage"] ?? 0).toDouble(),
    createdAt: json["createdAt"] != null ? DateTime.parse(json["createdAt"]) : DateTime.now(),
    updatedAt: json["updatedAt"] != null ? DateTime.parse(json["updatedAt"]) : DateTime.now(),
    datumId: json["id"] ?? "",
    priceAfterDiscount: json["priceAfterDiscount"] ?? 0,
    availableColors: List<dynamic>.from((json["availableColors"] ?? []).map((x) => x)),
  );

  Map<String, dynamic> toJson() => {
    "sold": sold,
    "images": List<dynamic>.from(images.map((x) => x)),
    "subcategory": List<dynamic>.from(subcategory.map((x) => x.toJson())),
    "ratingsQuantity": ratingsQuantity,
    "_id": id,
    "title": title,
    "slug": slug,
    "description": description,
    "quantity": quantity,
    "price": price,
    "imageCover": imageCover,
    "category": category.toJson(),
    "brand": brand,
    "ratingsAverage": ratingsAverage,
    "createdAt": createdAt.toIso8601String(),
    "updatedAt": updatedAt.toIso8601String(),
    "id": datumId,
    "priceAfterDiscount": priceAfterDiscount,
    "availableColors": List<dynamic>.from(availableColors.map((x) => x)),
  };
}

class CategoryClass {
  final String id;
  final String name;
  final String slug;
  final String image;
  final CategoryEnum? category;  // Made nullable

  CategoryClass({
    required this.id,
    required this.name,
    required this.slug,
    required this.image,
    this.category,  // No longer required
  });

  factory CategoryClass.fromJson(Map<String, dynamic> json) => CategoryClass(
    id: json["_id"] ?? "",
    name: json["name"] ?? "",
    slug: json["slug"] ?? "",
    image: json["image"] ?? "",
    category: json["category"] != null ? categoryEnumValues.map[json["category"]] : null,
  );

  Map<String, dynamic> toJson() => {
    "_id": id,
    "name": name,
    "slug": slug,
    "image": image,
    "category": category != null ? categoryEnumValues.reverse[category!] : null,
  };
}

enum CategoryEnum {
  THE_6439_D2_D167_D9_AA4_CA970649_F,
  THE_6439_D58_A0049_AD0_B52_B9003_F,
  THE_6439_D5_B90049_AD0_B52_B90048
}

final categoryEnumValues = EnumValues({
  "6439d2d167d9aa4ca970649f": CategoryEnum.THE_6439_D2_D167_D9_AA4_CA970649_F,
  "6439d58a0049ad0b52b9003f": CategoryEnum.THE_6439_D58_A0049_AD0_B52_B9003_F,
  "6439d5b90049ad0b52b90048": CategoryEnum.THE_6439_D5_B90049_AD0_B52_B90048
});

class Metadata {
  final int currentPage;
  final int numberOfPages;
  final int limit;
  final int nextPage;

  Metadata({
    required this.currentPage,
    required this.numberOfPages,
    required this.limit,
    required this.nextPage,
  });

  factory Metadata.fromJson(Map<String, dynamic> json) => Metadata(
    currentPage: json["currentPage"] ?? 1,
    numberOfPages: json["numberOfPages"] ?? 1,
    limit: json["limit"] ?? 10,
    nextPage: json["nextPage"] ?? 1,
  );

  Map<String, dynamic> toJson() => {
    "currentPage": currentPage,
    "numberOfPages": numberOfPages,
    "limit": limit,
    "nextPage": nextPage,
  };
}

class EnumValues<T> {
  Map<String, T> map;
  late Map<T, String> reverseMap;

  EnumValues(this.map);

  Map<T, String> get reverse {
    reverseMap = map.map((k, v) => MapEntry(v, k));
    return reverseMap;
  }
}