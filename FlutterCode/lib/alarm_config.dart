import 'package:flutter/material.dart';
import 'drivestyle.dart';

var is_Checked = false;//알람
var is_Checked2 = false;//소리
var is_Checked3 = false;//진동
var wd = '상단';//dropdown

class alarm_config extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return new MaterialApp(
      title: 'Generated App',
      theme: new ThemeData(
          primaryColor: const Color(0xff030F2A),
          accentColor: const Color(0xff030F2A),
          canvasColor: Colors.white),
      home: new alarm_configPage(),
    );
  }
}

class alarm_configPage extends StatefulWidget {
  alarm_configPage({Key? key}) : super(key: key);

  @override
  _alarm_configPage createState() => new _alarm_configPage();
}

class _alarm_configPage extends State<alarm_configPage> {

  @override
  Widget build(BuildContext context) {
    return new Scaffold(
      appBar: new AppBar(
        backgroundColor: Color(0xfff5df4d),
        title: new Text(
          '알람 설정',
          style: new TextStyle(
            color: Color(0xff939597)
          ),
        ),
        leading: IconButton(
          icon: Icon(Icons.arrow_back,color:  Color(0xff939597),),
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
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: <Widget>[
                    new Row(
                        mainAxisAlignment: MainAxisAlignment.start,
                        mainAxisSize: MainAxisSize.max,
                        // crossAxisAlignment: CrossAxisAlignment.start,
                        children: <Widget>[
                          new Text(
                            "알람                      ",
                            style: new TextStyle(
                                fontSize: 20.0,
                                color: Colors.black,
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
                            activeColor: Color(0xfff5df4d),
                            inactiveTrackColor: Color(0xff939597),
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
                                fontSize: 18.0,
                                color: Colors.black,
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
                            activeColor: Color(0xfff5df4d),
                            inactiveTrackColor: Color(0xff939597),)
                        ]),
                    new Row(
                        mainAxisAlignment: MainAxisAlignment.start,
                        mainAxisSize: MainAxisSize.max,
                        crossAxisAlignment: CrossAxisAlignment.center,
                        children: <Widget>[
                          new Text(
                            "    진동                  ",
                            style: new TextStyle(
                                fontSize: 18.0,
                                color: Colors.black,
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
                            activeColor: Color(0xfff5df4d),
                            inactiveTrackColor: Color(0xff939597),)
                        ]),

                    SizedBox(height: 50,),
                    Container(
                        height: 1.0,
                        width: 330,
                        color: Colors.grey.withOpacity(0.3)),
                    SizedBox(height: 20,),

                    new Row(
                        mainAxisAlignment: MainAxisAlignment.start,
                        mainAxisSize: MainAxisSize.max,
                        crossAxisAlignment: CrossAxisAlignment.center,
                        children: <Widget>[
                          new Text(
                            "경고 팝업창위치      ",
                            style: new TextStyle(
                                fontSize: 20.0,
                                color: Colors.black,
                                fontWeight: FontWeight.w200,
                                fontFamily: "Roboto"),
                          ),
                          new DropdownButton<String>(
                            value: wd,
                            onChanged: (val) {
                              setState(() {
                                wd = val!;
                              });
                            },
                            style: new TextStyle(
                                fontSize: 20.0,
                                color: Colors.black,
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
