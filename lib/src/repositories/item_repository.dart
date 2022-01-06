import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:flutter_riverpod_shopping_list/src/models/item_model.dart';

//Abstract class crated for access methods of Firebase
abstract class BaseItemRepository {
  Future<List<Item>> retrieveItems({
    required String userId,
  });

  Future<String> createItem({
    required String userId,
    required Item item,
  });

  Future<void> updateItem({
    required String userId,
    required Item item,
  });

  Future<void> deleteItem({
    required String userId,
    required String itemId,
  });
}

class ItemRepository implements BaseItemRepository {
  final Reader _read;

  const ItemRepository(this._read);

  @override
  Future<List<Item>> retrieveItems({
    required String userId,
  }) {
    // TODO: implement retrieveItems
    throw UnimplementedError();
  }

  @override
  Future<String> createItem({
    required String userId,
    required Item item,
  }) {
    // TODO: implement createItem
    throw UnimplementedError();
  }

  @override
  Future<void> updateItem({
    required String userId,
    required Item item,
  }) {
    // TODO: implement updateItem
    throw UnimplementedError();
  }

  @override
  Future<void> deleteItem({
    required String userId,
    required String itemId,
  }) {
    // TODO: implement deleteItem
    throw UnimplementedError();
  }
}
