import 'package:flutter/foundation.dart';
import 'package:state_management/model/data.dart';

class CardProvider extends ChangeNotifier{
  final List<Item> cardItems;

  bool loading = false;

  CardProvider(this.cardItems);

  double get cardTotal => cardItems.isNotEmpty
      ? cardItems
      .map((e) => e.price)
      .reduce((value, element) => value + element)
      : 0.0;

  Future<void> checkOut() async {
    loading = true;
    notifyListeners();

    await Future.delayed(const Duration(seconds: 2));
    loading = false;
  }
}