import 'package:flutter/material.dart';
import 'package:flutter_course/models/cart.dart';
import 'package:flutter_course/themes.dart';
import 'package:velocity_x/velocity_x.dart';

import '../core/store.dart';

class CartPage extends StatelessWidget {
  const CartPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: MyTheme.creamColor,
      appBar: AppBar(
        title: "Cart".text.make(),
      ),
      body: Column(
        children: [
          _CartList().p32().expand(),
          Divider(),
          _CartTotal(),
        ],
      ),
    );
  }
}

class _CartTotal extends StatelessWidget {
  const _CartTotal({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final CartModel _cart = (VxState.store as MyStore).cart;
    return SizedBox(
      height: 200,
      child: Row(mainAxisAlignment: MainAxisAlignment.spaceAround, children: [
        VxConsumer(
            notifications: {},
            mutations: {RemoveMutation},
            builder: (BuildContext, dynamic, vxstatus) {
              return "\$${_cart.totalPrice}"
                  .text
                  .xl5
                  .color(context.accentColor)
                  .make();
            }),
        30.widthBox,
        ElevatedButton(
          onPressed: () {
            ScaffoldMessenger.of(context).showSnackBar(
                SnackBar(content: "buying not supported yet".text.make()));
          },
          style: ButtonStyle(
              backgroundColor: MaterialStateProperty.all(context.cardColor)),
          child: "Buy".text.make(),
        ).w32(context)
      ]),
    );
  }
}

class _CartList extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    VxState.watch(context, on: [RemoveMutation]);
    final CartModel _cart = (VxState.store as MyStore).cart;
    return _cart.items!.isEmpty
        ? "Nothing to show".text.xl3.makeCentered()
        : ListView.builder(
            itemCount: _cart.items?.length,
            itemBuilder: (context, index) => ListTile(
                  leading: Icon(Icons.done),
                  trailing: IconButton(
                    icon: Icon(Icons.remove_circle_outline),
                    onPressed: () =>
                        // _cart.remove(_cart.items![index]);
                        RemoveMutation(_cart.items![index]),
                  ),
                  title: _cart.items![index].name.text.make(),
                ));
  }
}
