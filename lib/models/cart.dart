import 'package:flutter_course/models/catalog.dart';

class CartModel {
  late catalogModel _catalog;

  final List<int> _itemsIds = [];

  catalogModel get catalog => _catalog;

  set catalog(catalogModel newCatalog) {
    assert(newCatalog != null);
    _catalog = newCatalog;
  }

//  get the items in the cart
  List<Item>? get items => _itemsIds.map((id) => _catalog.getById(id)).toList();

// get total price
  num get totalPrice =>
      items!.fold(0, (total, current) => total + current.price);

  void add(Item item) {
    _itemsIds.add(item.id);

    void add(Item item) {
      _itemsIds.remove(item.id);
    }
  }

  void remove(Item item) {}
}
