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
    required this.productId,
    required this.starProduct,
    required this.urlProductImage,
  });

  String detailProduct;
  String discountProduct;
  int groupProduct;
  int id;
  String nameProduct;
  String pathProductImage;
  String priceProduct;
  int productId;
  int starProduct;
  String urlProductImage;

  factory GetProductAllList.fromMap(Map<String, dynamic> json) => GetProductAllList(
        detailProduct: json["detail_product"],
        discountProduct: json["discount_product"],
        groupProduct: json["group_product"],
        id: json["id"],
        nameProduct: json["name_product"],
        pathProductImage: json["path_product_image"],
        priceProduct: json["price_product"],
        productId: json["product_id"],
        starProduct: json["star_product"],
        urlProductImage: json["url_product_image"],
      );

  Map<String, dynamic> toMap() => {
        "detail_product": detailProduct,
        "discount_product": discountProduct,
        "group_product": groupProduct,
        "id": id,
        "name_product": nameProduct,
        "path_product_image": pathProductImage,
        "price_product": priceProduct,
        "product_id": productId,
        "star_product": starProduct,
        "url_product_image": urlProductImage,
      };
}
