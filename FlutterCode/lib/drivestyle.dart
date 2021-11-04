import 'dart:async';
import 'dart:io';

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'alarm_config.dart';
import 'mainmenu.dart';
import 'package:vibration/vibration.dart';
import 'package:audioplayers/audioplayers.dart';
import 'dart:convert';
import 'package:tflite_flutter/tflite_flutter.dart';

const SecondColor = const Color(0xff939597);

class Data {
  final int status;

  Data(this.status);

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
        primaryColor: const Color(0xfff5df4d),
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
  late List list_data;

  @override
  void initState() {
    //딥러닝 모델을 불러오고 테스트하기 위한 초기화
    super.initState();
    loadModel();
  }

  @override
  Widget build(BuildContext context) {
    AudioCache player = AudioCache();

    return new Scaffold(
      appBar: new AppBar(
        title: new Text(
          '운전스타일',
          style: TextStyle(color: SecondColor),
        ),
        centerTitle: true,
        leading: IconButton(
          icon: Icon(
            Icons.arrow_back,
            color: SecondColor,
          ),
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
                      SizedBox(
                        width: 10,
                      ),
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
                    margin: EdgeInsets.all(20),
                    child: Image.asset('images/images2.jpg'))
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
              if (list_data[i][0] as double >= 0.5) {
                countone++;
                if ((i != list_data.length - 1 &&
                        list_data[i + 1][0] as double < 0.5) ||
                    i == list_data.length - 1) {
                  result.add(countone);
                  countone = 0;
                }
              } else {
                result.add(0); //0 추가
              }
            }

            var index = 0;
            print(result);
            Timer.periodic(Duration(seconds: 2), (timer) {
              if (index == result.length - 1) {
                timer.cancel();
              }
              int item = result[index++];
              if (item == 0) {
                print("0");
              } else {
                print(item);
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

  loadModel() async {
    final _interpreter = await Interpreter.fromAsset('dnn_model.tflite');
    print('Interpreter loaded successfully');
    // 1 1 1 0 0 0 0 0 0 0
    List<List<double>> input = [
      [
        2.11592874,
        0.6548619,
        -1.18250966,
        -1.36236478,
        -1.22588138,
        1.2270723,
        -0.56461702
      ],
      [
        -0.77719142,
        0.45228567,
        0.88334377,
        0.39206122,
        0.99439822,
        0.02162039,
        0.78304824
      ],
      [
        -1.16123392,
        -0.73333494,
        -0.04166523,
        -0.08028432,
        -0.2179017,
        -0.17518809,
        -0.083308
      ],
      [
        0.22131908,
        0.34707165,
        1.00667835,
        0.59449497,
        1.4439028,
        0.3168331,
        0.97557185
      ],
      [
        -1.16123392,
        -0.72626833,
        -0.01083166,
        -0.2489791,
        0.24522405,
        -0.51960293,
        -0.37209341
      ],
      [
        1.57826924,
        0.3564938,
        -1.18250966,
        -1.36236478,
        1.0488837,
        2.16191257,
        0.97557185
      ],
      [
        -1.16123392,
        -0.73254976,
        -0.01083166,
        -0.14776218,
        -0.13617359,
        -0.79021458,
        2.2269753
      ],
      [
        -1.16123392,
        -0.70663885,
        -0.04166523,
        -0.14776218,
        -0.49032867,
        -0.49500187,
        1.36061906
      ],
      [
        2.09032591,
        0.67135067,
        -1.18250966,
        -1.36236478,
        -1.22588138,
        1.17787018,
        -0.46835521
      ],
      [
        -0.85399992,
        0.05105909,
        0.72917563,
        0.25710541,
        0.79007795,
        -0.15058703,
        -0.85340243
      ],
    ]; // car driving data
    var output = List<double>.filled(input.length, 0)
        .reshape([input.length, 1]); // model output

    _interpreter.run(input, output);

    print("load model successfully");
    list_data = output;
  }
}
