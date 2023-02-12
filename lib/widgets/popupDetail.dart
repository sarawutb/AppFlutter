import 'package:carousel_slider/carousel_options.dart';
import 'package:carousel_slider/carousel_slider.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';

import '../colors/color.dart';
import '../colors/fontStyle.dart';
import '../controller/HomeController.dart';
import '../controller/manager.dart';
import '../model/modelItem.dart';
import '../screen/Body.dart';
import '../screen/Home.dart';

class PopUpDetail extends StatefulWidget {
  // const PopUpDetail({required List<TextEditingController> inputItem, super.key});
    const PopUpDetail({super.key, required this.indexData});
  final int indexData;
  // const PopUpDetail({required TextEditingController this.inputItem, Key? key}) : super(key: key);

  @override
  State<PopUpDetail> createState() => _PopUpDetailState();
}

class _PopUpDetailState extends State<PopUpDetail> {
  TextEditingController inputItem = new TextEditingController();

  Manager manager = new Manager();

  @override
  Widget build(BuildContext context) {
    inputItem.text = "1";
    return GestureDetector(
      onTap: () => Navigator.pop(context),
      child: Scaffold(
        backgroundColor: Colors.transparent,
        body: GestureDetector(
          onTap: () {},
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Container(
                decoration:
                    BoxDecoration(color: mainWhite, borderRadius: BorderRadius.circular(10)),
                margin: EdgeInsets.all(20),
                padding: EdgeInsets.all(5),
                // height: 500,
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.start,
                  children: [
                    Container(
                      padding: EdgeInsets.symmetric(vertical: 20),
                      decoration: BoxDecoration(
                        color: Colors.grey.shade200,
                        borderRadius: BorderRadius.circular(30),
                      ),

                      // margin: EdgeInsets.only(top: 10),
                      child: CarouselSlider(
                        items: [
                          ...List.generate(
                          HomeController.getProductAllList![widget.indexData].pathProductImage.length,
                            (index) => Container(
                              // margin: EdgeInsets.all(1.0),
                              decoration: BoxDecoration(
                                borderRadius: BorderRadius.circular(10.0),
                                image: DecorationImage(
                                  image: NetworkImage(
                                      HomeController.getProductAllList![widget.indexData].pathProductImage[index].toString()),
                                  fit: BoxFit.cover,
                                ),
                              ),
                            ),
                          ),
                        ],
                        options: CarouselOptions(
                          pauseAutoPlayOnTouch: false,
                          enableInfiniteScroll: false,
                          height: 240.0,
                          enlargeCenterPage: true,
                          enlargeFactor: 0.2,
                          // autoPlay: true,
                          // aspectRatio: 16 / 9,
                          // autoPlayCurve: Curves.fastOutSlowIn,
                          // enableInfiniteScroll: true,
                          // autoPlayAnimationDuration: Duration(milliseconds: 800),
                          // viewportFraction: 1,
                        ),
                      ),

                      // SingleChildScrollView(
                      //   physics: BouncingScrollPhysics(),
                      //   scrollDirection: Axis.horizontal,
                      //   child: Row(
                      //     children: [
                      //       ...List.generate(
                      //         5,
                      //         (index) => Container(
                      //           padding: EdgeInsets.all(10),
                      //           child: Image.network(
                      //             'https://lzd-img-global.slatic.net/g/p/75be5f1e8c6d3d3577a76437ac7cbf60.jpg_720x720q80.jpg',
                      //             width: 250,
                      //           ),
                      //         ),
                      //       )
                      //     ],
                      //   ),
                      // ),
                    ),
                    Container(
                        // color: mainBar,
                        // height: 50,
                        padding: EdgeInsets.all(10),
                        alignment: Alignment.center,
                        child: Text(
                          HomeController.getProductAllList![widget.indexData].nameProduct.toString(),
                          style: fontDetailList,
                          overflow: TextOverflow.ellipsis,
                          maxLines: 2,
                        )),
                    // const Spacer(),
                    Container(
                      padding: EdgeInsets.only(left: 15),
                      // color: mainBar,
                      child: Row(
                        crossAxisAlignment: CrossAxisAlignment.end,
                        children: [
                          Text(
                            HomeController.getProductAllList![widget.indexData].priceProduct,
                            style: TextStyle(color: mainBar),
                          ),
                          Container(
                              padding: EdgeInsets.only(left: 5),
                              child: Text(HomeController.getProductAllList![widget.indexData].discountProduct,
                                  style: TextStyle(
                                    fontSize: 11,
                                    decoration: TextDecoration.lineThrough,
                                  ))),
                        ],
                      ),
                    ),
                    Container(
                      padding: EdgeInsets.only(right: 10, top: 5),
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.end,
                        crossAxisAlignment: CrossAxisAlignment.end,
                        children: [
                          ...List.generate(
                            int.parse(HomeController.getProductAllList![widget.indexData].starProduct.toString()),
                            (index) => Icon(
                              Icons.star_outlined,
                              color: Colors.yellow.shade700,
                              size: 15,
                            ),
                          ),
                          Icon(
                            Icons.star_half_sharp,
                            color: Colors.yellow.shade700,
                            size: 15,
                          ),
                        ],
                      ),
                    ),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        // const Spacer(),
                        IconButton(
                          onPressed: () {
                            if (int.parse(inputItem.text) > 0) {
                              inputItem.text = (int.parse(inputItem.text) - 1).toString();
                            }
                          },
                          icon: FaIcon(
                            FontAwesomeIcons.minus,
                            size: 15,
                          ),
                        ),
                        Container(
                          color: mainWhite,
                          width: 65,
                          height: 30,
                          child: TextField(
                            textAlign: TextAlign.center,
                            cursorColor: Colors.black,
                            cursorWidth: 1,
                            cursorHeight: 20,
                            decoration: InputDecoration(
                              filled: false,
                              enabledBorder: OutlineInputBorder(
                                borderSide: BorderSide(width: 1, color: Colors.blueAccent),
                              ),
                              focusedBorder: OutlineInputBorder(
                                borderSide: BorderSide(width: 1, color: Colors.blueAccent),
                              ),
                              contentPadding: EdgeInsets.all(6),
                            ),
                            style: fontBar,
                            controller: inputItem,
                          ),
                        ),
                        IconButton(
                          onPressed: () {
                            inputItem.text = (int.parse(inputItem.text) + 1).toString();
                          },
                          icon: FaIcon(
                            FontAwesomeIcons.plus,
                            size: 15,
                          ),
                        ),
                      ],
                    ),

                    GestureDetector(
                      onTap: () {
                        if (int.parse(inputItem.text) > 0) {
                          setState(() {
                            Navigator.pop(context);
                            Navigator.push(
                              context,
                              PageRouteBuilder(
                                transitionDuration: Duration(milliseconds: 100),
                                pageBuilder: (context, animation, secondaryAnimation) =>
                                    BodyHome(body: Home()),
                                transitionsBuilder:
                                    (context, animation, secondaryAnimation, child) {
                                  return FadeTransition(
                                    opacity: animation,
                                    // position: animation.drive(tween),
                                    child: child,
                                  );
                                },
                              ),
                            );
                          });
                          setState(() {
                            HomeController.updateCountItem(
                                context: context,
                                data: itemModel(
                                    dataItem: inputItem,
                                    discountItem: HomeController.getProductAllList![widget.indexData].discountProduct,
                                    idItem: HomeController.getProductAllList![widget.indexData].id,
                                    nameItem:
                                        HomeController.getProductAllList![widget.indexData].nameProduct,
                                    priceItem: int.parse(HomeController.getProductAllList![widget.indexData].priceProduct.toString()),
                                    starItem: 5,
                                    imagePath: HomeController.getProductAllList![widget.indexData].pathProductImage.first));
                          });
                        }
                      },
                      child: Container(
                        margin: EdgeInsets.symmetric(vertical: 10),
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.center,
                          crossAxisAlignment: CrossAxisAlignment.center,
                          children: [
                            GestureDetector(
                              child: Container(
                                alignment: Alignment.center,
                                width: 130,
                                padding: EdgeInsets.symmetric(horizontal: 15, vertical: 10),
                                decoration: BoxDecoration(
                                    color: mainYellow, borderRadius: BorderRadius.circular(50)),
                                child: Text("เพิ่มใส่รถเข็น"),
                              ),
                            ),
                            SizedBox(
                              width: 10,
                            ),
                            GestureDetector(
                              onTap: () {},
                              child: Container(
                                alignment: Alignment.center,
                                width: 130,
                                padding: EdgeInsets.symmetric(horizontal: 15, vertical: 10),
                                decoration: BoxDecoration(
                                    color: mainOrange, borderRadius: BorderRadius.circular(50)),
                                child: Text("ซื้อทันที"),
                              ),
                            ),
                          ],
                        ),
                      ),
                    ),
                  ],
                ),
              )
            ],
          ),
        ),
      ),
    );
  }
}
