// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'dart:convert';
import 'dart:convert';
import 'dart:ffi';

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_course/models/cart.dart';
import 'package:flutter_course/pages/home_details.dart';
import 'package:flutter_course/utilities/routes.dart';
import 'package:velocity_x/velocity_x.dart';

import 'package:flutter_course/models/catalog.dart';
import 'package:flutter_course/themes.dart';
import 'package:flutter_course/widget/item_widget.dart';

import '../widget/add_to_cart.dart';
import '../widget/drawer.dart';

class HomePage extends StatefulWidget {
  const HomePage({Key? key}) : super(key: key);

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  final int days = 30;

  final String name = "deepanshu";

  @override
  void initState() {
    super.initState();
    loadData();
  }

  loadData() async {
    await Future.delayed(Duration(seconds: 2));
    final catalogJson =
        await rootBundle.loadString("assets/files/catalog.json");
    // print(catalogJson);
    var decodedData = jsonDecode(catalogJson);
    var productData = decodedData["products"];
    catalogModel.Items =
        List.from(productData).map<Item>((item) => Item.fromMap(item)).toList();
    setState(() {});
  }

  @override
  Widget build(BuildContext context) {
    // final dummyList = List.generate(50, (index) => catalogModel.Items[0]);
    return Scaffold(
      backgroundColor: MyTheme.creamColor,
      floatingActionButton: FloatingActionButton(
        onPressed: () => Navigator.pushNamed(context, MyRoutes.cartRoute),
        child: Icon(CupertinoIcons.cart),
        backgroundColor: MyTheme.darkBluish,
      ),
      body: SafeArea(
        child: Container(
          padding: Vx.m32,
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              CatalogHeader(),
              if (catalogModel.Items != null && catalogModel.Items!.isNotEmpty)
                CatalogList().expand()
              else
                CircularProgressIndicator().centered().expand(),
            ],
          ),
        ),
      ),
    );
  }
}

class CatalogHeader extends StatelessWidget {
  const CatalogHeader({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        "Catalog App".text.xl5.bold.color(MyTheme.darkBluish).make(),
        "Trending Products".text.xl3.make()
      ],
    );
  }
}

class CatalogList extends StatelessWidget {
  const CatalogList({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return ListView.builder(
        shrinkWrap: true,
        itemCount: catalogModel.Items!.length,
        itemBuilder: (context, index) {
          final catalog = catalogModel.Items![index];
          return InkWell(
              onTap: () => Navigator.push(
                    context,
                    MaterialPageRoute(
                      builder: (context) => HomeDetailsPage(catalog: catalog),
                    ),
                  ),
              child: CatalogItem(catalog: catalog));
        });
  }
}

class CatalogItem extends StatelessWidget {
  final Item catalog;
  const CatalogItem({
    Key? key,
    required this.catalog,
  })  : assert(catalog != null),
        super(key: key);

  @override
  Widget build(BuildContext context) {
    return VxBox(
        child: Row(
      children: [
        Hero(
          tag: Key(
            catalog.id.toString(),
          ),
          child: Image.network(
            catalog.image,
          ).box.rounded.p16.color(MyTheme.creamColor).make().p16().w40(context),
        ),
        Expanded(
            child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            catalog.name.text.lg.color(MyTheme.darkBluish).bold.make(),
            catalog.desc.text.make(),
            ButtonBar(
              alignment: MainAxisAlignment.spaceBetween,
              buttonPadding: Vx.mH4,
              children: [
                "\$${catalog.price}".text.bold.make(),
                AddToCart(catalog: catalog)
              ],
            )
          ],
        ))
      ],
    )).white.rounded.square(150).make().py16();
  }
}




      // appBar: AppBar(
      //   // backgroundColor: Colors.white,
      //   // elevation: 1,
      //   // iconTheme: IconThemeData(color: Colors.black),
      //   title: Text(
      //     "My App",
      //     // style: TextStyle(fontSize: 20),
      //   ),
      // ),
      // body: Padding(
      //   padding: const EdgeInsets.all(20.0),
      //   child: (catalogModel.Items != null && catalogModel.Items!.isNotEmpty)
      //       // ? GridView.builder(
      //       //     gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
      //       //         crossAxisCount: 2),
      //       //     itemBuilder: (context, index) {
      //       //       final item = catalogModel.Items![index];
      //       //       return GridTile(child: Image.network(item.image));
      //       //     },
      //       //     itemCount: catalogModel.Items!.length,
      //       //   )

      //       ? GridView.builder(
      //           gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
      //               crossAxisCount: 2,
      //               mainAxisSpacing: 17,
      //               crossAxisSpacing: 17),
      //           itemCount: catalogModel.Items!.length,
      //           itemBuilder: (context, index) {
      //             return ItemWidget(
      //               item: catalogModel.Items![index],
      //             );
      //           })



      //       // ? ListView.builder(
      //       //     itemCount: catalogModel.Items!.length,
      //       //     itemBuilder: (context, index) {
      //       //       return ItemWidget(
      //       //
      //       //     item: catalogModel.Items![index],
      //       //       );
      //       //     })
      //       : Center(
      //           child: CircularProgressIndicator(),
      //         ),
      // ),
      // drawer: MyDrawer(),