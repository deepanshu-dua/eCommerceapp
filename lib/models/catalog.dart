import 'package:flutter/foundation.dart';

class catalogModel {
  static List<Item>? Items = null;
}

class Item {
  late final int id;
  late final String name;
  late final String desc;
  late final num price;
  late final String color;
  late final String image;

  Item(
      {required this.id,
      required this.name,
      required this.desc,
      required this.image,
      required this.color,
      required this.price});

  // factory Item.fromMap(Map<String , dynamic> map)   {}
  factory Item.fromMap(Map<String, dynamic> map) {
    return Item(
      id: map["id"],
      name: map["name"],
      desc: map["desc"],
      price: map["price"],
      color: map["color"],
      image: map["image"],
    );
  }

  toMap() => {
        " id ": id,
        " name ": name,
        " desc ": desc,
        " price ": price,
        " color ": color,
        " image ": image
      };
}
