import 'package:flutter/material.dart';
import 'package:flutter_course/models/catalog.dart';

class ItemWidget extends StatelessWidget {
  final Item item;
  const ItemWidget({Key? key, required this.item})
      : assert(item != null),
        super(key: key);

  @override
  Widget build(BuildContext context) {
    return Card(
      child: GridTile(
        child: Image.network(item.image),
        header: Container(
          padding: EdgeInsets.all(10),
          child: Text(
            item.name,
            style: TextStyle(color: Colors.white),
          ),
          decoration: BoxDecoration(color: Colors.deepPurple),
        ),
        footer: Container(
          padding: EdgeInsets.all(10),
          child: Text(
            item.price.toString(),
            style: TextStyle(color: Colors.white),
          ),
          decoration: BoxDecoration(color: Colors.deepPurple),
        ),
      ),
    );
    // return Card(
    //   child: ListTile(
    //     leading: Image.network(item.image),
    //     title: Text(item.name),
    //     subtitle: Text(item.desc),
    //     trailing: Text(
    //       "\$${item.price}",
    //       textScaleFactor: 1.25,
    //       style: TextStyle(fontWeight: FontWeight.bold),
    //     ),
    //   ),
    // );
  }
}
