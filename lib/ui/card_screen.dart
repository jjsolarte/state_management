import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:state_management/model/data.dart';
import 'package:state_management/provider/card_provider.dart';
import 'package:state_management/ui/thanks_screen.dart';

class CardScreen extends StatelessWidget {

  CardScreen._();

  static ChangeNotifierProvider init(List<Item> cartItems) => ChangeNotifierProvider<CardProvider>(
    create: (_) => CardProvider(cartItems),
    builder: (_, __) => CardScreen._(),
  );

  void checkoutMyCard(BuildContext context) async{
    final provider = context.read<CardProvider>();
    await provider.checkOut();
    Navigator.of(context)
        .pushReplacement(MaterialPageRoute(builder: (_) => ThanksScreen()));
  }

  @override
  Widget build(BuildContext context) {
    final provider = context.watch<CardProvider>();
    return Scaffold(
      appBar: AppBar(
        title: Text(
          "Cart",
          style: Theme.of(context).textTheme.headline4.copyWith(
              fontWeight: FontWeight.bold,
              color: Theme.of(context).accentColor),
        ),
      ),
      body: Column(
        children: <Widget>[
          Expanded(
              flex: 3,
              child: ListView(
                padding: EdgeInsets.all(15),
                children: <Widget>[
                  for (var item in provider.cardItems)
                    Row(
                      children: <Widget>[
                        Expanded(
                          child: Text(
                            " ° ${item.name}",
                            style: Theme.of(context).textTheme.headline5,
                          ),
                        ),
                        Expanded(
                            child: Text(
                              "${item.price}",
                              style: Theme.of(context).textTheme.headline5,
                            ))
                      ],
                    )
                ],
              )),
          Expanded(
              child: Column(
                children: <Widget>[
                  Text(
                    "Total : ${provider.cardTotal}",
                    style: Theme.of(context).textTheme.headline2,
                  ),
                  if(provider.loading)
                    Center(
                      child: CircularProgressIndicator(),
                    )
                  else if (provider.cardItems.isNotEmpty)
                    RaisedButton(onPressed: (){
                      checkoutMyCard(context);
                    }, child: Text("Checkout"),)
                ],
              ))
        ],
      ),
    );
  }
}