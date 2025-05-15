// To parse this JSON data, do
//
//     final categoriesModel = categoriesModelFromMap(jsonString);

import 'dart:convert';

import 'package:new_e_commerce_app/features/home_screen/data/models/products_model.dart';

CategoriesModel categoriesModelFromMap(String str) => CategoriesModel.fromMap(json.decode(str));

String categoriesModelToMap(CategoriesModel data) => json.encode(data.toMap());

class CategoriesModel {
  int? results;
  Metadata? metadata;
  List<Datum>? data;

  CategoriesModel({
    this.results,
    this.metadata,
    this.data,
  });

  factory CategoriesModel.fromMap(Map<String, dynamic> json) => CategoriesModel(
    results: json["results"],
    metadata: json["metadata"] == null ? null : Metadata.fromMap(json["metadata"]),
    data: json["data"] == null ? [] : List<Datum>.from(json["data"]!.map((x) => Datum.fromMap(x))),
  );

  Map<String, dynamic> toMap() => {
    "results": results,
    "metadata": metadata?.toMap(),
    "data": data == null ? [] : List<dynamic>.from(data!.map((x) => x.toMap())),
  };
}
class Datum {
  String? id;
  String? name;
  String? slug;
  String? image;
  DateTime? createdAt;
  DateTime? updatedAt;

  Datum({
    this.id,
    this.name,
    this.slug,
    this.image,
    this.createdAt,
    this.updatedAt,
  });

  factory Datum.fromMap(Map<String, dynamic> json) => Datum(
    id: json["_id"],
    name: json["name"],
    slug: json["slug"],
    image: json["image"],
    createdAt: json["createdAt"] == null ? null : DateTime.parse(json["createdAt"]),
    updatedAt: json["updatedAt"] == null ? null : DateTime.parse(json["updatedAt"]),
  );

  Map<String, dynamic> toMap() => {
    "_id": id,
    "name": name,
    "slug": slug,
    "image": image,
    "createdAt": createdAt?.toIso8601String(),
    "updatedAt": updatedAt?.toIso8601String(),
  };
}

class Metadata {
  int? currentPage;
  int? numberOfPages;
  int? limit;

  Metadata({
    this.currentPage,
    this.numberOfPages,
    this.limit,
  });

  factory Metadata.fromMap(Map<String, dynamic> json) => Metadata(
    currentPage: json["currentPage"],
    numberOfPages: json["numberOfPages"],
    limit: json["limit"],
  );

  Map<String, dynamic> toMap() => {
    "currentPage": currentPage,
    "numberOfPages": numberOfPages,
    "limit": limit,
  };
}
