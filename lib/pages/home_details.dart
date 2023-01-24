import 'package:flutter/material.dart';
import 'package:flutter_course/models/catalog.dart';
import 'package:flutter_course/themes.dart';
import 'package:flutter_course/widget/add_to_cart.dart';
import 'package:velocity_x/velocity_x.dart';

class HomeDetailsPage extends StatelessWidget {
  final Item catalog;

  const HomeDetailsPage({Key? key, required this.catalog})
      : assert(catalog != null),
        super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(),
      backgroundColor: MyTheme.creamColor,
      bottomNavigationBar: ButtonBar(
        alignment: MainAxisAlignment.spaceBetween,
        buttonPadding: Vx.mH4,
        children: [
          "\$${catalog.price}".text.xl3.red800.bold.make(),
          AddToCart(
            catalog: catalog,
          ).wh(130, 50)
        ],
      ).p32(),
      body: SafeArea(
        bottom: false,
        child: Column(
          children: [
            Hero(
              tag: Key(
                catalog.id.toString(),
              ),
              child: Image.network(catalog.image),
            ).h32(context).p12(),
            Expanded(
                child: VxArc(
              arcType: VxArcType.CONVEY,
              edge: VxEdge.TOP,
              height: 30.0,
              child: Container(
                width: context.screenWidth,
                color: Color.fromARGB(255, 234, 228, 228),
                child: Column(
                  children: [
                    catalog.name.text.xl4.color(MyTheme.darkBluish).bold.make(),
                    catalog.desc.text.xl.make(),
                    10.heightBox,
                    "About this item Feel a little closer with fast 5G The amazing camera that just keeps getting better A great view. No matter where you are The amazing camera that just keeps getting better Built for security, inside and out"
                        .text
                        .center
                        .textStyle(context.captionStyle)
                        .lg
                        .make()
                        .p8()
                  ],
                ).py64(),
              ),
            ))
          ],
        ),
      ),
    );
  }
}
