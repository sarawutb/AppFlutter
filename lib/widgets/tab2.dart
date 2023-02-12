import 'package:flutter/material.dart';

import '../colors/color.dart';
import '../colors/fontStyle.dart';
import '../controller/HomeController.dart';
import 'popupDetail.dart';

class _ClampingScrollBehavior extends ScrollBehavior {
  @override
  // ScrollPhysics getScrollPhysics(BuildContext context) => BouncingScrollPhysics();
  // ScrollPhysics getScrollPhysics(BuildContext context) => ClampingScrollPhysics();
  ScrollPhysics getScrollPhysics(BuildContext context) => AlwaysScrollableScrollPhysics();
}

Widget Tab2() {
  return StatefulBuilder(builder: (context, StateSetter setState) {
    return HomeController.getProductAllList!.isNotEmpty
        ? LayoutBuilder(builder: ((_, constraints) {
            return RefreshIndicator(
              triggerMode: RefreshIndicatorTriggerMode.anywhere,
              strokeWidth: RefreshProgressIndicator.defaultStrokeWidth,
              color: mainBar,
              onRefresh: () => Future.delayed(Duration(seconds: 1), () {
                setState(() {
                  HomeController.getProductAll();
                  // HomeController.updateListRefresh(context: context);
                });
              }),
              child: ScrollConfiguration(
                behavior: new _ClampingScrollBehavior(),
                child: SizedBox.expand(
                  child: SingleChildScrollView(

                      // physics: AlwaysScrollableScrollPhysics(),

                      physics: BouncingScrollPhysics(),

                      // physics: ClampingScrollPhysics(),

                      child: Container(
                        alignment: Alignment.center,
                        child: Wrap(
                          alignment: WrapAlignment.start,
                          children: [
                            // Text("${HomeController.getProductAllList?.length}"),
                            ...List.generate(
                                HomeController.getProductAllList!.length,
                                (index) => double.parse(HomeController
                                            .getProductAllList![index].discountProduct
                                            .toString()) !=
                                        0
                                    ? Container(
                                        decoration: BoxDecoration(
                                            color: Colors.white,
                                            borderRadius: BorderRadius.circular(15),
                                            border: Border.all(width: 0.1, color: Colors.black)),
                                        width: 170,
                                        height: 280,
                                        padding: EdgeInsets.symmetric(vertical: 10),
                                        margin: EdgeInsets.all(5),
                                        child: GestureDetector(
                                          onTap: () {
                                            // setState(() {

                                            //   context.go('/detailPopup');

                                            // });
                                            // var datainputItem =
                                            //     HomeController.inputItem[index].dataItem!.text = "1";
                                            showDialog<void>(
                                                context: context,
                                                builder: (BuildContext context) {
                                                  return PopUpDetail(
                                                    indexData: index,
                                                      // inputItem: HomeController.inputItem[index].dataItem!,
                                                      );
                                                });

                                            // print(HomeController.listData);
                                          },
                                          child: Column(
                                            mainAxisAlignment: MainAxisAlignment.start,
                                            children: [
                                              Container(
                                                height: 140,
                                                // margin: EdgeInsets.only(top: 10),

                                                child: Image.network(
                                                  HomeController.getProductAllList![index]
                                                      .pathProductImage.first,
                                                  // width: 150,
                                                  fit: BoxFit.cover,
                                                ),
                                              ),

                                              Container(

                                                  // color: mainBar,

                                                  // height: 50,

                                                  padding: EdgeInsets.all(10),
                                                  alignment: Alignment.center,
                                                  child: Text(
                                                    HomeController
                                                        .getProductAllList![index].detailProduct,
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
                                                      HomeController
                                                          .getProductAllList![index].priceProduct,
                                                      style: TextStyle(color: mainBar),
                                                    ),
                                                    Container(
                                                        padding: EdgeInsets.only(left: 5),
                                                        child: Text(
                                                            HomeController.getProductAllList![index]
                                                                .discountProduct,
                                                            style: TextStyle(
                                                              color: HomeController
                                                                          .getProductAllList![index]
                                                                          .discountProduct ==
                                                                      "0"
                                                                  ? Colors.white
                                                                  : Colors.black,
                                                              fontSize: 11,
                                                              decoration:
                                                                  TextDecoration.lineThrough,
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
                                                      4,
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

                                              // Row(

                                              //   mainAxisAlignment: MainAxisAlignment.center,

                                              //   children: [

                                              //     // const Spacer(),

                                              //     IconButton(

                                              //       onPressed: () {

                                              //         if (int.parse(inputItem[index].text) > 0) {

                                              //           inputItem[index].text =

                                              //               (int.parse(inputItem[index].text) - 1).toString();

                                              //         }

                                              //       },

                                              //       icon: FaIcon(

                                              //         FontAwesomeIcons.minus,

                                              //         size: 15,

                                              //       ),

                                              //     ),

                                              //     Container(

                                              //       color: mainWhite,

                                              //       width: 50,

                                              //       height: 30,

                                              //       child: TextField(

                                              //         textAlign: TextAlign.center,

                                              //         cursorColor: Colors.black,

                                              //         cursorWidth: 1,

                                              //         cursorHeight: 20,

                                              //         decoration: InputDecoration(

                                              //           filled: false,

                                              //           enabledBorder: OutlineInputBorder(

                                              //             borderSide:

                                              //                 BorderSide(width: 1, color: Colors.blueAccent),

                                              //           ),

                                              //           focusedBorder: OutlineInputBorder(

                                              //             borderSide:

                                              //                 BorderSide(width: 1, color: Colors.blueAccent),

                                              //           ),

                                              //           contentPadding: EdgeInsets.all(6),

                                              //         ),

                                              //         style: fontBar,

                                              //         controller: inputItem[index],

                                              //       ),

                                              //     ),

                                              //     IconButton(

                                              //       onPressed: () {

                                              //         inputItem[index].text =

                                              //             (int.parse(inputItem[index].text) + 1).toString();

                                              //       },

                                              //       icon: FaIcon(

                                              //         FontAwesomeIcons.plus,

                                              //         size: 15,

                                              //       ),

                                              //     ),

                                              //   ],

                                              // )
                                            ],
                                          ),
                                        ),
                                      )
                                    : SizedBox())
                          ],
                        ),
                      )),
                ),
              ),
            );
          }))
        : Column(
            mainAxisAlignment: MainAxisAlignment.center,
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              CircularProgressIndicator(
                strokeWidth: 5,
                color: mainBar,
              ),
            ],
          );
  });
}
