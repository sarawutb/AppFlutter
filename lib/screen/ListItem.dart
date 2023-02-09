import 'package:flutter/material.dart';
import 'package:flutter/src/widgets/framework.dart';

import '../colors/color.dart';
import '../colors/fontStyle.dart';
import '../widgets/itemShop.dart';

class ListItem extends StatefulWidget {
  ListItem({Key? key}) : super(key: key);

  @override
  State<ListItem> createState() => _ListItemState();
}

class _ListItemState extends State<ListItem> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(
          "รถเข็น",
          style: fontBar.copyWith(
              fontWeight: FontWeight.normal, fontStyle: FontStyle.normal, fontSize: 13),
        ),
        backgroundColor: mainBluedark,
      ),
      body: SafeArea(
          child: SizedBox.expand(
        child: itemShop(),
      )),
    );
  }
}
