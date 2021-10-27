import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'drivestyle.dart';

const SecondColor = const Color(0xff939597);

void main() {
  runApp(mainmenu());
}

class mainmenu extends StatelessWidget {
  Widget build(BuildContext context) {
    return new MaterialApp(
      title: '차량 스캐너',
      theme: new ThemeData(
          primaryColor: const Color(0xfff5df4d), canvasColor: Colors.white),
      home: new mainmenuPage(),
    );
  }
}

class mainmenuPage extends StatefulWidget {
  mainmenuPage({Key? key}) : super(key: key);

  @override
  _mainmenuPage createState() => new _mainmenuPage();
}

class _mainmenuPage extends State<mainmenuPage> {
  @override
  Widget build(BuildContext context) {
    return new Scaffold(
      appBar: AppBar(
        title: Text(
          '차량 주행 정보 앱',
          style: TextStyle(color: SecondColor),
        ),
        centerTitle: true,
      ),
      body: Column(
        children: <Widget>[
          makeRow(context, left: '모니터링', right: '차량진단'),
          makeRow(context, left: '대시보드', right: '주행기록'),
          makeRow(context, left: '운전스타일', right: '차량관리'),
          makeRow(context, left: '엔진상태', right: '설정'),
        ],
        mainAxisAlignment: MainAxisAlignment.center,
      ),
    );
  }

  Widget makeRow(BuildContext context,
      {required String left, required String right}) {
    return Row(
      children: <Widget>[
        Container(
          child: Card(
            elevation: 3,
            shape: CircleBorder(side: BorderSide(width: 1, color: SecondColor)),
            margin: EdgeInsets.all(10),
            child: CupertinoButton(
              child: Text(
                left,
                style: TextStyle(fontSize: 18.0, color: Colors.black),
              ),
              onPressed: () {
                if (left.compareTo('운전스타일') == 0) {
                  Navigator.push(context,
                      MaterialPageRoute(builder: (context) => drivestyle()));
                }
              },
            ),
          ),
          width: 205,
          height: 150.8,
          margin: EdgeInsets.only(left: 0, right: 0),
        ),
        Container(
          child: Card(
            elevation: 3,
            shape: CircleBorder(side: BorderSide(width: 1, color: SecondColor)),
            margin: EdgeInsets.all(10),
            child: CupertinoButton(
              child: Text(
                right,
                style: TextStyle(fontSize: 18.0, color: Colors.black),
              ),
              onPressed: () {},
            ),
          ),
          width: 205,
          height: 150.8,
          margin: EdgeInsets.only(left: 0, right: 0),
        ),
      ],
      mainAxisAlignment: MainAxisAlignment.center,
    );
  }
}
