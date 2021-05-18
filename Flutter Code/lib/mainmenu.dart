import 'package:flutter/material.dart';
import 'drivestyle.dart';

const PrimaryColor = const Color(0xff030F2A);

void main() {
  runApp(MaterialApp(
    title: '차량 스캐너',
    home: Scaffold(
      appBar: AppBar(
        title: Text('차량 스캐너', style: TextStyle(fontSize: 23.0, color: Colors.white),),
        centerTitle: true,
        backgroundColor: PrimaryColor,
      ),
      body: MyApp(),
    ),
  ));
}



class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {

    return Column(
      children: <Widget>[
        makeRow(context, left: '모니터링', right: '차량진단'),
        makeRow(context,left: '대시보드', right: '주행기록'),
        makeRow(context,left: '운전스타일', right: '차량관리'),
        makeRow(context,left: '엔진상태', right: '설정'),
      ],
      mainAxisAlignment: MainAxisAlignment.center,
    );

  }

  Widget makeRow(BuildContext context, {String left, String right}) {
    return Row(
      children: <Widget>[
        Container(
          child: Center(child:
                      RaisedButton(
                      child:Text(left, style: TextStyle(fontSize: 23.0, color: Colors.white),) ,
                      onPressed: (){
                        if(left.compareTo('운전스타일')==0) {
                            Navigator.push(context, MaterialPageRoute(builder: (context)=> drivestyle()));
                        }
                      })
                      ,
          ),
          width: 205,
          height: 150.8, //150.8
          decoration: BoxDecoration(
            color: PrimaryColor,
            border: Border.all(
                color: Colors.grey,
                width: 1.5
            ),
          ),
          margin: EdgeInsets.only(left: 0, right: 0),
        ),
        Container(
          child: Center(child: Text(right, style: TextStyle(fontSize: 23.0, color: Colors.white),),),
          width: 205,
          height: 150.8,
          decoration: BoxDecoration(
              color: PrimaryColor,
              border: Border.all(
                  color: Colors.grey,
                  width: 1.5
              )
          ),
          margin: EdgeInsets.only(left: 0, right: 0),
        ),
      ],
      mainAxisAlignment: MainAxisAlignment.center,
    );
  }
}