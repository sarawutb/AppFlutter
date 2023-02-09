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
      child: Container(
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
                          'https://lzd-img-global.slatic.net/g/p/75be5f1e8c6d3d3577a76437ac7cbf60.jpg_720x720q80.jpg',
                          width: 100,
                        ),
                        Container(
                          child: Expanded(
                            child: Column(children: [
                              Container(
                                child: Text(
                                  "WARRIX เสื้อโปโลแขนสั้น WA-3315NWARRIX เสื้อโปโลแขนสั้น Test-0000123456789- WA-3315N",
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
                                      "฿1,990",
                                      style: TextStyle(color: mainBar),
                                    ),
                                    Container(
                                        padding: EdgeInsets.only(left: 5),
                                        child: Text("฿2,990",
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
      ),
    ),
  );
}
