import 'package:flutter/material.dart';
import 'package:flutter/src/widgets/framework.dart';

import '../colors/color.dart';
import '../colors/fontStyle.dart';

class Register extends StatefulWidget {
  const Register({super.key});

  @override
  State<Register> createState() => _RegisterState();
}

class _RegisterState extends State<Register> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      // resizeToAvoidBottomInset: false,
      body: SafeArea(
          child: SingleChildScrollView(
        physics: BouncingScrollPhysics(),
        child: Column(
          children: [
            Container(
              alignment: Alignment.centerLeft,
              margin: EdgeInsets.only(top: 40, left: 15),
              // padding: EdgeInsets.only(left: 1),
              child: Text(
                "ลงทะเบียน",
                style: fontBar.copyWith(fontSize: 30),
              ),
            ),
            Container(
              alignment: Alignment.centerLeft,
              padding: EdgeInsets.symmetric(horizontal: 20),
              child: Text("กรุณากรอกข้อมูลต่อไปนี้"),
            ),
            SizedBox(
              height: 10,
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
            Container(
              child: GestureDetector(
                child: Row(
                  children: [
                    Expanded(
                      child: Container(
                        margin: EdgeInsets.symmetric(horizontal: 10, vertical: 40),
                        alignment: Alignment.center,
                        padding: EdgeInsets.symmetric(vertical: 20),
                        decoration: BoxDecoration(
                            color: mainBluedark,
                            borderRadius: BorderRadius.all(Radius.circular(50)),
                            boxShadow: [
                              // BoxShadow(
                              //   color: Color.fromARGB(135, 12, 12, 12),
                              //   offset: Offset(0, -5),
                              //   blurRadius: 10.0,
                              // ),
                            ]),
                        child: Text(
                          "ลงทะเบียน",
                          style: fontBar.copyWith(fontSize: 14, color: mainWhite),
                        ),
                      ),
                    ),
                  ],
                ),
              ),
            )
          ],
        ),
      )),
    );
  }
}
