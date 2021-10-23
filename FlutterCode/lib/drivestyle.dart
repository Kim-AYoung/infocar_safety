import 'dart:async';
import 'dart:io';

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'alarm_config.dart';
import 'mainmenu.dart';
import 'package:vibration/vibration.dart';
import 'package:audioplayers/audioplayers.dart';
import 'dart:convert';

class Data {
  final int status;

  Data(this.status);

  //static Data fromJson(Map<String, String> map) {}

  @override
  String toString() {
    // TODO: implement toString
    return "status: " + status.toString();
  }
}

class drivestyle extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return new MaterialApp(
      title: 'Generated App',
      theme: new ThemeData(
        primaryColor: const Color(0xff030F2A),
        accentColor: const Color(0xff030F2A),
        canvasColor: Colors.white,
      ),
      home: new drivestylePage(),
    );
  }
}

class drivestylePage extends StatefulWidget {
  drivestylePage({Key? key}) : super(key: key);

  @override
  _drivestylePage createState() => new _drivestylePage();
}

class _drivestylePage extends State<drivestylePage> {
  var is_Check = is_Checked;
  var sound = is_Checked2;
  var vibration = is_Checked3;
  var isPressed = false;
  var position = wd;
  late List<Data> list_data;

  @override
  void initState() {
    //json을 받아오기 위한 초기화
    super.initState();
    list_data = [];

    readData();
  }

  @override
  Widget build(BuildContext context) {

    AudioCache player = AudioCache();


    return new Scaffold(
      appBar: new AppBar(
        backgroundColor: Color(0xfff5df4d),
        title: new Text('운전스타일',style: TextStyle(color: Color(0xff939597)),),
        centerTitle: true,
        leading: IconButton(
          icon: Icon(Icons.arrow_back,color: Color(0xff939597),),
          onPressed: () {
            Navigator.push(
                context, MaterialPageRoute(builder: (context) => mainmenu()));
          },
        ),
      ),
      body: new GestureDetector(
        child: new Container(
          child: new Column(
              mainAxisAlignment: MainAxisAlignment.spaceAround,
              mainAxisSize: MainAxisSize.max,
              crossAxisAlignment: CrossAxisAlignment.stretch,
              children: <Widget>[
                new Card(
                    margin: EdgeInsets.all(20),
                    child: Image.asset('images/images1.jpg')),

                new Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    mainAxisSize: MainAxisSize.max,
                    crossAxisAlignment: CrossAxisAlignment.center,
                    children: <Widget>[

                      SizedBox(width: 10,),
                      new CupertinoButton(
                        color: Color(0xfff5df4d),
                          onPressed: () {
                            Navigator.push(
                                context,
                                MaterialPageRoute(
                                    builder: (context) => alarm_config()));
                          },
                          child: new Text(
                            "알림설정",
                            style: new TextStyle(
                                fontSize: 12.0,
                                color: Colors.black,
                                fontWeight: FontWeight.w200,
                                fontFamily: "Roboto"),
                          )),
                    ]),
                new Card(
                    margin: EdgeInsets.all(20),child: Image.asset('images/images2.jpg'))
              ]),
          padding: const EdgeInsets.all(0.0),
          alignment: Alignment.center,
        ),
        onTap: () {
          var padding = const EdgeInsets.only(top: 100.0);
          if (position.compareTo('상단') == 0) {
            padding = const EdgeInsets.only(top: 100.0);
          } else if (position.compareTo('중앙') == 0) {
            padding = const EdgeInsets.only(top: 270.0);
          } else if (position.compareTo('하단') == 0) {
            padding = const EdgeInsets.only(top: 500.0);
          }
          int countone = 0;
          List<int> result = [];

          if (is_Check == true) {
            for (int i = 0; i < list_data.length; i++) {
              if (list_data[i].status == 1) {
                countone++;
                if ((i != list_data.length - 1 &&
                        list_data[i + 1].status != 1) ||
                    i == list_data.length - 1) {
                  result.add(countone);
                  countone = 0;
                }
              } else {
                result.add(0); //0 추가

              }
            }

            var index = 0;
            Timer.periodic(Duration(seconds: 2), (timer) {
              if (index == result.length) {
                timer.cancel();
              }
              int item = result[index++];
              if (item == 0) {
                print("item == 0");
              } else {
                print(item);
                //print("급감속 주의-----------------------");

                //List<String> caution = ['급가속 주의', '급감속 주의', '급회전 주의'];
                //int random = Random().nextInt(3);

                showDialog(
                    context: context,
                    //barrierDismissible - Dialog를 제외한 다른 화면 터치 x
                    barrierDismissible: false,
                    builder: (BuildContext context) {
                      Future.delayed(Duration(seconds: item), () {
                        Navigator.pop(context);
                      });

                      return SingleChildScrollView(
                          child: Padding(
                              padding: padding,
                              child: AlertDialog(
                                // RoundedRectangleBorder - Dialog 화면 모서리 둥글게 조절
                                shape: RoundedRectangleBorder(
                                    borderRadius: BorderRadius.circular(10.0)),
                                //Dialog Main Title
                                title: Align(
                                  child: Text("🚨 위험 운전 행동 주의 🚨"),
                                  alignment: Alignment.center,
                                ),
                                actions: <Widget>[],
                              )));
                    });
                if (sound == true) {
                  player.play('../audio/alert.wav');
                }
                if (vibration == true) {
                  Vibration.vibrate(duration: 1000, pattern: [200, 500, 800]);
                }
              } //if (item != 0) end
              // if you want to stop this loop use cancel
            });
          } //if is_Check end
        }, //on tap end
      ),
    );
  }

  readData() async {
    await DefaultAssetBundle.of(context)
        .loadString("assets/result.json")
        .then((s) {
      setState(() {
        var response = json.decode(s);
        List<dynamic> list_status = response["status"];

        for (int i = 0; i < list_status.length; i++) {
          list_data.add(Data(list_status[i]));
        }
      });
    }).catchError((error) {
      print(error);
    });
  }
}
