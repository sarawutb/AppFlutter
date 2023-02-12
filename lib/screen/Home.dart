import 'dart:async';

import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

import '../colors/color.dart';
import '../colors/fontStyle.dart';
import '../controller/HomeController.dart';
import '../routes/routes.dart';
import '../widgets/itemShop.dart';
import '../widgets/tab1.dart';
import '../widgets/tab2.dart';

class Home extends StatefulWidget {
  const Home({Key? key}) : super(key: key);

  @override
  State<Home> createState() => _HomeState();
}

class _HomeState extends State<Home> {
  final List<Map<String, dynamic>> headerBar = [
    {"name": 'หน้าหลัก', "icon": Icons.shopping_bag_sharp},
    {"name": 'สินค้าลดราคา', "icon": Icons.discount},
    {"name": 'รายการสั่งซื้อ', "icon": Icons.list},
  ];

  Timer? _timer;
  TabController? _controller;
  int _selectedIndex = 0;

  List<Widget> list = [
    Tab(icon: Icon(Icons.card_travel)),
    Tab(icon: Icon(Icons.add_shopping_cart)),
  ];

  // final List<TextEditingController> inputItem = [];

  // final List<String> titles = <String>[
  //   'สินค้า',
  //   'รายการสั่งซื้อ',
  //   'รายการยกเลิก',
  // ];
  @override
  void initState() {
    InitRoute.initRouter = 2;
    _timer = new Timer.periodic(const Duration(seconds: 2), (Timer _timer) => {setState(() {})});
    HomeController.getProductAll();
    // for (int i = 0; i < 9; i++) {
    //   inputItem.add(TextEditingController());
    //   inputItem[i].text = "0";
    // }
    // _controller = TabController(length: list.length, vsync: this);

    _controller?.addListener(() {
      setState(() {});
      print("Selected Index: ");
    });
    super.initState();
  }

  @override
  void dispose() {
    _timer?.cancel();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    final List<Widget> _widgetBar = List.generate(
        headerBar.length,
        (index) => Tab(
              child: Column(
                children: [
                  Icon(headerBar[index]['icon']),
                  SizedBox(
                    height: 2,
                  ),
                  Text(
                    headerBar[index]['name'],
                    style: fontBar,
                  ),
                ],
              ),
              // text: titles[0],
            ));

    // final List<Widget> _widgetBody = [Tab1(), Tab2(), itemShop()];

    // return LayoutBuilder(
    //   builder: ((_, constraints) {
    //     return RefreshIndicator(
    //       onRefresh: () => Future.delayed(Duration(seconds: 2), () {
    //         setState(() {
    //           HomeController.updateListRefresh(context: context);
    //         });
    //       }),
    //       child: ScrollConfiguration(
    //         // Customize scroll behavior for both platforms
    //         behavior: _ClampingScrollBehavior(),
    //         child: SingleChildScrollView(
    //           physics: AlwaysScrollableScrollPhysics(),
    //           child: ConstrainedBox(
    //             constraints: BoxConstraints(
    //                 minHeight: constraints.maxHeight, maxHeight: constraints.maxHeight),
    //             child: Container(),
    //           ),
    //         ),
    //       ),
    //     );
    //   }),
    // );

    return WillPopScope(
      onWillPop: () {
        return Future.value(false);
      },
      child: AnnotatedRegion<SystemUiOverlayStyle>(
        value: SystemUiOverlayStyle(
          statusBarColor: mainBluedark,
        ),
        child: DefaultTabController(
          initialIndex: HomeController.initTab,
          length: headerBar.length,
          child: Builder(builder: (BuildContext context) {
            // HomeController.getProductAllList!.clear();
            final TabController controller = DefaultTabController.of(context)!;
            // print(controller.indexIsChanging);
            // setState(() {});

            controller.addListener(() {
              // if (!controller.indexIsChanging) {
              Future.delayed(Duration(seconds: 2), () {
                // HomeController.getProductAll();
              });
              HomeController.initTab = controller.index;

              print(controller.index);
              // add code to be executed on TabBar change
              // }
            });
            return SafeArea(
              child: Column(
                children: [
                  Expanded(
                    flex: 1,
                    child: Container(
                      color: mainBluedark,
                      child: TabBar(
                          onTap: (value) {
                            print(value);
                            HomeController.getProductAllList!.clear();
                            Future.delayed(Duration(seconds: 2), () {
                              HomeController.getProductAll();
                            });
                            HomeController.initTab = value;
                          },
                          unselectedLabelColor: mainGray,
                          labelColor: mainWhite,
                          indicatorColor: mainBar,
                          tabs: _widgetBar),
                    ),
                  ),
                  // Container(
                  //   margin: EdgeInsets.only(top: 10, right: 10, left: 10, bottom: 3),
                  //   decoration: BoxDecoration(
                  //     color: Colors.white,
                  //     border: Border.all(width: 0.1, color: mainBluedark),
                  //     borderRadius: BorderRadius.circular(32),
                  //     boxShadow: [
                  //       BoxShadow(
                  //         color: Color.fromARGB(137, 92, 86, 86),
                  //         offset: Offset(0, 5.0),
                  //         blurRadius: 7.0,
                  //       ),
                  //     ],
                  //   ),
                  //   child: TextField(
                  //     textAlign: TextAlign.start,
                  //     decoration: InputDecoration(
                  //       hintStyle: TextStyle(fontSize: 13),
                  //       hintText: 'ค้นหารายการสินค้า',
                  //       suffixIcon: Icon(
                  //         Icons.search,
                  //         color: mainBluedark,
                  //       ),
                  //       border: InputBorder.none,
                  //       fillColor: mainBluedark,
                  //       focusColor: mainBar,
                  //       contentPadding: EdgeInsets.only(top: 10, left: 20),
                  //     ),
                  //   ),
                  // ),
                  Expanded(
                    flex: 8,
                    child: TabBarView(
                      controller: _controller,
                      physics: NeverScrollableScrollPhysics(),
                      children: [Tab1(), Tab2(), itemShop()],
                    ),
                  )
                ],
              ),
            );
          }),
        ),
      ),
    );
  }
}
