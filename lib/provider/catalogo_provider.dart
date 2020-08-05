import 'package:flutter/foundation.dart';
import 'package:state_management/model/data.dart';

class CatalogProvider extends ChangeNotifier {
  final List<Item> cardtItem = [];
  List<Item> allMyItems = [];
  bool loading = false;

  void loadData() async {
    loading = true;
    notifyListeners();

    await Future.delayed(const Duration(seconds: 3));
    allMyItems.clear();
    allMyItems.addAll(allItems);

    loading = false;
    notifyListeners();
  }

  void addItems(Item item) {
    cardtItem.add(item);
    notifyListeners();
  }

  void deleteAll() {
    cardtItem.clear();
    notifyListeners();
  }

}