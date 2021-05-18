import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'alarm_config.dart';


class drivestyle extends StatelessWidget {

  @override
  Widget build(BuildContext context) {
    return new MaterialApp(
      title: 'Generated App',
      theme: new ThemeData(
        primaryColor: const Color(0xff030F2A),
        accentColor: const Color(0xff030F2A),
        canvasColor: const Color(0xff030F2A),
      ),
      home: new drivestylePage(),
    );
  }
}

class drivestylePage extends StatefulWidget {
  drivestylePage({Key key}) : super(key: key);
  @override
  _drivestylePage createState() => new _drivestylePage();
}

class _drivestylePage extends State<drivestylePage> {
  @override
  Widget build(BuildContext context) {
    return new Scaffold(
      appBar: new AppBar(
        title: new Text('운전스타일'),
        centerTitle: true,
      ),
      body:
      new Container(
        child:
        new Column(
            mainAxisAlignment: MainAxisAlignment.spaceAround,
            mainAxisSize: MainAxisSize.max,
            crossAxisAlignment: CrossAxisAlignment.stretch,
            children: <Widget>[
              new SizedBox(
                  height: 250,
                  child: Image.asset('images/image1.jpg')),

              new SizedBox(
                  height: 95,
                  child: Image.asset('images/image2.jpg')),

              new Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  mainAxisSize: MainAxisSize.max,
                  crossAxisAlignment: CrossAxisAlignment.center,
                  children: <Widget>[
                    new Container(
                      margin: EdgeInsets.all(5),
                      child: new Text(
                        "통계그래프",
                        style: new TextStyle(fontSize:12.0,
                            color: const Color(0xFFFFFFFF),
                            fontWeight: FontWeight.w200,
                            fontFamily: "Roboto"),
                      )
                    ),

                    new Container(
                        margin: EdgeInsets.all(5),
                        child:  new Text(
                          "경고위치",
                          style: new TextStyle(fontSize:12.0,
                              color: const Color(0xFFFFFFFF),
                              fontWeight: FontWeight.w200,
                              fontFamily: "Roboto"),
                        ),
                    ),

                    new FlatButton(key:null, onPressed:(){
                        Navigator.push(context, MaterialPageRoute(builder: (context)=> alarm_config()));
                    },
                        child:
                        new Text(
                          "알림설정",
                          style: new TextStyle(fontSize:12.0,
                              color: const Color(0xFFFFFFFF),
                              fontWeight: FontWeight.w200,
                              fontFamily: "Roboto"),
                        )
                    )
                  ]

              ),

              new SizedBox(
                  height: 245,
                  child: Image.asset('images/image3.jpg'))
            ]
        ),
        padding: const EdgeInsets.all(0.0),
        alignment: Alignment.center,
      ),

    );
  }

}
