import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:go_router/go_router.dart';

import '../colors/color.dart';
import '../colors/fontStyle.dart';
import '../controller/HomeController.dart';
import '../controller/manager.dart';
import '../routes/routes.dart';

class Login extends StatefulWidget {
  const Login({Key? key}) : super(key: key);

  @override
  State<Login> createState() => _LoginState();
}

class _LoginState extends State<Login> {
  @override
  void initState() {
    InitRoute.initRouter = 1;
    super.initState();
  }

  TextEditingController email = new TextEditingController();
  TextEditingController password = new TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      resizeToAvoidBottomInset: false,
      backgroundColor: mainBluedark,
      body: SafeArea(
        child: Column(children: [
          Expanded(
              flex: 4,
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                crossAxisAlignment: CrossAxisAlignment.center,
                children: [
                  Expanded(
                    flex: 5,
                    child: Container(
                      color: mainBluedark,
                      child: Image.asset(
                        "assets/icon/logo.png",
                        // width: 150,
                      ),
                    ),
                  ),
                  Expanded(
                    flex: 2,
                    child: Container(
                      child: Text(
                        "Shop CS",
                        style: fontBar.copyWith(color: mainGray, fontSize: 30),
                      ),
                    ),
                  )
                ],
              )),
          Expanded(
              flex: 8,
              child: Container(
                decoration: BoxDecoration(
                    color: mainGray,
                    borderRadius: BorderRadius.only(
                      topLeft: Radius.circular(50),
                      topRight: Radius.circular(50),
                    ),
                    boxShadow: [
                      BoxShadow(
                        color: Color.fromARGB(135, 12, 12, 12),
                        offset: Offset(0, -5),
                        blurRadius: 10.0,
                      ),
                    ]),
                child: Container(
                  margin: EdgeInsets.symmetric(vertical: 50),
                  child: SingleChildScrollView(
                    physics: NeverScrollableScrollPhysics(),
                    child: Column(
                      children: [
                        Container(
                          padding: EdgeInsets.symmetric(vertical: 5),
                          margin: EdgeInsets.all(10),
                          decoration: BoxDecoration(
                            color: Colors.white,
                            border: Border.all(width: 0.1, color: mainBluedark),
                            borderRadius: BorderRadius.circular(32),
                            boxShadow: [
                              BoxShadow(
                                color: Color.fromARGB(137, 92, 86, 86),
                                offset: Offset(0, 3.0),
                                blurRadius: 7.0,
                              ),
                            ],
                          ),
                          child: TextField(
                            controller: email,
                            cursorColor: mainBluedark,
                            textAlign: TextAlign.start,
                            decoration: InputDecoration(
                              hintStyle: TextStyle(fontSize: 13),
                              hintText: 'อีเมล',
                              border: InputBorder.none,
                              fillColor: mainBluedark,
                              focusColor: mainBluedark,
                              contentPadding: EdgeInsets.only(top: 0, left: 20),
                            ),
                          ),
                        ),
                        Container(
                          padding: EdgeInsets.symmetric(vertical: 5),
                          margin: EdgeInsets.all(10),
                          decoration: BoxDecoration(
                            color: Colors.white,
                            border: Border.all(width: 0.1, color: mainBluedark),
                            borderRadius: BorderRadius.circular(32),
                            boxShadow: [
                              BoxShadow(
                                color: Color.fromARGB(137, 92, 86, 86),
                                offset: Offset(0, 3.0),
                                blurRadius: 7.0,
                              ),
                            ],
                          ),
                          child: TextField(
                            controller: password,
                            cursorColor: mainBluedark,
                            textAlign: TextAlign.start,
                            decoration: InputDecoration(
                              hintStyle: TextStyle(fontSize: 13),
                              hintText: 'รหัสผ่าน',
                              border: InputBorder.none,
                              fillColor: mainBluedark,
                              focusColor: mainBluedark,
                              contentPadding: EdgeInsets.only(top: 0, left: 20),
                            ),
                          ),
                        ),
                        Column(
                          mainAxisAlignment: MainAxisAlignment.center,
                          crossAxisAlignment: CrossAxisAlignment.center,
                          children: [
                            Row(
                              mainAxisAlignment: MainAxisAlignment.center,
                              crossAxisAlignment: CrossAxisAlignment.center,
                              children: [
                                Container(
                                  margin: EdgeInsets.symmetric(vertical: 20),
                                  child: Text("ไม่มีบัญชี?"),
                                ),
                                GestureDetector(
                                  onTap: () {
                                    context.go("/Register");
                                  },
                                  child: Container(
                                    margin: EdgeInsets.symmetric(vertical: 20, horizontal: 5),
                                    child: Text(
                                      "ลงทะเบียน",
                                      style:
                                          TextStyle(color: mainOrange, fontWeight: FontWeight.bold),
                                    ),
                                  ),
                                ),
                              ],
                            ),
                            GestureDetector(
                              onTap: () {
                                // context.go("/Home");
                                Manager manager = new Manager();
                                manager.login(email: email.text,password: password.text,context: context);
                                HomeController.initTab = 0;
                              },
                              child: Container(
                                decoration: BoxDecoration(
                                    color: mainOrange,
                                    borderRadius: BorderRadius.all(Radius.circular(50)),
                                    boxShadow: [
                                      // BoxShadow(
                                      //   color: Color.fromARGB(135, 12, 12, 12),
                                      //   offset: Offset(0, -5),
                                      //   blurRadius: 10.0,
                                      // ),
                                    ]),
                                child: Container(
                                  alignment: Alignment.center,
                                  width: 180,
                                  height: 50,
                                  child: Text(
                                    "เข้าสู่ระบบ",
                                    style: fontBar.copyWith(color: mainWhite, fontSize: 14),
                                  ),
                                ),
                              ),
                            ),
                            Container(
                              alignment: Alignment.center,
                              padding: EdgeInsets.all(10),
                              child: Text(
                                "OR",
                                style: fontBar.copyWith(fontSize: 14),
                              ),
                            ),
                            Container(
                              child: Row(
                                mainAxisAlignment: MainAxisAlignment.center,
                                children: [
                                  Container(
                                    padding: EdgeInsets.symmetric(horizontal: 10),
                                    child: Image.asset(
                                      "assets/icon/google01.png",
                                      width: 50,
                                    ),
                                  ),
                                  Container(
                                    padding: EdgeInsets.symmetric(horizontal: 10),
                                    child: Image.asset(
                                      "assets/icon/facebook01.png",
                                      width: 50,
                                    ),
                                  ),
                                  Container(
                                    decoration: BoxDecoration(
                                      color: Colors.white,
                                      shape: BoxShape.circle,
                                    ),
                                    padding: EdgeInsets.symmetric(horizontal: 10, vertical: 5),
                                    // padding: EdgeInsets.symmetric(horizontal: 10),
                                    child: Image.asset(
                                      "assets/icon/line01.png",
                                      width: 40,
                                    ),
                                  ),
                                ],
                              ),
                            )
                          ],
                        ),
                      ],
                    ),
                  ),
                ),
              )),
        ]),
      ),
    );
    // const int tabsCount = 3;
    // return DefaultTabController(
    //   initialIndex: 0,
    //   length: tabsCount,
    //   child: Scaffold(
    //     body: SafeArea(
    //       child: TabBar(
    //         tabs: <Widget>[
    //           Tab(
    //             icon: const Icon(Icons.cloud_outlined),
    //             text: titles[0],
    //           ),
    //           Tab(
    //             icon: const Icon(Icons.beach_access_sharp),
    //             text: titles[1],
    //           ),
    //           Tab(
    //             icon: const Icon(Icons.brightness_5_sharp),
    //             text: titles[2],
    //           ),
    //         ],
    //       ),
    //     ),

    //     // body: TabBarView(
    //     //   children: <Widget>[
    //     //     ListView.builder(
    //     //       itemCount: 25,
    //     //       itemBuilder: (BuildContext context, int index) {
    //     //         return ListTile(
    //     //           tileColor: index.isOdd ? oddItemColor : evenItemColor,
    //     //           title: Text('${titles[0]} $index'),
    //     //         );
    //     //       },
    //     //     ),
    //     //     ListView.builder(
    //     //       itemCount: 25,
    //     //       itemBuilder: (BuildContext context, int index) {
    //     //         return ListTile(
    //     //           tileColor: index.isOdd ? oddItemColor : evenItemColor,
    //     //           title: Text('${titles[1]} $index'),
    //     //         );
    //     //       },
    //     //     ),
    //     //     ListView.builder(
    //     //       itemCount: 25,
    //     //       itemBuilder: (BuildContext context, int index) {
    //     //         return ListTile(
    //     //           tileColor: index.isOdd ? oddItemColor : evenItemColor,
    //     //           title: Text('${titles[2]} $index'),
    //     //         );
    //     //       },
    //     //     ),
    //     //   ],
    //     // ),
    //   ),
    // );
  }
}
