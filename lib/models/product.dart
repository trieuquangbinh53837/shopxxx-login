// To parse this JSON data, do
//
//     final product = productFromJson(jsonString);

import 'dart:convert';
import 'package:get/get.dart';

List<Product> productFromJson(String str) =>
    List<Product>.from(json.decode(str).map((x) => Product.fromJson(x)));

String productToJson(List<Product> data) =>
    json.encode(List<dynamic>.from(data.map((x) => x.toJson())));

// class Product {
//   Product({
//     this.greeting,
//     this.instructions,
//   });

//   String greeting;
//   List<List<Instruction>> instructions;

//   factory Product.fromJson(Map<String, dynamic> json) => Product(
//         greeting: json["greeting"],
//         instructions: List<List<Instruction>>.from(json["instructions"].map(
//             (x) =>
//                 List<Instruction>.from(x.map((x) => Instruction.fromJson(x))))),
//       );

//   Map<String, dynamic> toJson() => {
//         "greeting": greeting,
//         "instructions": List<dynamic>.from(instructions
//             .map((x) => List<dynamic>.from(x.map((x) => x.toJson())))),
//       };
// }

class Product {
  Product({
    this.brand,
    this.name,
    this.price,
    this.priceSign,
    this.currency,
    this.imageLink,
    this.productLink,
    this.websiteLink,
    this.description,
    this.rating,
    this.category,
    this.productType,
    this.tagList,
    this.createdAt,
    this.updatedAt,
    this.productApiUrl,
    this.apiFeaturedImage,
    this.productColors,
    this.id,
  });

  String brand;
  String name;
  String price;
  dynamic priceSign;
  dynamic currency;
  String imageLink;
  String productLink;
  String websiteLink;
  String description;
  int rating;
  String category;
  String productType;
  String tagList;
  int createdAt;
  int updatedAt;
  String productApiUrl;
  String apiFeaturedImage;
  String productColors;
  String id;

  var isFavorite = false.obs;

  factory Product.fromJson(Map<String, dynamic> json) => Product(
        brand: json["brand"],
        name: json["name"],
        price: json["price"],
        priceSign: json["priceSign"],
        currency: json["currency"],
        imageLink: json["imageLink"],
        productLink: json["productLink"],
        websiteLink: json["websiteLink"],
        description: json["description"],
        rating: json["rating"],
        category: json["category"],
        productType: json["productType"],
        tagList: json["tagList"],
        createdAt: json["createdAt"],
        updatedAt: json["updatedAt"],
        productApiUrl: json["productApiUrl"],
        apiFeaturedImage: json["apiFeaturedImage"],
        productColors: json["productColors"],
        id: json["id"],
      );

  Map<String, dynamic> toJson() => {
        "brand": brand,
        "name": name,
        "price": price,
        "priceSign": priceSign.toJson(),
        "currency": currency.toJson(),
        "imageLink": imageLink,
        "productLink": productLink,
        "websiteLink": websiteLink,
        "description": description,
        "rating": rating,
        "category": category,
        "productType": productType,
        "tagList": tagList,
        "createdAt": createdAt,
        "updatedAt": updatedAt,
        "productApiUrl": productApiUrl,
        "apiFeaturedImage": apiFeaturedImage,
        "productColors": productColors,
        "id": id,
      };
}

enum Brand { MAYBELLINE }

final brandValues = EnumValues({"maybelline": Brand.MAYBELLINE});

class ProductColor {
  ProductColor({
    this.hexValue,
    this.colourName,
  });

  String hexValue;
  String colourName;

  factory ProductColor.fromJson(Map<String, dynamic> json) => ProductColor(
        hexValue: json["hex_value"],
        colourName: json["colour_name"] == null ? null : json["colour_name"],
      );

  Map<String, dynamic> toJson() => {
        "hex_value": hexValue,
        "colour_name": colourName == null ? null : colourName,
      };
}

class EnumValues<T> {
  Map<String, T> map;
  Map<T, String> reverseMap;

  EnumValues(this.map);

  Map<T, String> get reverse {
    if (reverseMap == null) {
      reverseMap = map.map((k, v) => new MapEntry(v, k));
    }
    return reverseMap;
  }
}
