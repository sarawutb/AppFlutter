import 'package:flutter/material.dart';

class itemModel {
  itemModel({
    this.idItem,
    this.nameItem,
    this.priceItem,
    this.discountItem,
    this.starItem,
    this.dataItem,
  });

  int? idItem;
  String? nameItem;
  String? discountItem;
  num? priceItem;
  int? starItem;
  TextEditingController? dataItem;
}
