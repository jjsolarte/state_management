import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:state_management/model/data.dart';
import 'package:state_management/provider/catalogo_provider.dart';

import 'catalogo_actions_buttons.dart';

class CatalogoScreen extends StatelessWidget {
  CatalogoScreen._();

  static ChangeNotifierProvider init() => ChangeNotifierProvider<CatalogProvider>(
    create: (_) => CatalogProvider()..loadData(),
    builder: (_, __) => CatalogoScreen._(),
  );

  @override
  Widget build(BuildContext context) {
    final provider = context.watch<CatalogProvider>();
    // context.read() ---> similar al listen: false
    return Scaffold(
      appBar: AppBar(
        actions: <Widget>[
          CatalogActionButtons(
//            cardItems: cardtItem,
//            onDelete: () {
//              setState(() {});
//            },
          )
        ],
        title: Text(
          "Catalogo",
          style: Theme.of(context).textTheme.headline4.copyWith(
              fontWeight: FontWeight.bold,
              color: Theme.of(context).accentColor),
        ),
      ),
      body: provider.loading
          ? Center(
        child: CircularProgressIndicator(),
      )
          : ListView.separated(
          itemBuilder: (_, index) => CatalogItem(
            item: provider.allMyItems[index],
            wasAdded: provider.cardtItem.contains(provider.allMyItems[index]),
            onTap: () {
              provider.addItems(provider.allMyItems[index]);
//                      setState(() {
//                        provider.cardtItem.add(provider.allMyItems[index]);
//                      });
            },
          ),
          separatorBuilder: (_, index) => Divider(),
          itemCount: provider.allMyItems.length),
    );
  }
}

class CatalogItem extends StatelessWidget {
  final Item item;
  final VoidCallback onTap;
  final bool wasAdded;

  const CatalogItem({Key key, this.item, this.onTap, this.wasAdded})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return ListTile(
      contentPadding: EdgeInsets.all(10),
      leading: Container(
        height: 40,
        width: 40,
        color: item.color,
      ),
      title: Text(item.name),
      subtitle: Text("\$${item.price}"),
      trailing: !wasAdded
          ? OutlineButton(
        onPressed: onTap,
        child: Text("Add"),
      )
          : Padding(
        padding: EdgeInsets.only(right: 30),
        child: Icon(Icons.check),
      ),
    );
  }
}

