import 'package:flutter/material.dart';
import 'drivestyle.dart';

var is_Checked = false;//알람
var is_Checked2 = false;//소리
var is_Checked3 = false;//진동

class alarm_config extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return new MaterialApp(
      title: 'Generated App',
      theme: new ThemeData(
          primaryColor: const Color(0xff030F2A),
          accentColor: const Color(0xff030F2A),
          canvasColor: const Color(0xff030F2A)),
      home: new alarm_configPage(),
    );
  }
}

class alarm_configPage extends StatefulWidget {
  alarm_configPage({Key key}) : super(key: key);

  @override
  _alarm_configPage createState() => new _alarm_configPage();
}

class _alarm_configPage extends State<alarm_configPage> {
  //static var is_Checked = false;//알람
  //var is_Checked2 = false;//소리
  //var is_Checked3 = false;//진동
  var wd = '상단';//dropdown

  @override
  Widget build(BuildContext context) {
    return new Scaffold(
      appBar: new AppBar(
        title: new Text(
          '알람 설정',
          style: new TextStyle(
            fontSize: 25.0,
          ),
        ),
        leading: IconButton(
          icon: Icon(Icons.arrow_back),
          onPressed: () {
            Navigator.push(
                context, MaterialPageRoute(builder: (context) => drivestyle()));
          },
        ),
      ),
      body: new Container(
        child: new Row(
            mainAxisAlignment: MainAxisAlignment.start,
            mainAxisSize: MainAxisSize.max,
            crossAxisAlignment: CrossAxisAlignment.center,
            children: <Widget>[
              new Column(
                  mainAxisAlignment: MainAxisAlignment.start,
                  mainAxisSize: MainAxisSize.max,
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: <Widget>[
                    new Row(
                        mainAxisAlignment: MainAxisAlignment.start,
                        mainAxisSize: MainAxisSize.max,
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: <Widget>[
                          new Text(
                            "알람                      ",
                            style: new TextStyle(
                                fontSize: 28.0,
                                color: const Color(0xFFFFFFFF),
                                fontWeight: FontWeight.w200,
                                fontFamily: "Roboto"),
                          ),
                          new Switch(
                            value: is_Checked,
                            onChanged: (value) {
                              setState(() {
                                is_Checked = value;
                                if (is_Checked == false) {
                                  is_Checked2 = false;
                                  is_Checked3 = false;
                                }
                              });
                            },
                            activeColor: Colors.blue,
                            inactiveTrackColor: Colors.grey,
                          )
                        ]),
                    new Row(
                        mainAxisAlignment: MainAxisAlignment.start,
                        mainAxisSize: MainAxisSize.max,
                        crossAxisAlignment: CrossAxisAlignment.center,
                        children: <Widget>[
                          new Text(
                            "    소리                  ",
                            style: new TextStyle(
                                fontSize: 25.0,
                                color: const Color(0xFFFFFFFF),
                                fontWeight: FontWeight.w200,
                                fontFamily: "Roboto"),
                          ),
                          new Switch(
                              value: is_Checked2,
                              onChanged: (value) {
                                setState(() {
                                  is_Checked2 = value;
                                  if (is_Checked == false) {
                                    is_Checked2 = false;
                                  }
                                });
                              },
                              activeColor: Colors.blue,
                              inactiveTrackColor: Colors.grey)
                        ]),
                    new Row(
                        mainAxisAlignment: MainAxisAlignment.start,
                        mainAxisSize: MainAxisSize.max,
                        crossAxisAlignment: CrossAxisAlignment.center,
                        children: <Widget>[
                          new Text(
                            "    진동                  ",
                            style: new TextStyle(
                                fontSize: 25.0,
                                color: const Color(0xFFFFFFFF),
                                fontWeight: FontWeight.w200,
                                fontFamily: "Roboto"),
                          ),
                          new Switch(
                              value: is_Checked3,
                              onChanged: (value) {
                                setState(() {
                                  is_Checked3 = value;
                                  if (is_Checked == false) {
                                    is_Checked3 = false;
                                  }
                                });
                              },
                              activeColor: Colors.blue,
                              inactiveTrackColor: Colors.grey)
                        ]),
                    new Row(
                        mainAxisAlignment: MainAxisAlignment.start,
                        mainAxisSize: MainAxisSize.max,
                        crossAxisAlignment: CrossAxisAlignment.center,
                        children: <Widget>[
                          new Text(
                            " ",
                            style: new TextStyle(
                                fontSize: 28.0,
                                color: const Color(0xFFFFFFFF),
                                fontWeight: FontWeight.w200,
                                fontFamily: "Roboto"),
                          ),
                        ]),
                    new Row(
                        mainAxisAlignment: MainAxisAlignment.start,
                        mainAxisSize: MainAxisSize.max,
                        crossAxisAlignment: CrossAxisAlignment.center,
                        children: <Widget>[
                          new Text(
                            " ",
                            style: new TextStyle(
                                fontSize: 28.0,
                                color: const Color(0xFFFFFFFF),
                                fontWeight: FontWeight.w200,
                                fontFamily: "Roboto"),
                          ),
                        ]),
                    new Row(
                        mainAxisAlignment: MainAxisAlignment.start,
                        mainAxisSize: MainAxisSize.max,
                        crossAxisAlignment: CrossAxisAlignment.center,
                        children: <Widget>[
                          new Text(
                            "경고 팝업창위치      ",
                            style: new TextStyle(
                                fontSize: 28.0,
                                color: const Color(0xFFFFFFFF),
                                fontWeight: FontWeight.w200,
                                fontFamily: "Roboto"),
                          ),
                          new DropdownButton<String>(
                            value: wd,
                            onChanged: (val) {
                              setState(() {
                                wd = val;
                              });
                            },
                            style: new TextStyle(
                                fontSize: 28.0,
                                color: const Color(0xFFFFFFFF),
                                fontWeight: FontWeight.w300,
                                fontFamily: "Roboto"),
                            items: [
                              DropdownMenuItem(
                                child: Text('상단'),
                                value: '상단',
                              ),
                              DropdownMenuItem(
                                child: Text('중앙'),
                                value: '중앙',
                              ),
                              DropdownMenuItem(
                                child: Text('하단'),
                                value: '하단',
                              ),
                            ],
                          )
                        ])
                  ])
            ]),
        padding: const EdgeInsets.fromLTRB(30.0, 50.0, 30.0, 50.0),
        alignment: Alignment.center,
      ),
    );
  }
}
