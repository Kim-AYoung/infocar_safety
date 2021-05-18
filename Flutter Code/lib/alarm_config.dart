import 'package:flutter/material.dart';

void main() {
  runApp(new MyApp());
}
class MyApp extends StatelessWidget {

  @override
  Widget build(BuildContext context) {
    return new MaterialApp(
      title: 'Generated App',
      theme: new ThemeData(
          primarySwatch: Colors.blue,
          primaryColor: const Color(0xFF2196f3),
          accentColor: const Color(0xFF2196f3),
          canvasColor: const Color(0xff030F2A)
      ),
      home: new MyHomePage(),
    );
  }
}

class MyHomePage extends StatefulWidget {
  MyHomePage({Key key}) : super(key: key);
  @override
  _MyHomePageState createState() => new _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  @override
  Widget build(BuildContext context) {
    return new Scaffold(
      appBar: new AppBar(
        title: new Text('알람 설정'
            ,style: new TextStyle(fontSize:25.0,),),

        leading: IconButton(
          icon: Icon(Icons.arrow_back),
          onPressed: (){
            print('arrow_back is clicked');
          },
        ),
      ),
      body:
      new Container(
        child:
        new Row(
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
                            style: new TextStyle(fontSize:28.0,
                                color: const Color(0xFFFFFFFF),
                                fontWeight: FontWeight.w200,
                                fontFamily: "Roboto"),
                          ),

                          new Switch(onChanged: switchChanged, value:true)
                        ]

                    ),

                    new Row(
                        mainAxisAlignment: MainAxisAlignment.start,
                        mainAxisSize: MainAxisSize.max,
                        crossAxisAlignment: CrossAxisAlignment.center,
                        children: <Widget>[
                          new Text(
                            "    소리                  ",
                            style: new TextStyle(fontSize:25.0,
                                color: const Color(0xFFFFFFFF),
                                fontWeight: FontWeight.w200,
                                fontFamily: "Roboto"),
                          ),

                          new Switch(onChanged: switchChanged, value:true)
                        ]

                    ),

                    new Row(
                        mainAxisAlignment: MainAxisAlignment.start,
                        mainAxisSize: MainAxisSize.max,
                        crossAxisAlignment: CrossAxisAlignment.center,
                        children: <Widget>[
                          new Text(
                            "    진동                  ",
                            style: new TextStyle(fontSize:25.0,
                                color: const Color(0xFFFFFFFF),
                                fontWeight: FontWeight.w200,
                                fontFamily: "Roboto"),
                          ),

                          new Switch(onChanged: switchChanged, value:true)
                        ]

                    ),
                    new Row(
                        mainAxisAlignment: MainAxisAlignment.start,
                        mainAxisSize: MainAxisSize.max,
                        crossAxisAlignment: CrossAxisAlignment.center,
                        children: <Widget>[
                          new Text(
                            " ",
                            style: new TextStyle(fontSize:28.0,
                                color: const Color(0xFFFFFFFF),
                                fontWeight: FontWeight.w200,
                                fontFamily: "Roboto"),
                          ),
                        ]
                    ),
                    new Row(
                        mainAxisAlignment: MainAxisAlignment.start,
                        mainAxisSize: MainAxisSize.max,
                        crossAxisAlignment: CrossAxisAlignment.center,
                        children: <Widget>[
                          new Text(
                            " ",
                            style: new TextStyle(fontSize:28.0,
                                color: const Color(0xFFFFFFFF),
                                fontWeight: FontWeight.w200,
                                fontFamily: "Roboto"),
                          ),
                        ]
                    ),

                    new Row(
                        mainAxisAlignment: MainAxisAlignment.start,
                        mainAxisSize: MainAxisSize.max,
                        crossAxisAlignment: CrossAxisAlignment.center,
                        children: <Widget>[
                          new Text(
                            "경고 팝업창위치      ",
                            style: new TextStyle(fontSize:28.0,
                                color: const Color(0xFFFFFFFF),
                                fontWeight: FontWeight.w200,
                                fontFamily: "Roboto"),
                          ),

                          new DropdownButton<String>(
                            onChanged: popupButtonSelected,
                            value: "상단",
                            style: new TextStyle(fontSize:28.0,
                                color: const Color(0xFFFFFFFF),
                                fontWeight: FontWeight.w300,
                                fontFamily: "Roboto"),
                            items: <DropdownMenuItem<String>>[
                              const DropdownMenuItem<String>(value: "상단",
                                  child: const Text("상단")),
                              const DropdownMenuItem<String>(value: "중앙",
                                  child: const Text("중앙")),
                              const DropdownMenuItem<String>(value: "하단",
                                  child: const Text("하단")),
                            ],
                          )
                        ]

                    )
                  ]

              )
            ]

        ),

        padding: const EdgeInsets.fromLTRB(30.0, 50.0, 30.0, 50.0),
        alignment: Alignment.center,
      ),

    );
  }
  void switchChanged(bool value) {}

  void popupButtonSelected(String value) {}

}