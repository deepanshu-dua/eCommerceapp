class catalogModel {
  static List<Item> Items = [
    Item(
        id: "codepur",
        name: "i phone 12 pro",
        desc: "about 12th generation",
        image:
            "https://maplestore.in/wp-content/uploads/2020/10/iPhone-12-Pro.jpg",
        color: "#33505a",
        price: 999)
  ];
}

class Item {
  late final String id;
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
}
