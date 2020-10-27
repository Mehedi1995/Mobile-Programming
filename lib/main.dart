import 'package:flutter/material.dart';
import 'dart:math';

void main() => runApp(MyApp());

class MyApp extends StatefulWidget {
  @override
  _MyAppState createState() => _MyAppState();
}

class _MyAppState extends State<MyApp> {
  final TextEditingController _acontroller = TextEditingController();
  final TextEditingController _bcontroller = TextEditingController();
  //final TextEditingController _controller = new TextEditingController();
  TextEditingController nameController = TextEditingController();
  int _radioValue = 0;
  int _radioValue1 = 0;

  double a = 0.0,
      b = 0.0,
      bmi=0.0,
      bmi1=0.0,
      bmi2=0.0,
      bmi3=0.0,
      bodyfat11 = 0.0,
      bodyfat12 = 0.0,
      bodyfat13 = 0.0,
      bodyfat14 = 0.0,
      result = 0.0,
      result1 = 0.0,
      result2 = 0.0,
      result3 = 0.0,
      result4 = 0.0,
      eECV = 0.0,
      eLBM1 = 0.0,
      eLBM = 0.0;

  String boer, james, hume, peters, bodyfat1,bodyfat2,bodyfat3,bodyfat4;

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Material App',
      home: Scaffold(
        resizeToAvoidBottomPadding: false,
        appBar: AppBar(
          title: Text('Lean Body Mass  Calculator'),
        ),
        body: Column(
          //mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
            new Row(
              //  mainAxisAlignment: MainAxisAlignment.center,
              children: [
                new Text("Gender", style: new TextStyle(color: Colors.black,fontSize: 16.0)),
                new Text("                                        "),
                new Text(
                  'Male',
                  style: new TextStyle(color: Colors.black,fontSize: 16.0),
                ),
                new Radio(
                  value: 1,
                  groupValue: _radioValue,
                  onChanged: _handleRadioValueChange,
                ),
                new Text(
                  'Female',
                  style: new TextStyle(color: Colors.black,
                    fontSize: 16.0,
                  ),
                ),
                new Radio(
                  value: 2,
                  groupValue: _radioValue,
                  onChanged: _handleRadioValueChange,
                ),
              ],
            ),
            new Row(
              // mainAxisAlignment: MainAxisAlignment.center,
              children: [
                new Text("Age 14 or Younger ",
                    style: new TextStyle(color: Colors.black,fontSize: 16.0)),
                new Text("                  "),
                new Text(
                  'Yes',
                  style: new TextStyle(color: Colors.black,fontSize: 18.0),
                ),
                new Radio(
                  value: 1,
                  groupValue: _radioValue1,
                  onChanged: _handleRadioValueChange1,
                ),
                new Text(
                  'No',
                  style: new TextStyle(color: Colors.black,
                    fontSize: 18.0,
                  ),
                ),
                new Radio(
                  value: 2,
                  groupValue: _radioValue1,
                  onChanged: _handleRadioValueChange1,
                ),
              ],
            ),
            Padding(
              padding: EdgeInsets.fromLTRB(50, 0, 50, 0),
              child: TextField(
                decoration: InputDecoration(
                  hintText: "Height(cm)",
                ),
                keyboardType: TextInputType.numberWithOptions(),
                controller: _acontroller,
              ),
            ),
            Padding(
              padding: EdgeInsets.fromLTRB(50, 0, 50, 0),
              child: TextField(
                decoration: InputDecoration(
                  hintText: "Weight(kg)",
                ),
                keyboardType: TextInputType.numberWithOptions(),
                controller: _bcontroller,
              ),
            ),
            Padding(
              padding: EdgeInsets.all(5),
              child: RaisedButton(
                child: Text("Calculate"),
                onPressed: _onPress,
              ),
            ),
            Padding(
              padding: EdgeInsets.all(5),
              child: RaisedButton(
                child: Text("Clear"),
                onPressed: _onPress1,
              ),
            ),
            Text("Result", style: TextStyle(color: Colors.black,fontSize: 20.0)),
            Text("The lean body mass based on different formulas:" , style: TextStyle(color: Colors.black,fontSize: 20.0)),
            
            if (_radioValue1 == 1)
              Center(
                  child: Column(children: <Widget>[
                Container(
                  margin: EdgeInsets.all(20),
                  child: Table(
                    defaultColumnWidth: FixedColumnWidth(120.0),
                    border: TableBorder.all(
                        color: Colors.black,
                        style: BorderStyle.solid,
                        width: 2),
                    children: [
                      TableRow(children: [
                        Column(children: [
                          Text('Formula', style: TextStyle(fontSize: 20.0))
                        ]),
                        Column(children: [
                          Text('Lean Body Mass',
                              style: TextStyle(fontSize: 20.0))
                        ]),
                        Column(children: [
                          Text('Body Fat', style: TextStyle(fontSize: 20.0))
                        ]),
                      ]),
                      TableRow(children: [
                        Column(children: [
                          Text("Peters (for Children)", style: TextStyle(fontSize: 18.0))
                        ]),
                        Column(children: [
                          Text(' $peters Kg', style: TextStyle(fontSize: 18.0))
                        ]),
                        Column(children: [
                          Text('$bodyfat4 %', style: TextStyle(fontSize: 18.0))
                        ]),
                      ]),
                      TableRow(children: [
                        Column(children: [
                          Text("Boer", style: TextStyle(fontSize: 18.0))
                        ]),
                        Column(children: [
                          Text('$boer Kg', style: TextStyle(fontSize: 18.0))
                        ]),
                        Column(children: [
                          Text('$bodyfat1 %', style: TextStyle(fontSize: 18.0))
                        ]),
                      ]),
                      TableRow(children: [
                        Column(children: [
                          Text('James', style: TextStyle(fontSize: 18.0))
                        ]),
                        Column(children: [
                          Text('$james Kg', style: TextStyle(fontSize: 18.0))
                        ]),
                        Column(children: [
                          Text('$bodyfat2 %', style: TextStyle(fontSize: 18.0))
                        ]),
                      ]),
                      TableRow(children: [
                        Column(children: [
                          Text('Hume', style: TextStyle(fontSize: 18.0))
                        ]),
                        Column(children: [
                          Text(' $hume Kg', style: TextStyle(fontSize: 18.0))
                        ]),
                        Column(children: [
                          Text('$bodyfat3 %', style: TextStyle(fontSize: 18.0))
                        ]),
                      ]),
                    ],
                  ),
                ),
              ])),
            if (_radioValue1 == 2)
              Center(
                  child: Column(children: <Widget>[
                Container(
                  margin: EdgeInsets.all(20),
                  child: Table(
                    defaultColumnWidth: FixedColumnWidth(120.0),
                    border: TableBorder.all(
                        color: Colors.black,
                        style: BorderStyle.solid,
                        width: 2),
                    children: [
                      TableRow(children: [
                        Column(children: [
                          Text('Formula', style: TextStyle(color: Colors.black,fontSize: 20.0))
                          
                        ]),
                        Column(children: [
                          Text('Lean Body Mass',
                              style: TextStyle(color: Colors.black,fontSize: 20.0))
                        ]),
                        Column(children: [
                          Text('Body Fat', style: TextStyle(color: Colors.black,fontSize: 20.0))
                        ]),
                      ]),
                      TableRow(children: [
                        Column(children: [
                          Text("Boer", style: TextStyle(color: Colors.black,fontSize: 20.0))
                        ]),
                        Column(children: [
                          Text('$boer Kg', style: TextStyle(color: Colors.black,fontSize: 20.0))
                        ]),
                        Column(children: [
                          Text('$bodyfat1 %', style: TextStyle(color: Colors.black,fontSize: 20.0))
                        ]),
                      ]),
                      TableRow(children: [
                        Column(children: [
                          Text('James', style: TextStyle(color: Colors.black,fontSize: 20.0))
                        ]),
                        Column(children: [
                          Text('$james Kg', style: TextStyle(color: Colors.black,fontSize: 20.0))
                        ]),
                        Column(children: [
                          Text('$bodyfat2 %', style: TextStyle(color: Colors.black,fontSize: 20.0))
                        ]),
                      ]),
                      TableRow(children: [
                        Column(children: [
                          Text('Hume', style: TextStyle(color: Colors.black,fontSize: 20.0))
                        ]),
                        Column(children: [
                          Text(' $hume Kg', style: TextStyle(color: Colors.black,fontSize: 20.0))
                        ]),
                        Column(children: [
                          Text('$bodyfat3 %', style: TextStyle(color: Colors.black,fontSize: 20.0))
                        ]),
                      ]),
                    ],
                  ),
                ),
              ])),
          ],
        ),
      ),
    );
  }

  void _onPress() {
    setState(() {
      a = double.parse(_acontroller.text);
      b = double.parse(_bcontroller.text);
     

      if (_radioValue == 1 && _radioValue1 == 2) {
        result = ((.407 * b) + (.267 * a)) - 19.2;
        boer = format(result);
        bodyfat11=100-(result/b)*100;
        bodyfat1= format(bodyfat11);
        

        result1 = 1.1 * b - 128 * ((b / a) * (b / a));
        james = format(result1);
        bodyfat12=100-(result1/b)*100;
        bodyfat2 = format(bodyfat12);

        result2 = .32810 * b + .33929 * a - 29.5336;
        hume = format(result2);
        bodyfat13=100-(result2/b)*100;
        bodyfat3 = format(bodyfat13);

      } else if (_radioValue == 2 && _radioValue1 == 2) {
        result = ((.252 * b) + (.473 * a)) - 48.3;
        boer = format(result);
        bodyfat11=100-(result/b)*100;
        bodyfat1= format(bodyfat11);

        result1 = 1.07 * b - 148 * ((b / a) * (b / a));
        james = format(result1);
        bodyfat12=100-(result1/b)*100;
        bodyfat2 = format(bodyfat12);

        result2 = .29569 * b + .41813 * a - 43.2933;
        hume = format(result2);
         bodyfat13=100-(result2/b)*100;
        bodyfat3 = format(bodyfat13);

      } else if (_radioValue == 1 && _radioValue1 == 1) {
        eECV = .0215 * pow(b, .6469) * pow(a, .7236);
        eLBM1 = 3.8 * eECV;
        peters = format(eLBM1);
        bodyfat14=100-(eLBM1/b)*100;
        bodyfat4= format(bodyfat14);

        result = ((.407 * b) + (.267 * a)) - 19.2;
        boer = format(result);
        bodyfat11=100-(result/b)*100;
        bodyfat1= format(bodyfat11);

        result1 = (1.1 * b) - (128 * ((b / a) * (b / a)));
        james = format(result1);
        bodyfat12=100-(result1/b)*100;
        bodyfat2 = format(bodyfat12);

        result2 = (.32810 * b) + (.33929 * a) - 29.5336;
        hume = format(result2);
         bodyfat13=100-(result2/b)*100;
        bodyfat3 = format(bodyfat13);

      } else if (_radioValue == 2 && _radioValue1 == 1) {
        eECV = .0215 * pow(b, .6469) * pow(a, .7236);
        eLBM1 = 3.8 * eECV;
        peters = format(eLBM1);
        bodyfat14=100-(eLBM1/b)*100;
        bodyfat4= format(bodyfat14);

        result = (.252 * b) + (.473 * a) - 48.3;
        boer = format(result);
        bodyfat11=100-(result/b)*100;
        bodyfat1= format(bodyfat11);

        result1 = 1.07 * b - 148 * ((b / a) * (b / a));
        james = format(result1);
        bodyfat12=100-(result1/b)*100;
        bodyfat2 = format(bodyfat12);

        result2 = (.29569 * b) + (.41813 * a) - 43.2933;
        hume = format(result2);
        bodyfat13=100-(result2/b)*100;
        bodyfat3 = format(bodyfat13);
      }
    });
  }

  String format(double n) {
    return n.toStringAsFixed(n.truncateToDouble() == n ? 0 : 2);
  }

  void _onPress1() {
    _acontroller.clear();
    _bcontroller.clear();
  }

  void _handleRadioValueChange(int value) {
    setState(() {
      _radioValue = value;

      switch (_radioValue) {
        case 1:
          break;
        case 2:
          break;
      }
    });
  }

  void _handleRadioValueChange1(int value) {
    setState(() {
      _radioValue1 = value;

      switch (_radioValue1) {
        case 1:
          break;
        case 2:
          break;
      }
    });
  }
}
