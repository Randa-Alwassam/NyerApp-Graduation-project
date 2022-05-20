import 'package:flutter/material.dart';
import 'package:shared_preferences/shared_preferences.dart';

import 'db_helper.dart';
import 'home_page.dart';

class GameLeve3 extends StatefulWidget {
  const GameLeve3({Key key}) : super(key: key);

  @override
  _GameLeve3State createState() => _GameLeve3State();
}

class _GameLeve3State extends State<GameLeve3> {
  int opencard = 0;
  int showedcard = 0;
  List<String> checkCard = ["", "", ""];
  List<int> choossedCard = [0, 0, 0];

  List<bool> allcard = [
    false,
    false,
    false,
    false,
    false,
    false,
    false,
    false,
    false,
    false,
    false,
    false,
    false
  ];
  List<bool> allresultcard = [
    false,
    false,
    false,
    false,
    false,
    false,
    false,
    false,
    false,
    false,
    false,
    false,
    false
  ];
  int count=0;
  int  level,points,id;

  _read() async {
    final prefs = await SharedPreferences.getInstance();

    final keyLevel = 'level';
    final keypoints = 'points';
    final keyId = 'ID';

    final valueLevel = prefs.getInt(keyLevel);
    final valuePoints = prefs.getInt(keypoints);
    final valueID = prefs.getInt(keyId);

    setState(() {
      id=valueID;
      points =valuePoints;
      level=valueLevel;
    });
  }

  @override
  void initState() {
    super.initState();
    _read();
  }

  @override
  Widget build(BuildContext context) {
    double size = MediaQuery.of(context).size.width *0.27;

    return Scaffold(
      floatingActionButton: FloatingActionButton(
        child: Icon(Icons.refresh),
        onPressed: () {
          setState(
                () {
                  count=0;
              opencard = 0;
              showedcard = 0;
              checkCard = ["", "", ""];
              choossedCard = [0, 0, 0];

              allcard = [
                false,
                false,
                false,
                false,
                false,
                false,
                false,
                false,
                false,
                false,
                false,
                false,
                false
              ];
              allresultcard = [
                false,
                false,
                false,
                false,
                false,
                false,
                false,
                false,
                false,
                false,
                false,
                false,
                false
              ];
            },
          );
        },
      ),
      body: Center(
        child: Column(
          children: [
            Container(
              height: 50,
            ),
            Container(
              height: MediaQuery.of(context).size.height * 0.75,
              child: Row(
                mainAxisAlignment: MainAxisAlignment.center,
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Column(
                    children: [
                      //  card 1 //
                      GestureDetector(
                        onTap: () {
                          if (opencard < 2 && !allcard[1]) {
                            setState(
                                  () {
                                opencard++;
                                allcard[1] = true;
                              },
                            );
                          }
                        },
                        onLongPress: () {
                          if (allcard[1]) {
                            if (!allresultcard[1]) {
                              showedcard++;
                              choossedCard[showedcard] = 1;
                              checkCard[showedcard] = "print1";
                              checkResult();
                            }
                            showDialog(
                              context: context,
                              builder: (BuildContext context) {
                                return AlertDialog(
                                  content: Container(
                                    width: MediaQuery.of(context).size.width * 0.8,
                                    height:
                                    MediaQuery.of(context).size.height * 0.6,
                                    color: Color(0x81ffba81),
                                    child: Column(
                                      crossAxisAlignment: CrossAxisAlignment.center,
                                      children: [
                                        Text(
                                          "List",
                                          style: TextStyle(
                                              color: Color(0xbf020202),
                                              fontWeight: FontWeight.bold,
                                              fontSize: 35),
                                        ),
                                        Container(
                                          height: 20,
                                        ),
                                        Text(
                                          "القوائم أكثر فائدة من السلاسل لانه يمكن معالجتها والتعامل معها على اجزاء مثلا ",
                                          textDirection: TextDirection.rtl,
                                          style: TextStyle(
                                              color: Color(0xbf020202),
                                              fontSize: 18),
                                        ),
                                        Container(
                                          height: 5,
                                        ),
                                        Text(
                                          "wizard_list = 'spider legs, toe of frog, eye of newt, bat wing,\n"+
                                          "  slug butter, snake dandruff' ",
                                          style: TextStyle(
                                              color: Color(0xbf020202),
                                              fontSize: 18),
                                        ),Container(
                                          height: 5,
                                        ),
                                        Text(
                                          " هذي السلسلة يمكن كتابتها كقائمة بالشكل التالي ",
                                          style: TextStyle(
                                              color: Color(0xbf020202),
                                              fontSize: 18),
                                        ),Container(
                                          height: 5,
                                        ),
                                        Text(
                                          "wizard_list = ['spider legs', 'toe of frog', 'eye of newt',\n"+
                                          "  'bat wing', 'slug butter', 'snake dandruff']",
                                          style: TextStyle(
                                              color: Color(0xbf020202),
                                              fontSize: 18),
                                        ),
                                      ],
                                    ),
                                  ),
                                );
                              },
                            );
                          }
                        },
                        child: Container(
                          decoration: new BoxDecoration(
                            color: Color(0x66d4d3d3),
                            borderRadius: BorderRadius.circular(15.0),
                            border: Border.all(
                              color: Color(0xff636363),
                            ),
                          ),
                          width: size,
                          height: size,
                          child: allcard[1]
                              ? Container(
                            width: size,
                            height: size,
                            child: Column(
                              mainAxisAlignment: MainAxisAlignment.center,
                              children: [
                                Text(
                                  "List",
                                  style: TextStyle(
                                    fontSize: 25,
                                    color: Color(0xff00709c),
                                  ),
                                ),
                                Text(
                                  "القوائم",
                                  style: TextStyle(
                                    fontSize: 15,
                                    color: Color(0xff000000),
                                  ),
                                ),
                              ],
                            ),
                          )
                              : Image.asset(
                            "assets/python_icon.png",
                            height: size,
                            width: size,
                          ),
                        ),
                      ),
                      Container(
                        height: 15,
                      ),
                      //  card 2 //
                      GestureDetector(
                        onTap: () {
                          if (opencard < 2 && !allcard[2]) {
                            setState(
                                  () {
                                opencard++;
                                allcard[2] = true;
                              },
                            );
                          }
                        },
                        onLongPress: () {
                          if (allcard[2]) {
                            if (!allresultcard[2]) {
                              showedcard++;
                              choossedCard[showedcard] = 2;
                              checkCard[showedcard] = "print2";
                              checkResult();
                              checkResult();
                            }
                            showDialog(
                              context: context,
                              builder: (BuildContext context) {
                                return AlertDialog(
                                  content: Container(
                                    width: MediaQuery.of(context).size.width * 0.8,
                                    height:
                                    MediaQuery.of(context).size.height * 0.3,
                                    color: Color(0x9af5d76b),
                                    child: Column(
                                      crossAxisAlignment: CrossAxisAlignment.center,
                                      children: [
                                        Text(
                                          "Lists",
                                          style: TextStyle(
                                              color: Color(0xbf020202),
                                              fontWeight: FontWeight.bold,
                                              fontSize: 35),
                                        ),
                                        Container(
                                          height: 20,
                                        ),
                                        Text(
                                          'يمكننا  تغيير عنصر في القائمة بسهولة   ',
                                          textDirection: TextDirection.rtl,
                                          style: TextStyle(
                                              color: Color(0xbf020202),
                                              fontSize: 18),
                                        ),
                                        Container(
                                          height: 5,
                                        ),
                                        Text(
                                          'نقوم فقط بتحدد الموقع واسناد الفقيمة الجديدة',
                                          textDirection: TextDirection.rtl,
                                          style: TextStyle(
                                              color: Color(0xbf020202),
                                              fontSize: 18),
                                        ),
                                      ],
                                    ),
                                  ),
                                );
                              },
                            );
                          }
                        },
                        child: Container(
                          decoration: new BoxDecoration(
                            color: Color(0x66d4d3d3),
                            borderRadius: BorderRadius.circular(15.0),
                            border: Border.all(
                              color: Color(0xff636363),
                            ),
                          ),
                          width: size,
                          height: size,
                          child: allcard[2]
                              ? Container(
                            width: size,
                            height: size,
                            child: Column(
                              mainAxisAlignment: MainAxisAlignment.center,
                              children: [
                                Text(
                                  "Lists",
                                  style: TextStyle(
                                    fontSize: 25,
                                    color: Color(0xff00709c),
                                  ),
                                ),
                                Text(
                                  "تعديل عناصر قائمة",
                                  style: TextStyle(
                                    fontSize: 15,
                                    color: Color(0xff000000),
                                  ),
                                ),
                              ],
                            ),
                          )
                              : Image.asset(
                            "assets/python_icon.png",
                            height: size,
                            width: size,
                          ),
                        ),
                      ),
                      Container(
                        height: 15,
                      ),
                      //  card 3 //
                      GestureDetector(
                        onTap: () {
                          if (opencard < 2 && !allcard[3]) {
                            setState(() {
                              opencard++;
                              allcard[3] = true;
                            });
                          }
                        },
                        onLongPress: () {
                          if (allcard[3]) {
                            if (!allresultcard[3]) {
                              showedcard++;
                              choossedCard[showedcard] = 3;
                              checkCard[showedcard] = "print3";
                              checkResult();
                              checkResult();
                            }
                            showDialog(
                              context: context,
                              builder: (BuildContext context) {
                                return AlertDialog(
                                  content: Container(
                                    width: MediaQuery.of(context).size.width * 0.8,
                                    height:
                                    MediaQuery.of(context).size.height * 0.3,
                                    color: Color(0x9af5d76b),
                                    child: Column(
                                      crossAxisAlignment: CrossAxisAlignment.center,
                                      children: [

                                        Text(
                                          '  يمكن إظهار مجموعة فرعية من العناصر الموجودة في القائمة ',
                                          style: TextStyle(
                                              color: Color(0xbf020202),
                                              fontSize: 18),
                                        ),
                                        Container(
                                          height: 5,
                                        ),
                                        Text(
                                          ' نقوم بذلك عن طريق باستخدام نقطتين (:) داخل الأقواس المربعة.',
                                          style: TextStyle(
                                              color: Color(0xbf020202),
                                              fontSize: 30),
                                        ),

                                      ],
                                    ),
                                  ),
                                );
                              },
                            );
                          }
                        },
                        child: Container(
                          decoration: new BoxDecoration(
                            color: Color(0x66d4d3d3),
                            borderRadius: BorderRadius.circular(15.0),
                            border: Border.all(
                              color: Color(0xff636363),
                            ),
                          ),
                          width: size,
                          height: size,
                          child: allcard[3]
                              ? Container(
                            width: size,
                            height: size,
                            child: Column(
                              mainAxisAlignment: MainAxisAlignment.center,
                              children: [
                                Text(
                                  "Lists",
                                  style: TextStyle(
                                    fontSize: 25,
                                    color: Color(0xff00709c),
                                  ),
                                ),
                                Text(
                                  " مجموعة فرعيه",
                                  style: TextStyle(
                                    fontSize: 15,
                                    color: Color(0xff000000),
                                  ),
                                ),
                              ],
                            ),
                          )
                              : Image.asset(
                            "assets/python_icon.png",
                            height: size,
                            width: size,
                          ),
                        ),
                      ),
                      Container(
                        height: 15,
                      ),
                      //  card 10 //
                      GestureDetector(
                        onTap: () {
                          if (opencard < 2 && !allcard[10]) {
                            setState(() {
                              opencard++;
                              allcard[10] = true;
                            });
                          }
                        },
                        onLongPress: () {
                          if (allcard[10]) {
                            if (!allresultcard[10]) {
                              showedcard++;
                              choossedCard[showedcard] = 10;
                              checkCard[showedcard] = "print6";
                              checkResult();
                              checkResult();
                            }
                            showDialog(
                              context: context,
                              builder: (BuildContext context) {
                                return AlertDialog(
                                  content: Container(
                                    width: MediaQuery.of(context).size.width * 0.8,
                                    height:
                                    MediaQuery.of(context).size.height * 0.3,
                                    color: Color(0x9a37f6ba),
                                    child: Column(
                                      crossAxisAlignment: CrossAxisAlignment.center,
                                      children: [

                                        Text(
                                          "list1 = [1, 2, 3, 4]",
                                          textDirection: TextDirection.ltr,
                                          style: TextStyle(
                                              color: Color(0xbf020202),
                                              fontSize: 18),
                                        ),
                                        Container(
                                          height: 5,
                                        ),
                                        Text(
                                          "list2 = ['I', 'ate', 'chocolate', 'and', 'I', 'want', 'more']",
                                          textDirection: TextDirection.ltr,
                                          style: TextStyle(
                                              color: Color(0xbf020202),
                                              fontSize: 18),
                                        ),
                                        Container(
                                          height: 5,
                                        ),
                                        Text(
                                          "list3 = list1 + list2",
                                          textDirection: TextDirection.ltr,

                                          style: TextStyle(
                                              color: Color(0xbf020202),
                                              fontSize: 18),
                                        ),
                                        Container(
                                          height: 5,
                                        ),
                                        Text(
                                          " [1, 2, 3, 4, 'I', 'ate', 'chocolate', 'and', 'I', 'want', 'more'] ",
                                          textDirection: TextDirection.ltr,
                                          style: TextStyle(
                                              color: Color(0xbf020202),
                                              fontSize: 18),
                                        ),
                                      ],
                                    ),
                                  ),
                                );
                              },
                            );
                          }
                        },
                        child: Container(
                          decoration: new BoxDecoration(
                            color: Color(0x66d4d3d3),
                            borderRadius: BorderRadius.circular(15.0),
                            border: Border.all(
                              color: Color(0xff636363),
                            ),
                          ),
                          width: size,
                          height: size,
                          child: allcard[10]
                              ? Container(
                            width: size,
                            height: size,
                            child: Column(
                              mainAxisAlignment: MainAxisAlignment.center,
                              children: [
                                Text(
                                  "Lists",
                                  style: TextStyle(
                                    fontSize: 25,
                                    color: Color(0xff00709c),
                                  ),
                                ),
                                Text(
                                  "دمج القوائم",
                                  textAlign: TextAlign.center,
                                  style: TextStyle(
                                    fontSize: 15,
                                    color: Color(0xff000000),
                                  ),
                                ),
                              ],
                            ),
                          )
                              : Image.asset(
                            "assets/python_icon.png",
                            height: size,
                            width: size,
                          ),
                        ),
                      ),
                    ],
                  ),
                  Container(
                    width: 25,
                  ),
                  Column(
                    children: [
                      //  card 4 //
                      GestureDetector(
                        onTap: () {
                          if (opencard < 2 && !allcard[4]) {
                            setState(
                                  () {
                                opencard++;
                                allcard[4] = true;
                              },
                            );
                          }
                        },
                        onLongPress: () {
                          if (allcard[4]) {
                            if (!allresultcard[4]) {
                              showedcard++;
                              choossedCard[showedcard] = 4;
                              checkCard[showedcard] = "print4";
                              checkResult();
                            }
                            showDialog(
                              context: context,
                              builder: (BuildContext context) {
                                return AlertDialog(
                                  content: Container(
                                    width: MediaQuery.of(context).size.width * 0.8,
                                    height:
                                    MediaQuery.of(context).size.height * 0.3,
                                    color: Color(0x9abaf824),
                                    child: Column(
                                      crossAxisAlignment: CrossAxisAlignment.center,
                                      children: [

                                        Text(
                                          "لإضافة عناصر إلى قائمة ، نستخدم التابع append .",
                                          textDirection: TextDirection.rtl,
                                          style: TextStyle(
                                              color: Color(0xbf020202),
                                              fontSize: 18),
                                        ),
                                        Container(
                                          height: 5,
                                        ),
                                        Text(
                                          "الذي يضيف عنصرًا إلى نهاية القائمة.",
                                          textDirection: TextDirection.rtl,
                                          style: TextStyle(
                                              color: Color(0xbf020202),
                                              fontSize: 18),
                                        ),
                                      ],
                                    ),
                                  ),
                                );
                              },
                            );
                          }
                        },
                        child: Container(
                          decoration: new BoxDecoration(
                            color: Color(0x66d4d3d3),
                            borderRadius: BorderRadius.circular(15.0),
                            border: Border.all(
                              color: Color(0xff636363),
                            ),
                          ),
                          width: size,
                          height: size,
                          child: allcard[4]
                              ? Container(
                            width: size,
                            height: size,
                            child: Column(
                              mainAxisAlignment: MainAxisAlignment.center,
                              children: [
                                Text(
                                  "Lists",
                                  style: TextStyle(
                                    fontSize: 25,
                                    color: Color(0xff00709c),
                                  ),
                                ),
                                Text(
                                  " اضافة عنصر",
                                  style: TextStyle(
                                    fontSize: 15,
                                    color: Color(0xff000000),
                                  ),
                                ),
                              ],
                            ),
                          )
                              : Image.asset(
                            "assets/python_icon.png",
                            height: size,
                            width: size,
                          ),
                        ),
                      ),
                      Container(
                        height: 15,
                      ),
                      //  card 5 //
                      GestureDetector(
                        onTap: () {
                          if (opencard < 2 && !allcard[5]) {
                            setState(
                                  () {
                                opencard++;
                                allcard[5] = true;
                              },
                            );
                          }
                        },
                        onLongPress: () {
                          if (allcard[5]) {
                            if (!allresultcard[5]) {
                              showedcard++;
                              choossedCard[showedcard] = 5;
                              checkCard[showedcard] = "print5";
                              checkResult();
                              checkResult();
                            }
                            showDialog(
                              context: context,
                              builder: (BuildContext context) {
                                return AlertDialog(
                                  content: Container(
                                    width: MediaQuery.of(context).size.width * 0.8,
                                    height:
                                    MediaQuery.of(context).size.height * 0.3,
                                    color: Color(0x9a8888ba),
                                    child: Column(
                                      crossAxisAlignment: CrossAxisAlignment.center,
                                      children: [

                                        Text(
                                          "لإزالة عناصر من قائمة ، استخدم الأمر del (اختصار للحذف).",
                                          textDirection: TextDirection.rtl,
                                          style: TextStyle(
                                              color: Color(0xbf020202),
                                              fontSize: 18),
                                        ),
                                        Container(
                                          height: 5,
                                        ),
                                        Text(
                                          ' ونقوم بتمرر موقع العنصر المراد حذفه  ',
                                          textDirection: TextDirection.ltr,
                                          style: TextStyle(
                                              color: Color(0xbf020202),
                                              fontSize: 18),
                                        ),
                                      ],
                                    ),
                                  ),
                                );
                              },
                            );
                          }
                        },
                        child: Container(
                          decoration: new BoxDecoration(
                            color: Color(0x66d4d3d3),
                            borderRadius: BorderRadius.circular(15.0),
                            border: Border.all(
                              color: Color(0xff636363),
                            ),
                          ),
                          width: size,
                          height: size,
                          child: allcard[5]
                              ? Container(
                              width: size,
                              height: size,
                              child: Column(
                                mainAxisAlignment: MainAxisAlignment.center,
                                children: [
                                  Text(
                                    "Lists",
                                    style: TextStyle(
                                      fontSize: 25,
                                      color: Color(0xff00709c),
                                    ),
                                  ),
                                  Text(
                                    " حذف عنصر",
                                    style: TextStyle(
                                      fontSize: 15,
                                      color: Color(0xff000000),
                                    ),
                                  ),
                                ],
                              ))
                              : Image.asset(
                            "assets/python_icon.png",
                            height: size,
                            width: size,
                          ),
                        ),
                      ),
                      Container(
                        height: 15,
                      ),
                      //  card 6 //
                      GestureDetector(
                        onTap: () {
                          if (opencard < 2 && !allcard[6]) {
                            setState(
                                  () {
                                opencard++;
                                allcard[6] = true;
                              },
                            );
                          }
                        },
                        onLongPress: () {
                          if (allcard[6]) {
                            if (!allresultcard[6]) {
                              showedcard++;
                              choossedCard[showedcard] = 6;
                              checkCard[showedcard] = "print4";
                              checkResult();
                              checkResult();
                            }
                            showDialog(
                              context: context,
                              builder: (BuildContext context) {
                                return AlertDialog(
                                  content: Container(
                                    width: MediaQuery.of(context).size.width * 0.8,
                                    height:
                                    MediaQuery.of(context).size.height * 0.3,
                                    color: Color(0x9abaf824),
                                    child: Column(
                                      crossAxisAlignment: CrossAxisAlignment.center,
                                      children: [
                                        Text(
                                          "يتم استخدام التابع append بالشكل التالي",
                                          textDirection: TextDirection.rtl,
                                          style: TextStyle(
                                              color: Color(0xbf020202),
                                              fontSize: 18),
                                        ),
                                        Container(
                                          height: 5,
                                        ),
                                        Text(
                                          " wizard_list.append('bear burp')",
                                          textDirection: TextDirection.ltr,
                                          style: TextStyle(
                                              color: Color(0xbf020202),
                                              fontSize: 18),
                                        ),
                                        Container(
                                          height: 5,
                                        ),
                                        Text(
                                          " وعند طباعة القائمة نلاحظ اضافة العنصر الى نهايتها",
                                          textDirection: TextDirection.rtl,
                                          style: TextStyle(
                                              color: Color(0xbf020202),
                                              fontSize: 18),
                                        ),
                                        Container(
                                          height: 5,
                                        ),
                                        Text(
                                     "   ['spider legs', 'toe of frog', 'snail tongue', 'bat wing', "+
                                         "'slug butter', 'snake dandruff', 'bear burp']",
                                          textDirection: TextDirection.ltr,
                                          style: TextStyle(
                                              color: Color(0xbf020202),
                                              fontSize: 18),
                                        ),
                                      ],
                                    ),
                                  ),
                                );
                              },
                            );
                          }
                        },
                        child: Container(
                          decoration: new BoxDecoration(
                            color: Color(0x66d4d3d3),
                            borderRadius: BorderRadius.circular(15.0),
                            border: Border.all(
                              color: Color(0xff636363),
                            ),
                          ),
                          width: size,
                          height: size,
                          child: allcard[6]
                              ? Container(
                            width: size,
                            height: size,
                            child: Column(
                              mainAxisAlignment: MainAxisAlignment.center,
                              children: [
                                Text(
                                  "Lists",
                                  style: TextStyle(
                                      fontSize: 25, color: Color(0xff00709c)),
                                ),
                                Text(
                                  " اضافة عنصر",
                                  style: TextStyle(
                                    fontSize: 15,
                                    color: Color(0xff000000),
                                  ),
                                ),
                              ],
                            ),
                          )
                              : Image.asset(
                            "assets/python_icon.png",
                            height: size,
                            width: size,
                          ),
                        ),
                      ),
                      Container(
                        height: 15,
                      ),
                      //  card 11 //
                      GestureDetector(
                        onTap: () {
                          if (opencard < 2 && !allcard[11]) {
                            setState(
                                  () {
                                opencard++;
                                allcard[11] = true;
                              },
                            );
                          }
                        },
                        onLongPress: () {
                          if (allcard[11]) {
                            if (!allresultcard[11]) {
                              showedcard++;
                              choossedCard[showedcard] = 11;
                              checkCard[showedcard] = "print1";
                              checkResult();
                              checkResult();
                            }
                            showDialog(
                              context: context,
                              builder: (BuildContext context) {
                                return AlertDialog(
                                  content: Container(
                                    width: MediaQuery.of(context).size.width * 0.8,
                                    height:
                                    MediaQuery.of(context).size.height * 0.3,
                                    color: Color(0x81ffba81),
                                    child: Column(
                                      crossAxisAlignment: CrossAxisAlignment.center,
                                      children: [

                                        Text(
                                             ' يمكننا طباعة العنصر الثالث في wizard_list ',
                                          textDirection: TextDirection.rtl,
                                          style: TextStyle(
                                              color: Color(0xbf020202),
                                              fontSize: 18),
                                        ),
                                        Container(
                                          height: 5,
                                        ),
                                        Text(
                                          '   عن طريق إدخال موقعه في القائمة داخل اقواس مربعه [] ',
                                          textDirection: TextDirection.rtl,
                                          style: TextStyle(
                                              color: Color(0xbf020202),
                                              fontSize: 18),
                                        ), Container(
                                          height: 5,
                                        ),
                                        Text(
                                          ' print(wizard_list[2]) ',
                                          textDirection: TextDirection.ltr,
                                          style: TextStyle(
                                              color: Color(0xbf020202),
                                              fontSize: 18),
                                        ),
                                        Container(
                                          height: 5,
                                        ),
                                        Text(
                                          ' يبدأ العد من الرقم 0 فيكون العنصر الثالث له الموقع 2 ضمن القائمة',
                                          textDirection: TextDirection.ltr,
                                          style: TextStyle(
                                              color: Color(0xbf020202),
                                              fontSize: 18),
                                        ),
                                      ],
                                    ),
                                  ),
                                );
                              },
                            );
                          }
                        },
                        child: Container(
                          decoration: new BoxDecoration(
                            color: Color(0x66d4d3d3),
                            borderRadius: BorderRadius.circular(15.0),
                            border: Border.all(
                              color: Color(0xff636363),
                            ),
                          ),
                          width: size,
                          height: size,
                          child: allcard[11]
                              ? Container(
                            width: size,
                            height: size,
                            child: Column(
                              mainAxisAlignment: MainAxisAlignment.center,
                              children: [
                                Text(
                                  "List",
                                  style: TextStyle(
                                    fontSize: 25,
                                    color: Color(0xff00709c),
                                  ),
                                ),
                                Text(
                                  "القوائم",
                                  textAlign: TextAlign.center,
                                  style: TextStyle(
                                    fontSize: 15,
                                    color: Color(0xff000000),
                                  ),
                                ),
                              ],
                            ),
                          )
                              : Image.asset(
                            "assets/python_icon.png",
                            height: size,
                            width: size,
                          ),
                        ),
                      ),
                    ],
                  ),
                  Container(
                    width: 25,
                  ),
                  Column(
                    children: [
                      //  card 7 //
                      GestureDetector(
                        onTap: () {
                          if (opencard < 2 && !allcard[7]) {
                            setState(() {
                              opencard++;
                              allcard[7] = true;
                            });
                          }
                        },
                        onLongPress: () {
                          if (allcard[7]) {
                            if (!allresultcard[7]) {
                              showedcard++;
                              choossedCard[showedcard] = 7;
                              checkCard[showedcard] = "print3";
                              checkResult();
                            }
                            showDialog(
                              context: context,
                              builder: (BuildContext context) {
                                return AlertDialog(
                                  content: Container(
                                    width: MediaQuery.of(context).size.width * 0.8,
                                    height:
                                    MediaQuery.of(context).size.height * 0.4,
                                    color: Color(0x9af5d76b),
                                    child: Column(
                                      crossAxisAlignment: CrossAxisAlignment.center,
                                      children: [

                                        Text(
                                            "على سبيل المثال ، لرؤية العناصر من الثالث إلى الخامس في قائمة wizard_list",
                                          textDirection: TextDirection.rtl,
                                          style: TextStyle(
                                              color: Color(0xbf020202),
                                              fontSize: 18),
                                        ),
                                        Container(
                                          height: 5,
                                        ),
                                        Text(
                                          'print(wizard_list[2:5])',
                                          textDirection: TextDirection.ltr,
                                          style: TextStyle(
                                              color: Color(0xbf020202),
                                              fontSize: 18),
                                        ),
                                        Container(
                                          height: 5,
                                        ),
                                        Text(
                                          " ['snail tongue', 'bat wing', 'slug butter']",
                                          textDirection: TextDirection.ltr,
                                          style: TextStyle(
                                              color: Color(0xbf020202),
                                              fontSize: 18),
                                        ),
                                      ],
                                    ),
                                  ),
                                );
                              },
                            );
                          }
                        },
                        child: Container(
                          decoration: new BoxDecoration(
                            color: Color(0x66d4d3d3),
                            borderRadius: BorderRadius.circular(15.0),
                            border: Border.all(
                              color: Color(0xff636363),
                            ),
                          ),
                          width: size,
                          height: size,
                          child: allcard[7]
                              ? Container(
                            width: size,
                            height: size,
                            child: Column(
                              mainAxisAlignment: MainAxisAlignment.center,
                              children: [
                                Text(
                                  "Lists",
                                  style: TextStyle(
                                    fontSize: 25,
                                    color: Color(0xff00709c),
                                  ),
                                ),
                                Text(
                                  "مجموعة فرعيه",
                                  style: TextStyle(
                                    fontSize: 15,
                                    color: Color(0xff000000),
                                  ),
                                ),
                              ],
                            ),
                          )
                              : Image.asset(
                            "assets/python_icon.png",
                            height: size,
                            width: size,
                          ),
                        ),
                      ),
                      Container(
                        height: 15,
                      ),
                      //  card 8 //
                      GestureDetector(
                        onTap: () {
                          if (opencard < 2 && !allcard[8]) {
                            setState(() {
                              opencard++;
                              allcard[8] = true;
                            });
                          }
                        },
                        onLongPress: () {
                          if (allcard[8]) {
                            if (!allresultcard[8]) {
                              showedcard++;
                              choossedCard[showedcard] = 8;
                              checkCard[showedcard] = "print6";
                              checkResult();
                              checkResult();
                            }
                            showDialog(
                              context: context,
                              builder: (BuildContext context) {
                                return AlertDialog(
                                  content: Container(
                                    width: MediaQuery.of(context).size.width * 0.8,
                                    height:
                                    MediaQuery.of(context).size.height * 0.4,
                                    color: Color(0x9a37f6ba),
                                    child: Column(
                                      crossAxisAlignment: CrossAxisAlignment.center,
                                      children: [

                                        Text(
                                          " يمكننا ضم القوائم عن طريق إضافتها ، تمامًا مثل إضافة الأرقام ، باستخدام علامة زائد (+).",
                                          textDirection: TextDirection.rtl,
                                          style: TextStyle(
                                              color: Color(0xbf020202),
                                              fontSize: 18),
                                        ),
                                        Container(
                                          height: 5,
                                        ),
                                        Text(
                                          ' يمكننا أيضًا إضافة القائمتين واسناد النتيجة الى متغير آخر ',
                                          textDirection: TextDirection.ltr,
                                          style: TextStyle(
                                              color: Color(0xbf020202),
                                              fontSize: 18),
                                        ),
                                      ],
                                    ),
                                  ),
                                );
                              },
                            );
                          }
                        },
                        child: Container(
                          decoration: new BoxDecoration(
                            color: Color(0x66d4d3d3),
                            borderRadius: BorderRadius.circular(15.0),
                            border: Border.all(
                              color: Color(0xff636363),
                            ),
                          ),
                          width: size,
                          height: size,
                          child: allcard[8]
                              ? Container(
                            width: size,
                            height: size,
                            child: Column(
                              mainAxisAlignment: MainAxisAlignment.center,
                              children: [
                                Text(
                                  "Lists",
                                  style: TextStyle(
                                    fontSize: 25,
                                    color: Color(0xff00709c),
                                  ),
                                ),
                                Text(
                                  "دمج القوائم",
                                  style: TextStyle(
                                    fontSize: 15,
                                    color: Color(0xff000000),
                                  ),
                                ),
                              ],
                            ),
                          )
                              : Image.asset(
                            "assets/python_icon.png",
                            height: size,
                            width: size,
                          ),
                        ),
                      ),
                      Container(
                        height: 15,
                      ),
                      //  card 9 //
                      GestureDetector(
                        onTap: () {
                          if (opencard < 2 && !allcard[9]) {
                            setState(() {
                              opencard++;
                              allcard[9] = true;
                            });
                          }
                        },
                        onLongPress: () {
                          if (allcard[9]) {
                            if (!allresultcard[9]) {
                              showedcard++;
                              choossedCard[showedcard] = 9;
                              checkCard[showedcard] = "print2";
                              checkResult();
                              checkResult();
                            }
                            showDialog(
                              context: context,
                              builder: (BuildContext context) {
                                return AlertDialog(
                                  content: Container(
                                    width: MediaQuery.of(context).size.width * 0.8,
                                    height:
                                    MediaQuery.of(context).size.height * 0.3,
                                    color: Color(0x9af5d76b),
                                    child: Column(
                                      crossAxisAlignment: CrossAxisAlignment.center,
                                      children: [

                                        Text(   "wizard_list = ['spider legs', 'toe of frog', 'eye of newt',"+
                                                 " 'bat wing', 'slug butter', 'snake dandruff'] ",
                                          textDirection: TextDirection.ltr,
                                          style: TextStyle(
                                              color: Color(0xbf020202),
                                              fontSize: 18),
                                        ),
                                        Container(
                                          height: 5,
                                        ),
                                        Text(
                                          '  نغير قيمة العنصر الثالث في القائمة السابقة بالشكل التالي ',
                                          textDirection: TextDirection.rtl,
                                          style: TextStyle(
                                              color: Color(0xbf020202),
                                              fontSize: 18),
                                        ),
Container(
                                          height: 5,
                                        ),
                                        Text(
                                          " wizard_list[2] = ' snail tongue ' ",
                                          textDirection: TextDirection.ltr,
                                          style: TextStyle(
                                              color: Color(0xbf020202),
                                              fontSize: 18),
                                        ),

                                      ],
                                    ),
                                  ),
                                );
                              },
                            );
                          }
                        },
                        child: Container(
                          decoration: new BoxDecoration(
                            color: Color(0x66d4d3d3),
                            borderRadius: BorderRadius.circular(15.0),
                            border: Border.all(
                              color: Color(0xff636363),
                            ),
                          ),
                          width: size,
                          height: size,
                          child: allcard[9]
                              ? Container(
                            width: size,
                            height: size,
                            child: Column(
                              mainAxisAlignment: MainAxisAlignment.center,
                              children: [
                                Text(
                                  "Lists",
                                  style: TextStyle(
                                    fontSize: 25,
                                    color: Color(0xff00709c),
                                  ),
                                ),
                                Text(
                                  "تعديل عناصر قائمة",
                                  textAlign: TextAlign.center,
                                  style: TextStyle(
                                    fontSize: 15,
                                    color: Color(0xff000000),
                                  ),
                                ),
                              ],
                            ),
                          )
                              : Image.asset(
                            "assets/python_icon.png",
                            height: size,
                            width: size,
                          ),
                        ),
                      ),
                      Container(
                        height: 15,
                      ),
                      //  card 12 //
                      GestureDetector(
                        onTap: () {
                          if (opencard < 2 && !allcard[12]) {
                            setState(
                                  () {
                                opencard++;
                                allcard[12] = true;
                              },
                            );
                          }
                        },
                        onLongPress: () {
                          if (allcard[12]) {
                            if (!allresultcard[12]) {
                              showedcard++;
                              choossedCard[showedcard] = 12;
                              checkCard[showedcard] = "print5";
                              checkResult();
                              checkResult();
                            }
                            showDialog(
                              context: context,
                              builder: (BuildContext context) {
                                return AlertDialog(
                                  content: Container(
                                    width: MediaQuery.of(context).size.width * 0.8,
                                    height:
                                    MediaQuery.of(context).size.height * 0.3,
                                    color: Color(0x9a8888ba),
                                    child: Column(
                                      crossAxisAlignment: CrossAxisAlignment.center,
                                      children: [

                                        Text(
                                          'لحذف العنصر السادس نمرر رقم 5 الذي يمثل موقع العنصر',
                                          textDirection: TextDirection.rtl,
                                          style: TextStyle(
                                              color: Color(0xbf020202),
                                              fontSize: 18),
                                        ),
                                        Container(
                                          height: 5,
                                        ),
                                        Text(
                                          "del wizard_list[5]",
                                          textDirection: TextDirection.ltr,
                                          style: TextStyle(
                                              color: Color(0xbf020202),
                                              fontSize: 18),
                                        ),
                                      ],
                                    ),
                                  ),
                                );
                              },
                            );
                          }
                        },
                        child: Container(
                          decoration: new BoxDecoration(
                            color: Color(0x66d4d3d3),
                            borderRadius: BorderRadius.circular(15.0),
                            border: Border.all(
                              color: Color(0xff636363),
                            ),
                          ),
                          width: size,
                          height: size,
                          child: allcard[12]
                              ? Container(
                            width: size,
                            height: size,
                            child: Column(
                              mainAxisAlignment: MainAxisAlignment.center,
                              children: [
                                Text(
                                  "Lists",
                                  style: TextStyle(
                                    fontSize: 25,
                                    color: Color(0xff00709c),
                                  ),
                                ),
                                Text(
                                  " حذف عنصر",
                                  textAlign: TextAlign.center,
                                  style: TextStyle(
                                    fontSize: 15,
                                    color: Color(0xff000000),
                                  ),
                                ),
                              ],
                            ),
                          )
                              : Image.asset(
                            "assets/python_icon.png",
                            height: size,
                            width: size,
                          ),
                        ),
                      ),
                    ],
                  ),
                ],
              ),
            ),
            if(count ==6 )
              TextButton(
                onPressed: (){
                  savelevel();
                  Navigator.push(
                    context,
                    MaterialPageRoute(builder: (context) => HomePage()),
                  );
                },
                child: Container(
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(15.0),
                    border: Border.all(color: Colors.black),
                    color: Colors.blue,
                  ),
                  padding: EdgeInsets.all(5),
                  height: 50,
                  width: MediaQuery.of(context).size.width * 0.5,
                  child: Center(
                    child: Text(
                      "المرحلة التالية",
                      style: TextStyle(
                          color: Colors.white,
                          fontWeight: FontWeight.bold,
                          fontSize: 18),
                    ),
                  ),
                ),
              ),
          ],
        ),
      ),
    );
  }

  void checkResult() {
    if (showedcard == 2) {
      if (checkCard[1] == checkCard[2]) {
        setState(
              () {
                count++;

            allresultcard[choossedCard[1]] = true;
            allresultcard[choossedCard[2]] = true;
            opencard = 0;
            showedcard = 0;
            checkCard = ["", "", ""];
          },
        );
      } else {
        setState(
              () {
            allcard[choossedCard[1]] = false;
            allcard[choossedCard[2]] = false;
            opencard = 0;
            showedcard = 0;
            checkCard = ["", "", ""];
          },
        );
      }
    } else {
      return;
    }
  }


  Future<void> savelevel() async {

    final prefs = await SharedPreferences.getInstance();

    final keyLevel = 'level';
    final keypoints = 'points';
    int  valueLevel;
    if(level==3)   valueLevel = 4 ;
    else           valueLevel = level ;

    final valuePoints = points+10;

    prefs.setInt(keyLevel, valueLevel);
    prefs.setInt(keypoints, valuePoints);

    int result = await DatabaseHelper.instance.updatelevel(valueLevel,valuePoints,id);

  }
}