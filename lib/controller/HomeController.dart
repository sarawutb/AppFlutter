import 'dart:convert';

import 'package:flutter/cupertino.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:http/http.dart' as http;

import '../model/modelItem.dart';
import '../model/modelProductAll.dart';

class HomeController {
  static var listData = 1;
  static int initTab = 0;
  // static var countItem = 0;
  var itemModelModel = new itemModel();
  static List<itemModel> inputItem = [];

  static updateListRefresh({required BuildContext context}) {
    listData++;

    // print(listData);
    // setsta
  }

  static updateCountItem({required BuildContext context, required itemModel data}) {
    if (inputItem.any((element) => element.idItem == data.idItem)) {
      var index = inputItem.indexWhere((element) => element.idItem == data.idItem);
      inputItem[index].dataItem = new TextEditingController(
          text: (int.parse(inputItem
                      .where((element) => element.idItem == data.idItem)
                      .first
                      .dataItem!
                      .text) +
                  int.parse(data.dataItem!.text))
              .toString());
    } else {
      inputItem.add(new itemModel(
          dataItem: data.dataItem,
          discountItem: data.discountItem,
          idItem: data.idItem,
          nameItem: data.nameItem,
          priceItem: data.priceItem,
          starItem: data.starItem));
    }
  }

  static List<GetProductAllList>? getProductAllList = [];
  static getProductAll() async {
    var request = http.Request('GET', Uri.parse('http://192.168.1.41:5000/GetProductAll'));
    http.StreamedResponse response = await request.send();
    if (response.statusCode == 200) {
      var data = await response.stream.bytesToString();
      var responsejson = json.decode((data));
      getProductAllList =
          await (responsejson["data"] as List).map((e) => GetProductAllList.fromMap(e)).toList();
      print(getProductAllList!.length);
    } else {
      print(response.reasonPhrase);
    }
  }
}
