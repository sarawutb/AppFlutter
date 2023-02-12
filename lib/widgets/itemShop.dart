import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:go_router/go_router.dart';

import '../colors/color.dart';
import '../colors/fontStyle.dart';
import '../controller/HomeController.dart';

Widget itemShop() {
  return StatefulBuilder(
    builder: (context, setState) => WillPopScope(
      onWillPop: () {
        context.go("/Home");
        return Future.value(false);
      },
      child: 
      HomeController.inputItem.isNotEmpty ?
      Container(
        child: ListView.builder(
          physics: BouncingScrollPhysics(),
          itemCount: HomeController.inputItem.length,
          itemBuilder: (BuildContext context, int index) {
            return ListTile(
              minVerticalPadding: 10,
              tileColor: Colors.white,
              title: Column(
                mainAxisAlignment: MainAxisAlignment.start,
                children: [
                  Divider(),
                  Container(
                    // height: 40,
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.start,
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Image.network(
                          HomeController.inputItem[index].imagePath,
                          width: 100,
                        ),
                        Container(
                          child: Expanded(
                            child: Column(children: [
                              Container(
                                child: Text(
                                  HomeController.inputItem[index].nameItem.toString(),
                                  style: fontDetailList,
                                  overflow: TextOverflow.ellipsis,
                                  maxLines: 3,
                                ),
                              ),
                              Container(
                                padding: EdgeInsets.only(left: 5),
                                // color: mainBar,
                                child: Row(
                                  crossAxisAlignment: CrossAxisAlignment.end,
                                  children: [
                                    Text(
                                      HomeController.inputItem[index].priceItem.toString(),
                                      style: TextStyle(color: mainBar),
                                    ),
                                    Container(
                                        padding: EdgeInsets.only(left: 5),
                                        child: Text(HomeController.inputItem[index].discountItem.toString(),
                                            style: TextStyle(
                                              fontSize: 11,
                                              decoration: TextDecoration.lineThrough,
                                            ))),
                                  ],
                                ),
                              ),
                              Row(
                                mainAxisAlignment: MainAxisAlignment.center,
                                children: [
                                  // const Spacer(),
                                  IconButton(
                                    onPressed: () {
                                      if (int.parse(
                                              HomeController.inputItem[index].dataItem!.text) >
                                          0) {
                                        HomeController.inputItem[index].dataItem!.text = (int.parse(
                                                    HomeController
                                                        .inputItem[index].dataItem!.text) -
                                                1)
                                            .toString();
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
                                          borderSide:
                                              BorderSide(width: 1, color: Colors.blueAccent),
                                        ),
                                        focusedBorder: OutlineInputBorder(
                                          borderSide:
                                              BorderSide(width: 1, color: Colors.blueAccent),
                                        ),
                                        contentPadding: EdgeInsets.all(6),
                                      ),
                                      style: fontBar,
                                      controller: HomeController.inputItem[index].dataItem,
                                    ),
                                  ),
                                  IconButton(
                                    onPressed: () {
                                      HomeController.inputItem[index].dataItem!.text = (int.parse(
                                                  HomeController.inputItem[index].dataItem!.text) +
                                              1)
                                          .toString();
                                    },
                                    icon: FaIcon(
                                      FontAwesomeIcons.plus,
                                      size: 15,
                                    ),
                                  ),
                                ],
                              ),
                            ]),
                          ),
                        )
                      ],
                    ),
                  ),
                  Divider(),
                ],
              ),
            );
          },
        ),
      ) : SizedBox()
    ),
  );
}
