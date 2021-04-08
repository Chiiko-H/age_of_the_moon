import 'package:flutter/material.dart';
import 'package:intl/intl.dart';

class NextPage extends StatefulWidget {
  @override
  State<StatefulWidget> createState() {
    return _ThirdRouted();
  }
}
class _ThirdRouted extends State<NextPage> {
  DateTime _now;
  int _moonAge;
  String _nowFormatt;

  @override
  void initState() {
    super.initState();
    _now = DateTime.now();
    _moonAge = _calcMoonAge(this._now.year, this._now.month, this._now.day);
    _nowFormatt = new DateFormat('yMMMd').format(_now).toString();
  }
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: Container(
          alignment: Alignment.center,
          decoration: new BoxDecoration(
            image: new DecorationImage(
              image: new AssetImage("assets/images/star_bg.png"),
              fit: BoxFit.cover,
            )
          ),
          child: Column(
            children: <Widget>[
              Padding(padding: EdgeInsets.fromLTRB(0,200,0,0),),
              Container(
                height: 120.0,
                child: Text("Today's Moon Age\n\n$_moonAge",
                    style: TextStyle(
                        fontSize: 30,
                        color: Colors.white,
                    ),
                  textAlign: TextAlign.center,
                ),
              ),
              Container(
                child: Image.asset('assets/images/age$_moonAge.png'),
                height: 150,
              ),
              Container(
                child: Text("$_nowFormatt",
                  style: TextStyle(
                    fontSize: 30,
                    color: Colors.white,),
                ),
              ),
            ],
          ),
        )
      ),
    );
  }
}

int _calcMoonAge(yyyy,mm,dd){
  int age = (((yyyy-2009)%19)*11+mm+dd)%30;
  return age;
}


