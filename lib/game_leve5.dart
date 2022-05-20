import 'package:flutter/material.dart';
import 'package:shared_preferences/shared_preferences.dart';

import 'db_helper.dart';
import 'home_page.dart';

class GameLeve5 extends StatefulWidget {
  const GameLeve5({Key key}) : super(key: key);

  @override
  _GameLeve5State createState() => _GameLeve5State();
}

class _GameLeve5State extends State<GameLeve5> {
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

  int  level,points,id;
  int count=0;
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
                                    MediaQuery.of(context).size.height * 0.4,
                                    color: Color(0x81ffba81),
                                    child: Column(
                                      crossAxisAlignment: CrossAxisAlignment.center,
                                      children: [

                                        Text(
                                          " في البرمجة ، نسأل غالبًا أسئلة بنعم أو لا ، ونقرر القيام بشيء بناءً على الإجابة. على سبيل المثال ، قد نسأل ، ‘هل عمرك أكبر من 20 عامًا؟’ وإذا كان الجواب نعم ، أجب بـ ‘أنت كبير في السن!’ تسمى هذه الأنواع من الأسئلة الشروط",
                                          textDirection: TextDirection.rtl,
                                          style: TextStyle(
                                              color: Color(0xbf020202),
                                              fontSize: 18),
                                        ),
                                        Container(
                                          height: 5,
                                        ),
                                        Text(
                                          'ونحن نجمع هذه الشروط والإجابات في عبارات if. يمكن أن تكون الشروط أكثر تعقيدًا من سؤال واحد ',
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
                          child: allcard[1]
                              ? Container(
                            width: size,
                            height: size,
                            child: Column(
                              mainAxisAlignment: MainAxisAlignment.center,
                              children: [
                                Text(
                                  "   If \n statements",
                                  style: TextStyle(
                                    fontSize: 20,
                                    color: Color(0xff00709c),
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
                                    MediaQuery.of(context).size.height * 0.5,
                                    color: Color(0x9a37f6ba) ,
                                    child:  Column(
                                      crossAxisAlignment: CrossAxisAlignment.center,
                                      children: [

                                        Text(
                                          "يحتوي كل سطر في كتلة التعليمات البرمجية على أربع مسافات في البداية, ",
                                          textDirection: TextDirection.rtl,
                                          style: TextStyle(
                                              color: Color(0xbf020202),
                                              fontSize: 18),
                                        ),
                                        Container(
                                          height: 5,
                                        ),
                                        Text(
                                          'يتم تجميع الكود الموجود في نفس الموضع (المسافة البادئة بنفس عدد المسافات من الهامش الأيسر) في كتلة ، وعندما تبدأ سطرًا جديدًا به مسافات أكبر من السطر السابق ، فإنك تبدأ كتلة جديدة ',
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
                          child: allcard[2]
                              ? Container(
                            width: size,
                            height: size,
                            child: Column(
                              mainAxisAlignment: MainAxisAlignment.center,
                              children: [
                                Text(
                                  "blocks and conditions",
                                  style: TextStyle(
                                    fontSize: 20,
                                    color: Color(0xff00709c),
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
                                    MediaQuery.of(context).size.height * 0.5,
                                    color: Color(0x9af5d76b),
                                    child: Column(
                                      crossAxisAlignment: CrossAxisAlignment.center,
                                      children: [

                                        Text(
                                          " نستخدم الرموز في Python (تسمى  operators) لإنشاء شروطنا",
                                          textDirection: TextDirection.rtl,
                                          style: TextStyle(
                                              color: Color(0xbf020202),
                                              fontSize: 18),
                                        ),
                                        Container(
                                          height: 5,
                                        ),
                                         Image.asset(
                                            "assets/operation.PNG",
                                           height: size,
                                           width: size,
                                               ),
                                        Container(
                                          height: 5,
                                        ),
                                        Text(
                                          ' >>> age = 10'+
                                          '  >>> if age > 10:'+
                                       " print('You are too old for my jokes!') ",
                                          textDirection: TextDirection.ltr,
                                          style: TextStyle(
                                              color: Color(0xbf020202),
                                              fontSize: 18),
                                        ),
                                        Container(
                                          height: 5,
                                        ),
                                        Text(
                                          " نظرًا لأن القيمة التي يتم إرجاعها حسب العمر ليست أكبر من 10 ، فإن Python لا تنفذ (تشغل) كتلة الطباعة. ومع ذلك ، إذا قمنا بتعيين العمر المتغير على 20 ، فستتم طباعة الرسالة.",
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
                          child: allcard[3]
                              ? Container(
                            width: size,
                            height: size,
                            child: Column(
                              mainAxisAlignment: MainAxisAlignment.center,
                              children: [
                                Text(
                                  "Symbols for Conditions",
                                  style: TextStyle(
                                    fontSize: 20,
                                    color: Color(0xff00709c),
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
                                    MediaQuery.of(context).size.height * 0.4,
                                    color: Color(0x9a8888ba),
                                    child:  Column(
                                      crossAxisAlignment: CrossAxisAlignment.center,
                                      children: [

                                        Text(

                               "     يمكننا تمديد تعليمة if إلى أبعد من ذلك باستخدام elif (وهي اختصار لـ else-if)."+
                                "      على سبيل المثال ، يمكننا التحقق مما إذا كان عمر الشخص هو 10 أو 11 أو 12 (وما إلى ذلك)"+
                               "   وجعل برنامجنا يفعل شيئًا مختلفًا بناءً على الإجابة. تختلف هذه العبارات عن عبارات if-then-else"+
                              "  في أنه يمكن أن يكون هناك أكثر من elif في نفس العبارة"

                                  ,
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
                          child: allcard[10]
                              ? Container(
                            width: size,
                            height: size,
                            child: Column(
                              mainAxisAlignment: MainAxisAlignment.center,
                              children: [
                                Text(
                                  "if and elif",
                                  style: TextStyle(
                                    fontSize: 25,
                                    color: Color(0xff00709c),
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
                                    MediaQuery.of(context).size.height * 0.5,
                                    color: Color(0x9af5d76b),
                                    child: Column(
                                      crossAxisAlignment: CrossAxisAlignment.center,
                                      children: [
                                        Text(
                                          ' >>> age = 10'+
                                              '  >>> if age >= 10:'+
                                              " print('You are too old for my jokes!') ",
                                          textDirection: TextDirection.ltr,
                                          style: TextStyle(
                                              color: Color(0xbf020202),
                                              fontSize: 18),
                                        ),
                                        Container(
                                          height: 5,
                                        ),
                                        Text(
                                          'يجب أن ترى "أنت كبير في السن بالنسبة لنكاتي!" مطبوع على الشاشة لأن قيمة العمر تساوي 10',
                                          textDirection: TextDirection.rtl,
                                          style: TextStyle(
                                              color: Color(0xbf020202),
                                              fontSize: 18),
                                        ),
                                        Container(
                                          height: 5,
                                        ),
                                        Text(
                                          ' >>> age = 10'+
                                              '  >>> if age == 10:'+
                                              " print('What\'s brown and sticky? A stick!!') ",
                                          textDirection: TextDirection.ltr,
                                          style: TextStyle(
                                              color: Color(0xbf020202),
                                              fontSize: 18),
                                        ),

                                        Container(
                                          height: 5,
                                        ),
                                        Text(
                                          " بعد ذلك ، دعنا نحاول استخدام شرط يساوي (==):",
                                          textDirection: TextDirection.rtl,
                                          style: TextStyle(
                                              color: Color(0xbf020202),
                                              fontSize: 18),
                                        ),
                                        Container(
                                          height: 5,
                                        ),
                                        Text(
                                          'يجب أن ترى الرسالة "What’s brown and sticky? A stick!!؟' ,
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
                          child: allcard[4]
                              ? Container(
                            width: size,
                            height: size,
                            child: Column(
                              mainAxisAlignment: MainAxisAlignment.center,
                              children: [
                                Text(
                                  "Symbols for Conditions",
                                  style: TextStyle(
                                    fontSize: 20,
                                    color: Color(0xff00709c),
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
                                          " تتكون عبارة if من الكلمة الأساسية if ، متبوعة بشرط ونقطتين (:) ، كما في if age> 20",
                                           textDirection: TextDirection.rtl,
                                          style: TextStyle(
                                              color: Color(0xbf020202),
                                              fontSize: 18),
                                        ),
                                        Container(
                                          height: 5,
                                        ),
                                        Text(
                                          ' يجب أن تكون الأسطر التي تلي النقطتين في كتلة ، وإذا كانت الإجابة على السؤال بنعم (أو صحيحة ، كما نقول في برمجة بايثون) ، فسيتم تشغيل الأوامر الموجودة في الكتلة ',
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
                                    "    If \n statements",
                                    style: TextStyle(
                                      fontSize: 20,
                                      color: Color(0xff00709c),
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
                                    MediaQuery.of(context).size.height * 0.9,
                                    color: Color(0x9a8888ba),
                                    child: Column(
                                      crossAxisAlignment: CrossAxisAlignment.center,
                                      children: [

                                        Text(
                                          "  age = 12\n"+
                                          "  elif age == 11:\n"+
                                          '  print("What did the green grape say to the blue grape?")\n'+
                                          '  print("Breathe! Breathe!")\n'+
                                          "  elif age == 12:\n"+
                                          '  print("What did 0 say to 8?")\n'+
                                          '  print("Hi guys!")\n'+
                                          "  elif age == 13:\n"+
                                          '  print("Why wasn\'t 10 afraid of 7?")\n'+
                                          '  print("Because rather than eating 9, 7 8 pi.")\n'+
                                          "  else:\n"+
                                          '  print("Huh?")\n'+
                                          "  What did 0 say to 8? Hi guys!\n"


                                          ' بالإضافة إلى استخدام عبارات if لفعل شيء ما عند استيفاء شرط ما (صواب) ، '+
                                              'يمكننا أيضًا استخدام عبارات if لفعل شيء ما عندما يكون الشرط غير صحيح. '+
                                              'على سبيل المثال ، قد نطبع رسالة واحدة على الشاشة إذا كان عمرك 12 عامًا وأخرى إذا لم يكن 12 (خطأ). '+
                                              ' الحيلة هنا هي استخدام عبارة if-then-else ، والتي تقول أساسًا "إذا كان شيء ما صحيحًا ، فافعل هذا ؛ وإلا ، افعل ذلك   ".'

                                          ,
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
                                  "if and elif",
                                  style: TextStyle(
                                      fontSize: 25, color: Color(0xff00709c)),
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
                                    MediaQuery.of(context).size.height * 0.8,
                                    color: Color(0x9abbbbb4),
                                    child:  Column(
                                      crossAxisAlignment: CrossAxisAlignment.center,
                                      children: [

                                        Text(

                               " يمكنك دمج الشروط باستخدام الكلمات الأساسية and / or ، والتي تنتج تعليمات برمجية أقصر وأبسط."+
                               " فيما يلي مثال على استخدام أو:"
                                          ,
                                          textDirection: TextDirection.rtl,
                                          style: TextStyle(
                                              color: Color(0xbf020202),
                                              fontSize: 18),
                                        ),

                                        Text(
                              " if age == 10 or age == 11 or age == 12 or age == 13:\n"+
                              " print('What is 13 + 49 + 84 + 155 + 97? A headache!')\n"+
                              " else:\n"+
                              " print('Huh?')\n"
                                          ,
                                          textDirection: TextDirection.ltr,
                                          style: TextStyle(
                                              color: Color(0xbf020202),
                                              fontSize: 18),
                                        ),
                                        Text(
                                        "إذا كان أي من الشروط في السطر الأول صحيحًا (بمعنى آخر ، إذا كان العمر 10 أو 11 أو 12 أو 13) ،"+
                                        "فسيتم تشغيل كتلة التعليمات البرمجية في السطر التالي الذي يبدأ بالطباعة."+
                                      "إذا كانت الشروط في السطر الأول غير صحيحة (وإلا) ، تنتقل بايثون إلى الكتلة في السطر الأخير ،"

                                  ,
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
                          child: allcard[11]
                              ? Container(
                            width: size,
                            height: size,
                            child: Column(
                              mainAxisAlignment: MainAxisAlignment.center,
                              children: [
                                Text(
                                  "Combining Conditions",
                                  style: TextStyle(
                                    fontSize: 20,
                                    color: Color(0xff00709c),
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
                                    MediaQuery.of(context).size.height * 0.4,
                                    color: Color(0x9abaf824),
                                    child: Column(
                                      crossAxisAlignment: CrossAxisAlignment.center,
                                      children: [

                                        Text(

                                          ' بالإضافة إلى استخدام عبارات if لفعل شيء ما عند استيفاء شرط ما (صواب) ، '+
                                              'يمكننا أيضًا استخدام عبارات if لفعل شيء ما عندما يكون الشرط غير صحيح. '+
                                              'على سبيل المثال ، قد نطبع رسالة واحدة على الشاشة إذا كان عمرك 12 عامًا وأخرى إذا لم يكن 12 (خطأ). '+
                                              ' الحيلة هنا هي استخدام عبارة if-then-else ، والتي تقول أساسًا "إذا كان شيء ما صحيحًا ، فافعل هذا ؛ وإلا ، افعل ذلك   ".'

,
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
                          child: allcard[7]
                              ? Container(
                            width: size,
                            height: size,
                            child: Column(
                              mainAxisAlignment: MainAxisAlignment.center,
                              children: [
                                Text(
                                  "If-then-else",
                                  style: TextStyle(
                                    fontSize: 25,
                                    color: Color(0xff00709c),
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
                                    MediaQuery.of(context).size.height * 0.6,
                                    color: Color(0x9abbbbb4),
                                    child:  Column(
                                      crossAxisAlignment: CrossAxisAlignment.center,
                                      children: [

                                        Text(

                                   "  if age >= 10 and age <= 13:\n"+
                                   "  print('What is 13 + 49 + 84 + 155 + 97? A headache!')\n"+
                                   "  else:\n"
                                   "  print('Huh?')\n"
                                          ,
                                          textDirection: TextDirection.ltr,
                                          style: TextStyle(
                                              color: Color(0xbf020202),
                                              fontSize: 18),
                                        ),
                                        Text(

                                     " هنا ، إذا كان العمر أكبر من أو يساوي 10 وأقل من أو يساوي 13 ، كما هو محدد في السطر الأول"+
                                     " فإن كتلة الكود التي تبدأ بالطباعة في السطر التالي"+
                                     " . على سبيل المثال ، إذا كانت قيمة العمر 12 ،"+
                                     "  'What is 13 + 49 + 84 + 155 + 97? A headache!'"+
                                     " ستتم طباعته على الشاشة ، لأن الرقم 12 أكبر من 10 وأقل من 13"

                                        ,
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
                          child: allcard[8]
                              ? Container(
                            width: size,
                            height: size,
                            child: Column(
                              mainAxisAlignment: MainAxisAlignment.center,
                              children: [
                                Text(
                                  "Combining Conditions",
                                  style: TextStyle(
                                    fontSize: 20,
                                    color: Color(0xff00709c),
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
                                    MediaQuery.of(context).size.height * 0.6,
                                    color:Color(0x9a37f6ba) ,
                                    child: Column(
                                      crossAxisAlignment: CrossAxisAlignment.center,
                                      children: [
                                        Image.asset(
                                          "assets/Codebloce.PNG",
                                          height: size,
                                          width: size,
                                        ),
                                        Text(
                                          "نقوم بتجميع البيانات معًا في كتل لأنها مرتبطة. البيانات تحتاج إلى أن تدار معا. عندما تقوم بتغيير المسافة البادئة ، فإنك تنشئ بشكل عام كتلًا جديدة. يوضح المثال التالي ثلاث كتل منفصلة تم إنشاؤها فقط عن طريق تغيير المسافة البادئة ",
                                          textDirection: TextDirection.rtl,
                                          style: TextStyle(
                                              color: Color(0xbf020202),
                                              fontSize: 18),
                                        ),
                                        Container(
                                          height: 5,
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
                                  "blocks and conditions",
                                  style: TextStyle(
                                    fontSize: 20,
                                    color: Color(0xff00709c),
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
                                    child:  Column(
                                      crossAxisAlignment: CrossAxisAlignment.center,
                                      children: [

                                        Text(

                                  "  >>> age = 8"+
                                   " >>> if age == 12:"+
                                  "  print('A pig fell in the mud!')"+
                                   "   else:" +
                                   '   print("Shh. It\'s a secret.") '+
                                 " Shh. It's a secret. "
                                          ,

                                          textDirection: TextDirection.rtl,
                                          style: TextStyle(
                                              color: Color(0xbf020202),
                                              fontSize: 18),
                                        ),
                                        Container(
                                          height: 5,
                                        ),
                                        Text(

"نظرًا لأننا قمنا بتعيين متغير العمر على 8 ، والشرط يسأل عما إذا كان العمر يساوي 12 ، يجب أن ترى ثاني رسالة مطبوعة على الشاشة."
,
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
                                  "If-then-else",
                                  style: TextStyle(
                                    fontSize: 25,
                                    color: Color(0xff00709c),
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
    if(level==5)   valueLevel = 5 ;
    else           valueLevel = level ;

    final valuePoints = points+10;

    prefs.setInt(keyLevel, valueLevel);
    prefs.setInt(keypoints, valuePoints);

    int result = await DatabaseHelper.instance.updatelevel(valueLevel,valuePoints, id);

  }

}