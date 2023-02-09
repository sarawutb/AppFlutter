import 'package:badges/badges.dart' as badges;
import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';

import '../colors/color.dart';
import '../colors/fontStyle.dart';
import '../controller/HomeController.dart';
import '../widgets/drawerMenu.dart';

class BodyHome extends StatefulWidget {
  const BodyHome({
    Key? key,
    required this.body,
  }) : super(key: key);

  final Widget body;

  @override
  State<BodyHome> createState() => _BodyHomeState();
}

class _BodyHomeState extends State<BodyHome> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: mainBluedark,
        bottomOpacity: 0.0,
        elevation: 0.0,
        title: Container(
          // padding: EdgeInsets.symmetric(horizontal: 10),
          decoration: BoxDecoration(
            color: Colors.white,
            border: Border.all(width: 1, color: mainBluedark),
            borderRadius: BorderRadius.circular(32),
            boxShadow: [
              BoxShadow(
                color: Colors.black54,
                offset: Offset(0, 1.0),
                blurRadius: 10.0,
                blurStyle: BlurStyle.outer,
              ),
            ],
          ),
          child: SizedBox(
            height: 35,
            child: TextField(
              textAlignVertical: TextAlignVertical.center,
              cursorColor: Colors.black,
              cursorHeight: 20,
              style: fontBar.copyWith(fontSize: 12, fontWeight: FontWeight.normal),
              textAlign: TextAlign.start,
              decoration: InputDecoration(
                alignLabelWithHint: true,
                floatingLabelAlignment: FloatingLabelAlignment.center,
                hintStyle: fontBar.copyWith(fontSize: 11, fontWeight: FontWeight.normal),
                hintText: 'ค้นหารายการสินค้า',
                suffixIcon: Icon(
                  Icons.search,
                  color: mainBluedark,
                ),
                border: InputBorder.none,
                fillColor: mainBluedark,
                focusColor: mainBar,
                contentPadding: EdgeInsets.only(bottom: 15, left: 20),
              ),
            ),
          ),
        ),
        actions: <Widget>[
          Container(
            margin: EdgeInsets.only(right: 10),
            child: badges.Badge(
              position: badges.BadgePosition.topEnd(top: -10, end: -10),
              showBadge: true,
              ignorePointer: false,
              onTap: () {},
              badgeContent: Text(
                HomeController.inputItem.length.toString(),
                style: fontBar.copyWith(color: mainWhite),
              ),
              // badgeAnimation: badges.BadgeAnimation.rotation(
              //   animationDuration: Duration(seconds: 1),
              //   colorChangeAnimationDuration: Duration(seconds: 1),
              //   loopAnimation: false,
              //   curve: Curves.fastOutSlowIn,
              //   colorChangeAnimationCurve: Curves.easeInCubic,
              // ),
              badgeStyle: badges.BadgeStyle(
                shape: badges.BadgeShape.circle,
                borderSide: BorderSide(color: Colors.white, width: 0.7),
                // borderGradient: badges.BadgeGradient.linear(colors: [Colors.red, Colors.black]),
                // badgeGradient: badges.BadgeGradient.linear(
                //   colors: [Colors.blue, Colors.yellow],
                //   begin: Alignment.topCenter,
                //   end: Alignment.bottomCenter,
                // ),
                // elevation: 100,
              ),
              child: GestureDetector(
                  onTap: () {
                    context.go('/ListItem');
                  },
                  child: Icon(Icons.shopping_cart_outlined)),
            ),
          ),
          // IconButton(
          //   icon: const Icon(Icons.add_alert),
          //   // tooltip: 'Show Snackbar',
          //   onPressed: () {
          //     ScaffoldMessenger.of(context).showSnackBar(SnackBar(
          //       padding: EdgeInsets.symmetric(vertical: 30, horizontal: 10),
          //       content: Text('Hi, Flutter developers'),
          //       backgroundColor: mainBluedark,
          //       behavior: SnackBarBehavior.floating,
          //       shape: RoundedRectangleBorder(
          //         side: BorderSide(
          //           style: BorderStyle.solid,
          //           color: Colors.black,
          //           // width: 0.1,
          //         ),
          //         borderRadius: BorderRadius.circular(10.0),
          //       ),
          //       // child: Text(
          //       //   'Card with Beveled border',
          //       //   textScaleFactor: 1.2,
          //       // ),
          //     ));
          //   },
          // ),
          // badges.Badge(
          //   badgeContent: Text('3'),
          //   child: IconButton(
          //     icon: const Icon(Icons.shopping_cart_outlined),
          //     // tooltip: 'Go to the next page',
          //     onPressed: () {
          //       context.go('/login');
          //       // Navigator.push(context, CupertinoRoute(enterPage: Login()));
          //       // Navigator.of(context).push(_createRoute());
          //       // Navigator.push(context, MaterialPageRoute<void>(
          //       //   builder: (BuildContext context) {
          //       //     return Scaffold(
          //       //       appBar: AppBar(
          //       //         title: const Text('Next page'),
          //       //       ),
          //       //       body: const Center(
          //       //         child: Text(
          //       //           'This is the next page',
          //       //           style: TextStyle(fontSize: 24),
          //       //         ),
          //       //       ),
          //       //     );
          //       //   },
          //       // )
          //       // );
          //     },
          //   ),
          // ),
        ],
      ),
      backgroundColor: mainWhite,
      drawer: Drawer(width: 300, child: drawerMenu(context: context)),
      body: widget.body,
    );
  }
}
