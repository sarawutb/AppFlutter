import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:go_router/go_router.dart';

import '../colors/color.dart';
import '../colors/fontStyle.dart';

class MyEntry extends PopupMenuEntry<Never> {
  const MyEntry();

  @override
  double get height => kMinInteractiveDimension;

  @override
  bool represents(void value) => false;

  @override
  State<MyEntry> createState() => _MyEntryState();
}

class _MyEntryState extends State<MyEntry> {
  @override
  Widget build(BuildContext context) {
    return Expanded(
      child: Row(
        children: [
          SafeArea(
            child: Column(
              children: [
                Container(
                  height: 400,
                  width: 250,
                  child: SingleChildScrollView(
                    child: Column(
                      children: [
                        ...List<dynamic>.generate(
                          20,
                          (index) => GestureDetector(
                            child: Column(
                              mainAxisAlignment: MainAxisAlignment.start,
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                Container(
                                    padding: EdgeInsets.all(5),
                                    child: Text("รายการที่ ${index + 1}")),
                                Divider()
                              ],
                            ),
                            onTap: () {},
                          ),
                        )
                      ],
                    ),
                  ),
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }

  @override
  State<MyEntry> createState() => _MyEntryState();
}

bool statusDrawer = false;

Widget drawerMenu({required BuildContext context}) {
  return StatefulBuilder(builder: (BuildContext context, StateSetter setState) {
    return Column(
      children: [
        DrawerHeader(
          margin: EdgeInsets.zero,
          decoration: BoxDecoration(
            color: mainBar,
          ),
          padding: EdgeInsets.symmetric(horizontal: 10, vertical: 20),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.start,
            crossAxisAlignment: CrossAxisAlignment.end,
            children: [
              Container(
                  padding: EdgeInsets.all(20),
                  decoration: BoxDecoration(boxShadow: [
                    BoxShadow(
                        color: Colors.red.shade800,
                        blurRadius: 20,
                        spreadRadius: 2,
                        blurStyle: BlurStyle.inner)
                  ], shape: BoxShape.circle, color: mainGray),
                  child: FaIcon(
                    FontAwesomeIcons.user,
                    size: 40,
                    color: mainBluedark,
                  )),
              Container(
                  padding: EdgeInsets.all(10),
                  child: Text(
                    'rang7754',
                    style: fontBar.copyWith(fontSize: 17, color: White),
                  )),
            ],
          ),
        ),
        Container(
          padding: EdgeInsets.symmetric(vertical: 10, horizontal: 10),
          alignment: Alignment.centerLeft,
          child: Text("หมวดหมู่สินค้า"),
        ),
        Expanded(
          child: SingleChildScrollView(
            physics: BouncingScrollPhysics(),
            child: Column(
              children: [
                ExpansionTile(
                  controlAffinity: ListTileControlAffinity.trailing,
                  onExpansionChanged: (value) {
                    print(value);
                    setState(() {
                      statusDrawer = value;
                    });
                  },
                  // trailing: FaIcon(statusDrawer ? FontAwesomeIcons.angleUp : FontAwesomeIcons.angleDown),
                  textColor: mainBluedark,
                  collapsedIconColor: mainBar,
                  iconColor: mainBar,
                  tilePadding: EdgeInsets.symmetric(horizontal: 5),
                  expandedAlignment: Alignment.center,
                  // leading: Container(
                  //   child: Text("1234"),
                  // ),
                  title: Container(padding: EdgeInsets.all(10), child: Text("รายการที่")),
                  children: [
                    Container(
                      height: 300,
                      width: 300,
                      child: SingleChildScrollView(
                        physics: BouncingScrollPhysics(),
                        child: Column(
                          children: [
                            ...List<dynamic>.generate(
                              20,
                              (index) => GestureDetector(
                                child: Column(
                                  mainAxisAlignment: MainAxisAlignment.start,
                                  crossAxisAlignment: CrossAxisAlignment.start,
                                  children: [
                                    Container(
                                        padding: EdgeInsets.all(5),
                                        child: Text(" รายการที่ ${index + 1}")),
                                    Divider()
                                  ],
                                ),
                                onTap: () {},
                              ),
                            )
                          ],
                        ),
                      ),
                    ),
                  ],
                ),
              ],
            ),
          ),
        ),
        // Spacer(),
        ListTile(
          title: Row(
            children: [
              FaIcon(
                FontAwesomeIcons.signOut,
              ),
              SizedBox(
                width: 5,
              ),
              Text('ออกจากระบบ'),
            ],
          ),
          onTap: () {
            context.go("/Login");
          },
        ),
        Container(
          alignment: Alignment.bottomRight,
          padding: EdgeInsets.all(20),
          child: Text("v 1.0.0"),
        )
      ],
    );
  });
}
