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
                    margin: EdgeInsets.all(0),
                    child: Image.asset('images/images2.jpg'))
              ]),
          padding: const EdgeInsets.all(0.0),
          alignment: Alignment.center,
        ),
        onTap: () async {

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
          List<int> pre = []; // 예측 데이터
          List<int> origin = [0, 0, 0, 0, 0, 0, 1, 1, 1, 1]; // 실제 데이터
          int correctNum = 0; // 정확도 계산
          if (is_Check == true) {
            await loadModel();
            for (int i = 0; i < list_data.length; i++) {
              if (list_data[i][0] as double >= 0.5) {
                pre.add(1);
                if(origin[i] == 1)  {
                  correctNum++;
                }
                countone++;
                if ((i != list_data.length - 1 &&
                        list_data[i + 1][0] as double < 0.5) ||
                    i == list_data.length - 1) {
                  result.add(countone);
                  countone = 0;
                }
              } else {
                pre.add(0);
                if(origin[i] == 0)  {
                  correctNum++;
                }
                result.add(0); //0 추가
              }
            }
            var index = 0;

            Timer.periodic(Duration(seconds: 2), (timer) {
              int item = result[index++];
              if(item == 0) {
                print("예측 : 0");
              }else {
                for(int i=0; i<item; i++) {
                  print("예측 : 1");
                }
              }
              if (index == result.length - 1) {
                print("실제 : " + origin.toString());
                print("예측 : " + pre.toString());

                print("정확도 : " + (correctNum/list_data.length).toString());
                timer.cancel();
              }
              if (item == 0) {
              } else {
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
    // 실제 : 0 0 0 0 0 0 1 1 1 1
    // 예측 : 0 0 0 0 1 1 1 1 1 0
    List<List<double>> input =
      [
        [-1.15469051, -0.77568679, -0.00449308, -0.13952803,  0.10281798, -0.61454235,  0.67544961],
        [-0.41512806,  0.02832641,  0.88779616,  0.32916729,  1.26018867, -0.05237577,  0.77214109],
        [-0.03259576,  1.01855045, -1.17369949, -1.34474458,  1.39634996,  3.93167437,  0.96552404],
        [-0.56814098, -0.14831286, -0.0352616,  -0.00561503, -0.60522052, -0.5656583,   0.77214109],
        [ 0.27343009,  0.16406889, -1.17369949, -1.34474458, -0.83669463,  1.29193563, -0.67823108],
        [ 0.85997961, -0.04302541, -1.17369949, -1.34474458, -1.21794612,  1.24305158, -0.38815665],
        [ 2.59412605,  2.39424836,  3.41082076,  3.3422088,   2.10438823,  0.80309512, -1.16168847],
        [ 0.80897531,  1.26197328,  2.61083726,  2.10351417,  1.88653043,  0.8764212,  -1.06499699],
        [ 0.78347315,  0.49907439, -0.00449308, -0.00561503, -0.4554431,  -1.03005678, -0.29146517],
        [-1.15469051, -0.65038603, -0.0352616,  -0.03909328, -0.11503999,  0.02095031,  1.64236439],
      ]; // car driving data
    var output = List<double>.filled(input.length, 0)
        .reshape([input.length, 1]); // model output

    _interpreter.run(input, output);

    print("load model successfully");
    list_data = output;
  }
}
