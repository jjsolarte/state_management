import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:state_management/provider/catalogo_provider.dart';

import 'card_screen.dart';

class CatalogActionButtons extends StatelessWidget {

  const CatalogActionButtons({Key key,})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    final provider = context.watch<CatalogProvider>();
    return Row(
      children: [
        provider.cardtItem.isNotEmpty
            ? IconButton(
            icon: Icon(Icons.delete),
            onPressed: () {
              provider.deleteAll();
//                  setState(() {
//                    widget.cardItems.clear();
//                  });
//                  widget.onDelete();
            })
            : const SizedBox.shrink(),
        Stack(
          children: [
            IconButton(
                icon: Icon(Icons.shopping_cart),
                onPressed: () {
                  final page = CardScreen.init(provider.cardtItem);
                  Navigator.of(context)
                      .push(MaterialPageRoute(builder: (_) => page));
                }),
            Positioned(
                right: 5.0,
                top: 0.0,
                child: provider.cardtItem.isNotEmpty
                    ? CircleAvatar(
                  maxRadius: 10,
                  backgroundColor: Colors.red,
                  child: Text(
                    provider.cardtItem.length.toString(),
                    textAlign: TextAlign.center,
                    style: TextStyle(fontSize: 14, color: Colors.white),
                  ),
                )
                    : const SizedBox.shrink())
          ],
        )
      ],
    );
  }
}
