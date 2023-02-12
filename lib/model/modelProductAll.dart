// To parse this JSON data, do
//
//     final getProductAll = getProductAllFromMap(jsonString);

import 'dart:convert';

GetProductAll getProductAllFromMap(String str) => GetProductAll.fromMap(json.decode(str));

String getProductAllToMap(GetProductAll data) => json.encode(data.toMap());

class GetProductAll {
    GetProductAll({
        required this.data,
    });

    List<GetProductAllList> data;

    factory GetProductAll.fromMap(Map<String, dynamic> json) => GetProductAll(
        data: List<GetProductAllList>.from(json["data"].map((x) => GetProductAllList.fromMap(x))),
    );

    Map<String, dynamic> toMap() => {
        "data": List<dynamic>.from(data.map((x) => x.toMap())),
    };
}

class GetProductAllList {
    GetProductAllList({
        required this.detailProduct,
        required this.discountProduct,
        required this.groupProduct,
        required this.id,
        required this.nameProduct,
        required this.pathProductImage,
        required this.priceProduct,
        required this.qtyProduct,
        required this.starProduct,
    });

    String detailProduct;
    String discountProduct;
    String groupProduct;
    int id;
    String nameProduct;
    List<String> pathProductImage;
    String priceProduct;
    String qtyProduct;
    int starProduct;

    factory GetProductAllList.fromMap(Map<String, dynamic> json) => GetProductAllList(
        detailProduct: json["detail_product"],
        discountProduct: json["discount_product"],
        groupProduct: json["group_product"],
        id: json["id"],
        nameProduct: json["name_product"],
        pathProductImage: List<String>.from(json["path_product_image"].map((x) => x)),
        priceProduct: json["price_product"],
        qtyProduct: json["qty_product"],
        starProduct: json["star_product"],
    );

    Map<String, dynamic> toMap() => {
        "detail_product": detailProduct,
        "discount_product": discountProduct,
        "group_product": groupProduct,
        "id": id,
        "name_product": nameProduct,
        "path_product_image": List<dynamic>.from(pathProductImage.map((x) => x)),
        "price_product": priceProduct,
        "qty_product": qtyProduct,
        "star_product": starProduct,
    };
}
