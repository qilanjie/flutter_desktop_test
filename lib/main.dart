import 'dart:math';
import 'dart:ui' as ui;

import 'package:flutter/cupertino.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter/gestures.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_localizations/flutter_localizations.dart';

import 'line_chart_page.dart';

const _strokeWidth = 8.0;

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      theme: ThemeData(
        // This is the theme of your application.
        //
        // Try running your application with "flutter run". You'll see the
        // application has a blue toolbar. Then, without quitting the app, try
        // changing the primarySwatch below to Colors.green and then invoke
        // "hot reload" (press "r" in the console where you ran "flutter run",
        // or simply save your changes to "hot reload" in a Flutter IDE).
        // Notice that the counter didn't reset back to zero; the application
        // is not restarted.
        primarySwatch: Colors.blue,
      ),
      home: const MyHomePage(title: 'Flutter Demo Home Page'),
      localizationsDelegates: [
        GlobalMaterialLocalizations.delegate,
        GlobalWidgetsLocalizations.delegate,
        GlobalCupertinoLocalizations.delegate,
      ],
      supportedLocales: [
        Locale('zh', 'CH'), // English, no country code
        Locale('en', 'US'), // Spanish, no country code
      ],
    );
  }
}

class MyHomePage extends StatefulWidget {
  const MyHomePage({Key? key, required this.title}) : super(key: key);

  // This widget is the home page of your application. It is stateful, meaning
  // that it has a State object (defined below) that contains fields that affect
  // how it looks.

  // This class is the configuration for the state. It holds the values (in this
  // case the title) provided by the parent (in this case the App widget) and
  // used by the build method of the State. Fields in a Widget subclass are
  // always marked "final".

  final String title;

  @override
  State<MyHomePage> createState() => _MyHomePageState();
}

// class Person{
//   String name="??????";
//   int age=23;
//   void getInfo(){
//     // print("$name----$age");
//     print("${this.name}----${this.age}");
//   }
//   void setInfo(int age){
//     this.age=age;
//   }}
// class Person {
//   String name;
//   num age;
//   Person(this.name,this.age);
//   void printInfo() {
//     print("${this.name}---${this.age}");
//   }
//   work(){
//     print("${this.name}?????????...");
//   }
// }
//
// class Web extends Person{
//   Web(String name, num age) : super(name, age);
//
//   run(){
//     print('run');
//   }
//   //?????????????????????
//   @override       //????????????????????????  ?????????????????????????????????????????? @override
//   void printInfo(){
//     print("?????????${this.name}---?????????${this.age}");
//   }
//   @override
//   work(){
//     print("${this.name}?????????????????????");
//   }
//
// }
class Person {
  String name;
  num age;

  Person(this.name, this.age);

  printInfo() {
    print('${this.name}----${this.age}');
  }

  void run() {
    print("Person Run");
  }
}

// class A {
//   String info="this is A";
//   void printA(){
//     print("A");
//   }
//   void run(){
//     print("A Run");
//   }
// }
//
// class B {
//   void printB(){
//     print("B");
//   }
//   void run(){
//     print("B Run");
//   }
// }
//
// class C extends Person with B,A{
//   C(String name, num age) : super(name, age);
//
// }
// String? getData(apiUrl) {
//   if (apiUrl != null) {
//     return "this is server data";
//   }
//   return null;
// }

class _MyHomePageState extends State<MyHomePage>
    with SingleTickerProviderStateMixin {
  int _counter = 0;

  // var _textFieldValue = '';
  TextEditingController _controller = TextEditingController();
  FocusNode _focusNode = FocusNode();
  var _radioGroupValue = '??????';
  var _checkValue = false;
  double _sliderValue = 2;
  RangeValues _rangeValues = RangeValues(0, 25);
  var _switchValue = false;
  var _dragData;
  int _currentIndex = 0;
  String _text = "";

  // Widget _currBody = HomePage();
  void _incrementCounter() {
    setState(() {
      // This call to setState tells the Flutter framework that something has
      // changed in this State, which causes it to rerun the build method below
      // so that the display can reflect the updated values. If we changed
      // _counter without calling setState(), then the build method would not be
      // called again, and so nothing would appear to happen.
      _counter++;
    });
  }

  @override
  void initState() {
    super.initState();
    _focusNode.addListener(() {
      if (!_focusNode.hasFocus) {
        // TextField has lost focus
        _controller.text = _controller.text.toUpperCase();
      }
    })

        // ..addListener(() {
        //   //???????????????????????????????????????
        //
        //
        // })
        ;
    // var l1=["??????",20,true];
    // var l6=List.filled(2, "");
    // List list1 = ['??????', '??????', 2];
    // var p= Map();
    // p["name"]="??????";
    // p["age"]=22;
    // p["work"]=["?????????","?????????"];
    // print(p);
    // var str="123";
    //
    // if(str is String){
    //   print('???string??????');
    // }else if(str is int){
    //
    //   print('int');
    // }else{
    //   print('????????????');}
    // int a=13;
    // int b=5;
    // print(a~/b);  //??????
    // var a=22;
    // var b= a ?? 10;
    // print(b);
    //  var myNum;
    // if(myNum==0){
    //    print('0');
    // }else{
    //   print('???0');
    // }
    // var myNum;
    // if(myNum==null){
    //    print('???');
    // }else{
    //   print('??????');
    // }
    // var myNum = 0 / 0;
    //
    //  print(myNum);
    //
    // if (myNum.isNaN) {
    //   print('??????????????????');
    // }
    // List myList=['??????','??????','??????'];
    //
    // var str=myList.join('-');   //list??????????????????
    //
    // print(str is String);
    // var str='??????-??????-??????';
    //
    // var list=str.split('-');
    //
    // print(list);
    // print(list is List);
    // List myList=['??????','??????','??????','??????','??????','??????','??????'];
    //
    // var s=new Set();
    //
    // s.addAll(myList);
    //
    // print(s);
    //
    // print(s.toList());
    // Map person={
    //   "name":"??????",
    //   "age":20,
    //   "sex":"???"
    // };
    //
    // print(person.keys.toString());
    // print(person.values);
    // print(person.isEmpty);
    // print(person.isNotEmpty);
    //  List myList=['??????','??????','??????'];
    //
    // for(var i=0;i<myList.length;i++){
    //   print(myList[i]);
    // }
    //
    //
    // for(var item in myList){
    //   print(item);
    // }
    //
    //
    // myList.forEach((value){
    //     print(value);
    // });
    // List myList=[1,3,4];
    // var newList=myList.map((value){
    //     return value*2;
    // });
    //  print(newList);
    // List myList=[1,3,4,5,7,8,9];
    //
    // var f=myList.every((value){   //?????????????????????????????????????????????true
    //
    //     return value>5;
    // });
    // print(f);
    //   //????????????????????????
    // List getList(){
    //
    //   return ['111','2222','333'];
    // }
    // void xxx(){
    //
    //   aaa(){
    //
    //     print(getList());
    //     print('aaa');
    //   }
    //   aaa();
    // }

    //   // aaa();  ????????????

//    xxx();  //????????????
//     //??????
//     fn1() {
//       print('fn1');
//     }
//
//     //??????
//     fn2(fn) {
//       fn();
//     }
//
//     //??????fn2???????????? ???fn1??????????????????????????????
//     fn2(fn1);
//     //???????????????
//
//     ((int n){
//       print(n);
//       print('?????????????????????');
//     })(12);
// var p1=Person();
//     print(p1.name);
//     p1.getInfo();
//     Person w=new Web('??????',20);
//
//     w.printInfo();
//
//     w.work();
//     var c=new C('??????',20);
//     c.run();
//     var a=new A();
//     print(a is Object);
//     print(getData(null));
  }

  @override
  Widget build(BuildContext context) {
    // This method is rerun every time setState is called, for instance as done
    // by the _incrementCounter method above.
    //
    // The Flutter framework has been optimized to make rerunning build methods
    // fast, so that you can just rebuild anything that needs updating rather
    // than having to individually change instances of widgets.

    return Scaffold(
      appBar: AppBar(
        // Here we take the value from the MyHomePage object that was created by
        // the App.build method, and use it to set our appbar title.
        iconTheme: IconThemeData(size: 24),
        actionsIconTheme: IconThemeData(size: 24),
        toolbarTextStyle: TextStyle(color: Colors.blue),
        title: Text("??????"),
        centerTitle: true,
        actions: <Widget>[
          IconButton(
            icon: Icon(Icons.menu),
            onPressed: () {},
          ),
          IconButton(
            icon: Icon(Icons.add),
            onPressed: () {},
          )
        ],
        // bottom:TabBar(
        // tabs: <Widget>[
        // Text('??????'),
        // Text('??????'),
        // Text('??????'),
        // Text('??????'),
        // Text('??????'),
        // ],
        //   controller: TabController(vsync:this , length: 5),
        // ),
        // elevation: 10,
        // shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(20)),
        // backgroundColor: Colors.red,
      ),
      body:
          // Center is a layout widget. It takes a single child and positions it
          // in the middle of the parent.
          // Row(mainAxisAlignment: MainAxisAlignment.center,
          //     children:[  Column(
          //   // Column is also a layout widget. It takes a list of children and
          //   // arranges them vertically. By default, it sizes itself to fit its
          //   // children horizontally, and tries to be as tall as its parent.
          //   //
          //   // Invoke "debug painting" (press "p" in the console, choose the
          //   // "Toggle Debug Paint" action from the Flutter Inspector in Android
          //   // Studio, or the "Toggle Debug Paint" command in Visual Studio Code)
          //   // to see the wireframe for each widget.
          //   //
          //   // Column has various properties to control how it sizes itself and
          //   // how it positions its children. Here we use mainAxisAlignment to
          //   // center the children vertically; the main axis here is the vertical
          //   // axis because Columns are vertical (the cross axis would be
          //   // horizontal).
          //
          //   children: <Widget>[
          //     const Text(
          //       'You have pushed the button this many times:',
          //     ),
          //     Text(
          //       '$_counter',
          //       style: Theme.of(context).textTheme.headline4,
          //     ),
          // RichText(
          //   text: TextSpan(
          //       style: DefaultTextStyle.of(context).style,
          //       children: <InlineSpan>[
          //         TextSpan(
          //             text: '?????????????????????',
          //             style: TextStyle(color: Colors.black54, fontSize: 14)),
          //         TextSpan(
          //           text: '??????+1',
          //           style: TextStyle(fontSize: 16),
          //           recognizer: TapGestureRecognizer()
          //             ..onTap = () {
          //               _incrementCounter();
          //             },
          //         ),
          //       ]),
          // ),
          // Container(
          //     height: 60,
          //     width: 250,
          //     child: TextField(
          //       maxLength: 10,
          //       onChanged: (value) {
          //         setState(() {
          //           _textFieldValue = value;
          //
          //           print("value=" + value);
          //           print("_controller.text=" + _controller.text);
          //         });
          //       },
          //       focusNode: _focusNode,
          //       controller: _controller,
          //       decoration: InputDecoration(
          //         // labelText: "?????????",
          //         // labelStyle: TextStyle(color: Colors.red),
          //         // prefixIcon: Icon(Icons.person),
          //         // suffix: Icon(Icons.person),
          //         // helperText: '??????????????????6-10?????????',
          //         // helperStyle: TextStyle(color: Colors.cyanAccent),
          //         // helperMaxLines: 1,
          //         // hintText: '??????????????????',
          //         // hintStyle: TextStyle(color: Colors.grey),
          //         // hintMaxLines: 1,
          //         // errorText: '?????????????????????',
          //         // errorStyle: TextStyle(fontSize: 12),
          //         // errorMaxLines: 1,
          //         // errorBorder: OutlineInputBorder(borderSide: BorderSide(color: Colors.red)),
          //         //  counterText: '${_textFieldValue.length}/32'
          //         fillColor: Color(0x30cccccc),
          //         filled: true,
          //         enabledBorder: OutlineInputBorder(
          //             borderSide: BorderSide(color: Color(0x00FF0000)),
          //             borderRadius: BorderRadius.all(Radius.circular(100))),
          //         hintText: 'QQ???/?????????/??????',
          //         focusedBorder: OutlineInputBorder(
          //             borderSide: BorderSide(color: Color(0x00000000)),
          //             borderRadius: BorderRadius.all(Radius.circular(100))),
          //       ),
          //       // toolbarOptions: ToolbarOptions(
          //       //     copy: true,
          //       //     cut: true,
          //       //     paste: true,
          //       //     selectAll: true
          //       // ),
          //       // obscureText: true,
          //       inputFormatters: [
          //         FilteringTextInputFormatter(RegExp("[a-zA-Z]"),
          //             allow: true),
          //       ],
          //     )),
          // Builder(
          //   builder: (BuildContext context) {
          //     RenderBox box = context.findRenderObject() as RenderBox;
          //     final Shader linearGradient = LinearGradient(
          //       colors: <Color>[Colors.purple, Colors.blue],
          //     ).createShader(
          //         Rect.fromLTWH(0.0, 0.0, box.size.width, box.size.height));
          //
          //     return Text(
          //       '?????????????????????Flutter?????????????????????',
          //       style: new TextStyle(
          //           fontSize: 18.0,
          //           fontWeight: FontWeight.bold,
          //           foreground: Paint()..shader = linearGradient),
          //     );
          //   },
          // ),
          // RichText(
          //   text: TextSpan(
          //       style: DefaultTextStyle.of(context).style,
          //       children: <InlineSpan>[
          //         WidgetSpan(
          //             child: Container(
          //           margin: EdgeInsets.only(right: 10),
          //           padding: EdgeInsets.symmetric(horizontal: 10),
          //           decoration: BoxDecoration(
          //               shape: BoxShape.rectangle,
          //               borderRadius: BorderRadius.all(Radius.circular(20)),
          //               color: Colors.blue),
          //           child: Text(
          //             '?????????',
          //             style: TextStyle(color: Colors.white),
          //           ),
          //         )),
          //         TextSpan(
          //             text: '????????????????????????????????????',
          //             style: TextStyle(color: Colors.black54, fontSize: 16)),
          //       ]),
          // ),
          // Text.rich(
          //   TextSpan(
          //       text: '??????????????????????????????',
          //       style: TextStyle(fontSize: 16, color: Color(0xFF999999)),
          //       children: [
          //         TextSpan(
          //           text: '??????????????????',
          //           style: TextStyle(
          //               color: Colors.blue, fontWeight: FontWeight.bold),
          //           recognizer: TapGestureRecognizer()
          //             ..onTap = () {
          //               print('onTap');
          //             },
          //         ),
          //       ]),
          // ),
          // TextField(
          //   decoration: InputDecoration(
          //     fillColor: Color(0x30cccccc),
          //     filled: true,
          //     enabledBorder: OutlineInputBorder(
          //         borderSide: BorderSide(color: Color(0x00FF0000)),
          //         borderRadius: BorderRadius.all(Radius.circular(100))),
          //     hintText: '????????????',
          //     focusedBorder: OutlineInputBorder(
          //         borderSide: BorderSide(color: Color(0x00000000)),
          //         borderRadius: BorderRadius.all(Radius.circular(100))),
          //   ),
          //   textAlign: TextAlign.center,
          //   obscureText: true,
          //   onChanged: (value) {},
          // ),
          // Text.rich(
          //   TextSpan(
          //       text: '??????',
          //       style: TextStyle(fontSize: 11, color: Color(0xFF999999)),
          //       children: [
          //         TextSpan(
          //           text: '@?????????',
          //           style: TextStyle(
          //               color: Colors.blue, fontWeight: FontWeight.bold),
          //           recognizer: TapGestureRecognizer()
          //             ..onTap = () {
          //               print('onTap');
          //             },
          //         ),
          //         TextSpan(
          //           text: '??????????????????Flutter?????????????????????',
          //         ),
          //       ]),
          // ),
          // ElevatedButton(
          //   child: Text('RaisedButton'),
          //   style: ButtonStyle(
          //       elevation: MaterialStateProperty.all(10),
          //       shape: MaterialStateProperty.all(BeveledRectangleBorder(side: BorderSide(width: 1, color: Colors.red),
          //           borderRadius: BorderRadius.circular(10)),
          //         )),
          //   onPressed: () {},
          // ),
          // ElevatedButton(
          //     style: ButtonStyle(
          //   shape: MaterialStateProperty.all(BeveledRectangleBorder(
          //       side: BorderSide(width: 1, color: Colors.red),
          //       borderRadius: BorderRadius.circular(100))),),
          //   child: Text('??????'),
          //   onPressed: () {},
          // ),
          // ElevatedButton(
          //   style: ButtonStyle(
          //     shape: MaterialStateProperty.all(BeveledRectangleBorder(
          //         side: BorderSide(width: 1, color: Colors.red),
          //         borderRadius: BorderRadius.circular(0)),),),
          //   child: Text('??????'),
          //   onPressed: () {},
          // ),
          // ElevatedButton(
          //   style: ButtonStyle(
          //     shape: MaterialStateProperty.all(CircleBorder(side: BorderSide(color: Colors.red))),),
          //   child: Text('??????'),
          //   onPressed: () {},
          // ),
          // TextButton(
          //   child: const Text('FlatButton'),
          //   style: ButtonStyle(
          //       // foregroundColor: MaterialStateProperty.all(Colors.white),
          //       // backgroundColor: MaterialStateProperty.all(Colors.blue),
          //       shape:MaterialStateProperty.all( ContinuousRectangleBorder(
          //           side: BorderSide(color: Colors.red),
          //           borderRadius: BorderRadius.circular(20))),
          //       // splashFactory: NoSplash.splashFactory
          //     ),
          //
          //   onPressed: () {},
          // ),
          // ElevatedButton(
          //   style: ButtonStyle(
          //     shape: MaterialStateProperty.all(StadiumBorder(
          //       side: BorderSide(color: Colors.red),),),),
          //   child: Text('??????'),
          //   onPressed: () {},
          // ),
          // ElevatedButton(
          //   style: ButtonStyle(
          //     shape: MaterialStateProperty.all(ContinuousRectangleBorder(
          //         side: BorderSide(color: Colors.red),
          //         borderRadius: BorderRadius.circular(20)),),),
          //   child: Text('??????'),
          //   onPressed: () {},
          // ),
          // ElevatedButton(
          //   style: ButtonStyle(
          //     shape: MaterialStateProperty.all(RoundedRectangleBorder(
          //         side: BorderSide(color: Colors.red),
          //         borderRadius: BorderRadius.circular(20)),),),
          //   child: Text('??????'),
          //   onPressed: () {},
          // ),
          // OutlinedButton(
          //   child: Text('OutlineButton'),
          //   onPressed: () {},
          // ),
          // IconButton(
          //   icon: Icon(Icons.add),
          //   onPressed: () {},
          // )

          //   ],
          // )]
          //  ),
          // Row(
          //   children: <Widget>[
          //     Flexible(
          //       child: RadioListTile(
          //         title: Text('??????'),
          //         value: '??????',
          //         groupValue: _radioGroupValue,
          //         onChanged: (value) {
          //           ScaffoldMessenger.of(context).clearSnackBars();
          //           ScaffoldMessenger.of(context).showSnackBar(
          //              SnackBar(
          //               backgroundColor: Colors.blue,
          //               elevation: 8,
          //               shape: BeveledRectangleBorder(borderRadius: BorderRadius.circular(0)),
          //               content: Text("????????????"+(value as String),textAlign: TextAlign.center,),
          //             ),
          //           );
          //           setState(() {
          //             _radioGroupValue = value as String;
          //           }
          //           );
          //         },
          //       ),
          //     ),
          //     Flexible(
          //         child: RadioListTile(
          //           title: Text('??????'),
          //           value: '??????',
          //           groupValue: _radioGroupValue,
          //           onChanged: (value) {
          //             ScaffoldMessenger.of(context).clearSnackBars();
          //             ScaffoldMessenger.of(context).showSnackBar(
          //               SnackBar(
          //                 backgroundColor: Colors.blue,
          //                 elevation: 8,
          //                 shape: BeveledRectangleBorder(borderRadius: BorderRadius.circular(0)),
          //                 content: Text("????????????"+(value as String),textAlign: TextAlign.center,),
          //               ),
          //             );
          //             setState(() {
          //               _radioGroupValue = value as String;
          //             });
          //           },
          //         )),
          //     Flexible(
          //         child: RadioListTile(
          //           title: Text('??????'),
          //           value: '??????',
          //           groupValue: _radioGroupValue,
          //           onChanged: (value) {
          //             ScaffoldMessenger.of(context).clearSnackBars();
          //             ScaffoldMessenger.of(context).showSnackBar(
          //               SnackBar(
          //                 backgroundColor: Colors.blue,
          //                 elevation: 8,
          //                 shape: BeveledRectangleBorder(borderRadius: BorderRadius.circular(0)),
          //                 content: Text("????????????"+(value as String),textAlign: TextAlign.center,),
          //               ),
          //             );
          //             setState(() {
          //               _radioGroupValue = value as String;
          //             });
          //           },
          //         )),
          //   ],
          // ),
          // Container(
          //
          //   child: CheckboxListTile(
          //     // controlAffinity: ListTileControlAffinity.leading,
          //     subtitle: Text('???????????????????????????'),
          //     secondary: Icon(Icons.person),
          //     title: Text('??????'),
          //     value: _checkValue,
          //     onChanged: (value){
          //       setState(() {
          //         _checkValue = value!;
          //       });
          //     },
          //   ),
          // ),
          //   Center(
          // child: Column(
          //   mainAxisSize: MainAxisSize.min,
          //   children: [
          // Text('??????$_sliderValue'),
          // Slider(
          //   min: 0,
          //   max: 100,
          //   divisions: 4,
          //   activeColor: Colors.red,
          //   inactiveColor: Colors.blue,
          //   label: '$_sliderValue',
          // value: _sliderValue,
          // onChanged: (v){
          // setState(() {
          // _sliderValue = v;
          // });
          // },
          // ),
          //   SliderTheme(
          //     data: SliderTheme.of(context).copyWith(
          //         activeTrackColor: Color(0xff404080),
          //         thumbColor: Colors.blue,
          //         overlayColor: Colors.green,
          //         valueIndicatorColor: Colors.purpleAccent),
          //     child: Slider(
          //       value: _sliderValue,
          //       label: '$_sliderValue',
          //       min: 0,
          //       max: 100,
          //       divisions: 4,
          //       onChanged: (v) {
          //         setState(() {
          //           _sliderValue = v;
          //         });
          //       },
          //     ),
          //   ),
          //   RangeSlider(
          //     values: _rangeValues,
          //     labels: RangeLabels('${_rangeValues.start}','${_rangeValues.end}'),
          //     min: 0,
          //     max: 100,
          //     divisions: 4,
          //     onChanged: (v) {
          //       setState(() {
          //         _rangeValues = v;
          //       });
          //     },
          //   ),
          //   CupertinoSlider(
          //     min: 0,max: 100,divisions: 10,
          //     value: _sliderValue,
          //     onChanged: (v) {
          //       setState(() {
          //         _sliderValue = v;
          //       });
          //     },
          //   )

          // SwitchListTile(
          // title:Text('????????????4G??????'),
          // value: _switchValue,
          // onChanged: (value){
          // setState(() {
          // _switchValue = value;
          // });
          // },
          // ),
          // CupertinoSwitch(
          //   value: _switchValue,
          //   onChanged: (value){
          //     setState(() {
          //       _switchValue = value;
          //     });
          //   },
          // )
          // LinearProgressIndicator(
          //   value: 0.3,
          //   backgroundColor: Colors.greenAccent,
          //   valueColor: AlwaysStoppedAnimation<Color>(Colors.red),
          // ),
          // CircularProgressIndicator(
          //   value: 0.3,
          //   backgroundColor: Colors.greenAccent,
          //   valueColor: AlwaysStoppedAnimation<Color>(Colors.red),
          // ),
          // CupertinoActivityIndicator(
          //   radius: 20,
          // )
          // Container(
          //   color: Colors.red.withOpacity(.3),
          //   child: Image.asset(
          //     'assets/images/aa.jpg',
          //     width: 300,
          //     height: 300,
          //     fit: BoxFit.cover,
          //     alignment: Alignment.topCenter,
          //   ),
          // ),
          // Icon(
          //   Icons.beach_access,
          //   size: 480,
          //   color: Colors.red,
          // )
          // Container(
          //   width: 200,
          //   height: 200,
          //   padding: EdgeInsets.all(3),
          //   decoration: BoxDecoration(shape: BoxShape.circle, color: Colors.red),
          //   child: Container(
          //     decoration: BoxDecoration(
          //         shape: BoxShape.circle,
          //         image: DecorationImage(
          //             image: AssetImage('assets/images/aa.jpg'), fit: BoxFit.cover)),
          //   ),
          // ),
          // Icon(IconData(0xE602,fontFamily: 'iconfont'),size:100,color: Colors.red)
          // Stack(
          //   clipBehavior: Clip.none,
          //   children: <Widget>[
          //     Container(
          //       height: 200,
          //       width: 200,
          //       color: Colors.red,
          //     ),
          //     Positioned(
          //       left: 100,
          //       top: 100,
          //       height: 150,
          //       width: 150,
          //       child: Container(
          //         color: Colors.green,
          //       ),
          //     )
          //   ],
          // )

          //      IndexedStackDemo()
          //       Wrap(
          //         children: List.generate(10, (i) {
          //           double w = 50.0 + 10 * i;
          //           return Container(
          //             color: Colors.primaries[i],
          //             height: 50,
          //             width: w,
          //             child: Text('$i'),
          //           );
          //         }),
          //       )

          //     ],
          //   ),
          // ),
          // Flow(
          //   delegate: SimpleFlowDelegate(),
          //   children: List.generate(5, (index) {
          //     return Container(
          //       height: 100,
          //       color: Colors.primaries[index % Colors.primaries.length],
          //     );
          //   }),
          // ),
          //   SettingDemo(),
          //    DemoFlowPopMenu(),
          //    DemoFlowMenu(),
          //    Container(
          //      child: Text('?????????????????????Flutter???????????????'),
          //      padding: EdgeInsets.symmetric(horizontal: 10),
          //      decoration: BoxDecoration(
          //          shape: BoxShape.rectangle,
          //          borderRadius: BorderRadius.all(Radius.circular(20)),
          //          color: Colors.blue),
          //    ),
          //    Container(
          //      child: Text('?????????????????????Flutter???????????????'),
          //      padding: EdgeInsets.symmetric(horizontal: 10),
          //      decoration: BoxDecoration(
          //        borderRadius: BorderRadius.circular(12),
          //        border: Border.all(
          //          color: Colors.blue,
          //          width: 2,
          //        ),
          //      ),
          //    ),
          //    Container(
          //      alignment: Alignment(-.5,-.5),
          //      child: Text('?????????????????????Flutter???????????????'),
          //    ),
          //    Container(
          //      color: Colors.blue,
          //      child: Text('?????????????????????Flutter???????????????'),
          //      alignment: Alignment.center,
          //      height: 60,
          //      width: 250,
          //      transform: Matrix4.rotationZ(pi/4),
          //    ),
          //    Column(
          //      children: <Widget>[
          //        Container(height: 30,color: Colors.blue,),
          //        SizedBox(height: 30,),
          //        Container(height: 30,color: Colors.red,),
          //      ],
          //    ),
          //    Container(
          //      height: 300,
          //      width: 300,
          //      color: Colors.blue,
          //      alignment: Alignment.center,
          //      child: AspectRatio(
          //        aspectRatio: 2 / 1,
          //        child: Container(color: Colors.red,),
          //      ),
          //    ),
          //    Container(
          //      height: 200,
          //      width: 200,
          //      color: Colors.blue,
          //      child: FractionallySizedBox(
          //        widthFactor: .8,
          //        heightFactor: .3,
          //        child: Container(
          //          color: Colors.red,
          //        ),
          //      ),
          //    ),
          //    Row(
          //      children: <Widget>[
          //        Container(
          //          color: Colors.blue,
          //          height: 50,
          //          width: 100,
          //        ),
          //        Flexible(
          //            child: Container(
          //              color: Colors.red,
          //              height: 50,
          //            )
          //        ),
          //        Container(
          //          color: Colors.blue,
          //          height: 50,
          //          width: 100,
          //        ),
          //      ],
          //    ),
          //    Column(
          //      children: <Widget>[
          //        Flexible(
          //          flex: 1,
          //          child: Container(
          //            color: Colors.blue,
          //            alignment: Alignment.center,
          //            child: Text('1 Flex/ 6 Total',style: TextStyle(color: Colors.white),),
          //          ),
          //        ),
          //        Flexible(
          //          flex: 2,
          //          child: Container(
          //            color: Colors.red,
          //            alignment: Alignment.center,
          //            child: Text('2 Flex/ 6 Total',style: TextStyle(color: Colors.white),),
          //          ),
          //        ),
          //        Flexible(
          //          flex: 3,
          //          child: Container(
          //            color: Colors.green,
          //            alignment: Alignment.center,
          //            child: Text('3 Flex/ 6 Total',style: TextStyle(color: Colors.white),),
          //          ),
          //        ),
          //      ],
          //    ),
          //    Row(
          //      children: <Widget>[
          //        Container(
          //          color: Colors.blue,
          //          height: 50,
          //          width: 100,
          //        ),
          //        Flexible(
          //            child: Container(
          //              color: Colors.red,
          //              height: 50,
          //              alignment: Alignment.center,
          //              child: Text('Container',style: TextStyle(color: Colors.white),),
          //            )
          //        ),
          //        Container(
          //          color: Colors.blue,
          //          height: 50,
          //          width: 100,
          //        ),
          //      ],
          //    ),
          //    Row(
          //      children: <Widget>[
          //        Container(
          //          color: Colors.blue,
          //          height: 50,
          //          width: 100,
          //        ),
          //        Flexible(
          //          child: OutlinedButton(
          //            onPressed: () {  },
          //            child: Text('OutlineButton'),
          //          ),
          //        ),
          //        Container(
          //          color: Colors.blue,
          //          height: 50,
          //          width: 100,
          //        ),
          //      ],
          //    ),
          //    Row(
          //      children: <Widget>[
          //        Container(
          //          color: Colors.blue,
          //          height: 50,
          //          width: 100,
          //        ),
          //        Expanded(
          //          child: OutlinedButton(
          //            onPressed: () {  },
          //            child: Text('OutlineButton'),
          //          ),
          //        ),
          //        Container(
          //          color: Colors.blue,
          //          height: 50,
          //          width: 100,
          //        ),
          //      ],
          //    ),
          //    Row(
          //      children: <Widget>[
          //        Container(width: 100,height: 50,color: Colors.green,),
          //        Spacer(flex: 2,),
          //        Container(width: 100,height: 50,color: Colors.blue,),
          //        Spacer(),
          //        Container(width: 100,height: 50,color: Colors.red,),
          //      ],
          //    ),
          // Container(
          //   color: Colors.grey.withOpacity(.5),
          //   alignment: Alignment.center,
          //   child: Container(
          //     height: 100,
          //     color: Colors.white,
          //     child: Row(
          //       children: <Widget>[
          //         SizedBox(
          //           width: 15,
          //         ),
          //         _buildCircleImg(),
          //         SizedBox(
          //           width: 25,
          //         ),
          //         Expanded(
          //           child: _buildCenter(),
          //         ),
          //         Icon(Icons.arrow_forward_ios, color: Colors.grey, size: 14,),
          //         SizedBox(
          //           width: 15,
          //         ),
          //       ],
          //     ),
          //   ),
          // ),
          // CylinderChart(),
          // ButtonCase(),
          // ListView.separated(
          //   itemBuilder: (BuildContext context, int index) {
          //     return Container(
          //       height: 45,
          //       alignment: Alignment.center,
          //       child: Text('$index'),
          //     );
          //   },
          //   separatorBuilder: (BuildContext context, int index){
          //     return Divider();
          //   },
          //   itemCount: 30,
          //
          // ),
          // ListViewDemo(),
          // GridView(
          //   gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
          //     crossAxisCount: 3, crossAxisSpacing: 2,
          //       mainAxisSpacing: 4
          //   ),
          //   children: [
          //     _createGridViewItem(Colors.primaries[0]),
          //     _createGridViewItem(Colors.primaries[1]),
          //     _createGridViewItem(Colors.primaries[2]),
          //     _createGridViewItem(Colors.primaries[3]),
          //     _createGridViewItem(Colors.primaries[4]),
          //     _createGridViewItem(Colors.primaries[5]),
          //     _createGridViewItem(Colors.primaries[6]),
          //     _createGridViewItem(Colors.primaries[7]),
          //
          //   ],
          // ),
          //     Container(
          //   child: ElevatedButton(
          //       child: Text('??????????????????'),
          //       onPressed: () async {
          //         await showDatePicker(
          //           context: context,
          //           initialDate: DateTime.now(),
          //           firstDate: DateTime(2010),
          //           lastDate: DateTime(2025),
          //         );
          //       }),
          // ),
          // ElevatedButton(
          //   child: Text('?????????????????????'),
          //   onPressed: () async {
          //     var result =
          //     showTimePicker(context: context, initialTime: TimeOfDay.now());
          //   },
          // ),
          // CupertinoDatePicker(
          //   use24hFormat: true,
          //   mode: CupertinoDatePickerMode.dateAndTime,
          //   initialDateTime: DateTime.now(),
          //   onDateTimeChanged: (date) {
          //     print('$date');
          //   },
          // ),
          // CupertinoTimerPicker(onTimerDurationChanged: (time) {
          //   print('$time');
          // }),
          //     PopupMenuButton<String>(
          //   initialValue: '??????',
          //   onSelected: (value) {
          //     print('$value');
          //   },
          //   onCanceled: () {
          //     print('onCanceled');
          //   },
          //   tooltip: '????????????',
          //   elevation: 5,
          //   padding: EdgeInsets.all(5),
          //   // color: Colors.red,
          //   // child: Text('??????'),
          //   // icon: Icon(Icons.add),
          //   shape: RoundedRectangleBorder(
          //       side: BorderSide(color: Colors.blue),
          //       borderRadius: BorderRadius.circular(10)),
          //   // offset: Offset(0, 200),
          //   itemBuilder: (context) {
          //     return <PopupMenuEntry<String>>[
          //       CheckedPopupMenuItem(
          //         value: '??????',
          //         checked: true,
          //         child: Text('??????'),
          //       ),
          //       CheckedPopupMenuItem(
          //         value: '??????',
          //         child: Text('??????'),
          //       ),
          //       PopupMenuItem<String>(
          //         value: '??????',
          //         child: Text('??????'),
          //       ),
          //       PopupMenuDivider(),
          //       PopupMenuItem<String>(
          //         value: '??????',
          //         child: Text('??????'),
          //       ),
          //       PopupMenuDivider(),
          //       PopupMenuItem<String>(
          //         value: '??????',
          //         child: Text('??????'),
          //       ),
          //       PopupMenuDivider(),
          //       PopupMenuItem<String>(
          //         value: '??????',
          //         child: Text('??????'),
          //       ),
          //       PopupMenuDivider(),
          //       PopupMenuItem<String>(
          //         value: '??????',
          //         child: Text('??????'),
          //       ),
          //     ];
          //   },
          // ),
          // ElevatedButton(
          //   child: Text('??????'),
          //   onPressed: () {
          //     showDialog(
          //         context: context,
          //         builder: (context) {
          //           return AlertDialog(
          //             title: Text('??????'),
          //             content: Text('??????????????????'),
          //             backgroundColor: Colors.lightBlueAccent,
          //             elevation: 24,
          //             shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(50)),
          //             actions: <Widget>[
          //               TextButton(child: Text('??????'),onPressed: (){},),
          //               TextButton(child: Text('??????'),onPressed: (){},),
          //             ],
          //           )
          //           ;
          //         });
          //   },
          // ),
          // ElevatedButton(
          //   child: Text('??????'),
          //   onPressed: () async {
          //     var result = await showDialog(
          //         context: context,
          //         builder: (context) {
          //           return AlertDialog(
          //             title: Text('??????'),
          //             content: Text('??????????????????'),
          //             actions: <Widget>[
          //               TextButton(
          //                 child: Text('??????'),
          //                 onPressed: () {
          //                   Navigator.of(context).pop('cancel');
          //                 },
          //               ),
          //               TextButton(
          //                 child: Text('??????'),
          //                 onPressed: () {
          //                   Navigator.of(context).pop('ok');
          //                 },
          //               ),
          //             ],
          //           );
          //         });
          //     print('$result');
          //   },
          // ),
          // Draggable(
          //   child: Container(
          //     height: 100,
          //     width: 100,
          //     alignment: Alignment.center,
          //     decoration: BoxDecoration(
          //         color: Colors.red,
          //         borderRadius: BorderRadius.circular(10)
          //     ),
          //     child: Text('???',style: TextStyle(color: Colors.white,fontSize: 18),),
          //   ),
          //   feedback: Container(
          //     height: 100,
          //     width: 100,
          //     alignment: Alignment.center,
          //     decoration: BoxDecoration(
          //         color: Colors.blue,
          //         borderRadius: BorderRadius.circular(10)
          //     ),
          //     child: Text('???',style: TextStyle(color: Colors.white,fontSize: 18),),
          //   ),
          //   childWhenDragging: Container(
          //     height: 100,
          //     width: 100,
          //     alignment: Alignment.center,
          //     decoration: BoxDecoration(
          //         color: Colors.grey, borderRadius: BorderRadius.circular(10)),
          //     child: Text(
          //       '???',
          //       style: TextStyle(color: Colors.white, fontSize: 18),
          //     ),
          //   ),
          // ),
          // Center(
          //   child: Column(
          //     children: <Widget>[
          //       _buildDraggable(),
          //       SizedBox(
          //         height: 200,
          //       ),
          //       DragTarget<Color>(
          //         builder: (BuildContext context, List<Color?> candidateData,
          //             List<dynamic> rejectedData) {
          //           print('candidateData:$candidateData,rejectedData:$rejectedData');
          //           return _dragData == null
          //               ? Container(
          //             height: 100,
          //             width: 100,
          //             alignment: Alignment.center,
          //             decoration: BoxDecoration(
          //                 borderRadius: BorderRadius.circular(10),
          //                 border: Border.all(color: Colors.red)),
          //           )
          //               : Container(
          //             height: 100,
          //             width: 100,
          //             alignment: Alignment.center,
          //             decoration: BoxDecoration(
          //                 color: Colors.red,
          //                 borderRadius: BorderRadius.circular(10)),
          //             child: Text(
          //               '???',
          //               style: TextStyle(color: Colors.white, fontSize: 18),
          //             ),
          //           );
          //         },
          //         onWillAccept: (Color? color) {
          //           print('onWillAccept:$color');
          //           return true;
          //         },
          //         onAccept: (Color color) {
          //           setState(() {
          //             _dragData = color;
          //           });
          //           print('onAccept:$color');
          //         },
          //         onLeave: (Color? color) {
          //           print('onLeave:$color');
          //         },
          //       ),
          //     ],
          //   ),
          // ),

          // DragTargetDetailsExample(),
          // InteractiveViewerDemo(),
          //     Center(
          //   child: ElevatedButton(
          //     onPressed: () {
          //       Navigator.push(context, MaterialPageRoute(builder: (context) {
          //         return Scaffold(
          //           appBar: AppBar(
          //             title: Text('??????1'),
          //           ),
          //         );
          //       }));
          //     },
          //     child: Text("??????1"),
          //   ),
          // ),
//        _currBody,
//       Container(
//         padding: EdgeInsets.symmetric(horizontal: 18),
//         child: Column(
//           children: <Widget>[
//             Expanded(
//               child: Container(
//                 alignment: Alignment.bottomRight,
//                 padding: EdgeInsets.only(right: 10),
//                 child: Text(
//                   '$_text',
//                   maxLines: 1,
//                   style: TextStyle(
//                       color: Colors.green,
//                       fontSize: 48,
//                       fontWeight: FontWeight.w400),
//                 ),
//               ),
//             ),
//             SizedBox(
//               height: 20,
//             ),
//             _CalculatorKeyboard(
//               onValueChange: _onValueChange,
//             ),
//             SizedBox(
//               height: 80,
//             )
//           ],
//         ),
//       ),
//       Column(children: [const Divider(),
//         Row(
//         mainAxisAlignment: MainAxisAlignment.center,
//         children: const <Widget>[VerticalDivider(),
//           Icon(
//             MyIcons.bofang,
//             color: Colors.purple,
//             size: 100,
//           ),VerticalDivider(
//
//            ),Icon(
//             MyIcons.fenlei,
//             color: Colors.purple,
//             size: 100,
//           ),VerticalDivider(),
//           Icon(
//             MyIcons.dingdan,
//             color: Colors.purple,
//             size: 100,
//           ),VerticalDivider(),
//           Icon(
//             MyIcons.fenxiang,
//             color: Colors.purple,
//             size: 100,
//           ),VerticalDivider(),
//           Icon(
//             MyIcons.mima,
//             color: Colors.purple,
//             size: 100,
//           ),VerticalDivider(),
//           Icon(
//             MyIcons.kabao,
//             color: Colors.purple,
//             size: 100,
//           ),VerticalDivider(),
//           Icon(
//             MyIcons.dingwei,
//             color: Colors.purple,
//             size: 100,
//           ),VerticalDivider(),
//           Icon(
//             MyIcons.dianpu,
//             color: Colors.purple,
//             size: 100,
//           ),VerticalDivider(),
//           Icon(
//             MyIcons.huodong,
//             color: Colors.purple,
//             size: 100,
//           ),
//         ],
//       ),],),
//       LineChartPage(),
          Center(
        child: Column(
          children: [
            BackButton(

              onPressed: () => {},

            ),
            Divider(),
            ElevatedButton(onPressed: (){}, child: Text("mmm"),),Divider(),
            CloseButton(),Divider(),
          ],
        ),
      ),
      // floatingActionButton: FloatingActionButton(
      //   onPressed: _incrementCounter,
      //   tooltip: 'Increment',
      //   child: const Icon(Icons.add),
      // ),
      // bottomNavigationBar: BottomNavigationBar(
      //   items: <BottomNavigationBarItem>[
      //     BottomNavigationBarItem(label: '??????', icon: Icon(Icons.home)),
      //     BottomNavigationBarItem(label: '??????', icon: Icon(Icons.book)),
      //     BottomNavigationBarItem(
      //         label: '??????', icon: Icon(Icons.perm_identity)),
      //   ],
      //   onTap: (int index) {
      //     switch (index) {
      //       case 0:
      //         _currBody = HomePage() ;
      //         break;
      //       case 1:
      //         _currBody = BookPage();
      //         break;
      //       case 2:
      //         _currBody = MyPage();
      //         break;
      //     }
      //     setState(() {
      //       _currentIndex = index;
      //     });
      //   },
      //   type: BottomNavigationBarType.shifting,
      //   selectedItemColor: Theme.of(context).primaryColor,
      //   unselectedItemColor: Colors.black,
      //   currentIndex:_currentIndex ,// This trailing comma makes auto-formatting nicer for build methods.
      // )
    );
  }

  @override
  void dispose() {
    super.dispose();
    _controller.dispose();
    _focusNode.dispose();
  }

// _createGridViewItem(Color color) {
//   return Container(
//     height: 80,
//     color: color,
//   );
// }

// _buildDraggable() {
//   return Draggable(
//     data: Color(0x000000FF),
//     child: Container(
//       height: 100,
//       width: 100,
//       alignment: Alignment.center,
//       decoration: BoxDecoration(
//           color: Colors.red, borderRadius: BorderRadius.circular(10)),
//       child: Text(
//         '???',
//         style: TextStyle(color: Colors.white, fontSize: 18),
//       ),
//     ),
//     feedback: Container(
//       height: 100,
//       width: 100,
//       alignment: Alignment.center,
//       decoration: BoxDecoration(
//           color: Colors.blue, borderRadius: BorderRadius.circular(10)),
//       child: DefaultTextStyle.merge(
//         style: TextStyle(color: Colors.white, fontSize: 18),
//         child: Text(
//           '???',
//         ),
//       ),
//     ),
//   );
// }

// _buildCircleImg() {
//   return Container(
//     height: 60,
//     width: 60,
//     decoration: BoxDecoration(
//         shape: BoxShape.circle,
//         image: DecorationImage(image: AssetImage('assets/images/aa.jpg'))),
//   );
// }
//
// _buildCenter() {
//   return Column(
//     mainAxisAlignment: MainAxisAlignment.center,
//     crossAxisAlignment: CrossAxisAlignment.start,
//     children: <Widget>[
//       Text('??????Flutter', style: TextStyle(fontSize: 20),),
//       Text('Flutter???Android', style: TextStyle(color: Colors.grey),)
//     ],
//   );}

// void _onValueChange(String value) {
//   // print(value);
//   setState(() {
//     _text = value;
//   });
// }
}

// class MyPage extends StatelessWidget{
//   @override
//   Widget build(BuildContext context) {
//     return Container(color: Colors.blue,);
//   }
// }
//
// class BookPage extends StatelessWidget{
//   @override
//   Widget build(BuildContext context) {
//     return Container(color: Colors.yellow,);
//   }
// }
//
// class HomePage extends StatelessWidget{
//   @override
//   Widget build(BuildContext context) {
//     return Container(color: Colors.red,);
//   }
// }

// class IndexedStackDemo extends StatefulWidget {
//   @override
//   _IndexedStackDemoState createState() => _IndexedStackDemoState();
// }
//
// class _IndexedStackDemoState extends State<IndexedStackDemo> {
//   int _index = 0;
//
//   @override
//   Widget build(BuildContext context) {
//     return Column(
//       children: <Widget>[
//         SizedBox(height: 50,),
//         _buildIndexedStack(),
//         SizedBox(height: 30,),
//         _buildRow(),
//       ],
//     );
//   }
//
//   _buildIndexedStack() {
//     return IndexedStack(
//       index: _index,
//       children: <Widget>[
//         Center(
//           child: Container(
//             height: 300,
//             width: 300,
//             color: Colors.red,
//             alignment: Alignment.center,
//             child: Icon(
//               Icons.fastfood,
//               size: 60,
//               color: Colors.blue,
//             ),
//           ),
//         ),
//         Center(
//           child: Container(
//             height: 300,
//             width: 300,
//             color: Colors.green,
//             alignment: Alignment.center,
//             child: Icon(
//               Icons.cake,
//               size: 60,
//               color: Colors.blue,
//             ),
//           ),
//         ),
//         Center(
//           child: Container(
//             height: 300,
//             width: 300,
//             color: Colors.yellow,
//             alignment: Alignment.center,
//             child: Icon(
//               Icons.local_cafe,
//               size: 60,
//               color: Colors.blue,
//             ),
//           ),
//         ),
//       ],
//     );
//   }
//
//   _buildRow() {
//     return Row(
//       mainAxisAlignment: MainAxisAlignment.center,
//       children: <Widget>[
//         IconButton(
//           icon: Icon(Icons.fastfood),
//           onPressed: () {
//             setState(() {
//               _index = 0;
//             });
//           },
//         ),
//         IconButton(
//           icon: Icon(Icons.cake),
//           onPressed: () {
//             setState(() {
//               _index = 1;
//             });
//           },
//         ),
//         IconButton(
//           icon: Icon(Icons.local_cafe),
//           onPressed: () {
//             setState(() {
//               _index = 2;
//             });
//           },
//         ),
//       ],
//     );
//   }
// }
//
// class SimpleFlowDelegate extends FlowDelegate {
//   @override
//   void paintChildren(FlowPaintingContext context) {
//     for (int i = 0; i < context.childCount; ++i) {
//       context.paintChild(i,transform: Matrix4.translationValues(0,i*30.0,0));
//     }
//   }
//
//   @override
//   bool shouldRepaint(SimpleFlowDelegate oldDelegate) {
//     return false;
//   }
// }
// class _SettingItem extends StatelessWidget {
//   const _SettingItem(
//       {Key? key, this.iconData, this.iconColor, this.title, required this.suffix})
//       : super(key: key);
//
//   final IconData? iconData;
//   final Color? iconColor;
//   final String? title;
//   final Widget suffix;
//
//   @override
//   Widget build(BuildContext context) {
//     return Container(
//       height: 45,
//       child: Row(
//         children: <Widget>[
//           SizedBox(
//             width: 30,
//           ),
//           Icon(iconData,color: iconColor,),
//           SizedBox(
//             width: 30,
//           ),
//           Expanded(
//             child: Text('$title'),
//           ),
//           suffix,
//           SizedBox(
//             width: 15,
//           ),
//         ],
//       ),
//     );
//   }
// }
// class _NotificationsText extends StatelessWidget {
//   final String? text;
//
//   const _NotificationsText({Key? key, this.text}) : super(key: key);
//
//   @override
//   Widget build(BuildContext context) {
//     return Container(
//       padding: EdgeInsets.symmetric(horizontal: 10),
//       decoration: BoxDecoration(
//           shape: BoxShape.rectangle,
//           borderRadius: BorderRadius.all(Radius.circular(50)),
//           color: Colors.red),
//       child: Text(
//         '$text',
//         style: TextStyle(color: Colors.white),
//       ),
//     );
//   }
// }
// class _Suffix extends StatelessWidget {
//   final String? text;
//
//   const _Suffix({Key? key, this.text}) : super(key: key);
//
//   @override
//   Widget build(BuildContext context) {
//     return Text(
//       '$text',
//       style: TextStyle(color: Colors.grey.withOpacity(.5)),
//     );
//   }
// }
// class SettingDemo extends StatelessWidget {
//   @override
//   Widget build(BuildContext context) {
//     return Column(
//       children: <Widget>[
//         _SettingItem(
//           iconData: Icons.notifications,
//           iconColor: Colors.blue,
//           title: '????????????',
//           suffix: _NotificationsText(
//             text: '2',
//           ),
//         ),
//         Divider(),
//         _SettingItem(
//           iconData: Icons.thumb_up,
//           iconColor: Colors.green,
//           title: '????????????',
//           suffix: _Suffix(
//             text: '121???',
//           ),
//         ),
//         Divider(),
//         _SettingItem(
//           iconData: Icons.grade,
//           iconColor: Colors.yellow,
//           title: '?????????',
//           suffix: _Suffix(
//             text: '2???',
//           ),
//         ),
//         Divider(),
//         _SettingItem(
//           iconData: Icons.shopping_basket,
//           iconColor: Colors.yellow,
//           title: '????????????',
//           suffix: _Suffix(
//             text: '100???',
//           ),
//         ),
//         Divider(),
//         _SettingItem(
//           iconData: Icons.account_balance_wallet,
//           iconColor: Colors.blue,
//           title: '????????????',
//           suffix: _Suffix(
//             text: '10???',
//           ),
//         ),
//         Divider(),
//         _SettingItem(
//           iconData: Icons.location_on,
//           iconColor: Colors.grey,
//           title: '??????????????????',
//           suffix: _Suffix(
//             text: '1034???',
//           ),
//         ),
//         Divider(),
//         _SettingItem(
//           iconData: Icons.local_offer,
//           iconColor: Colors.grey,
//           title: '????????????',
//           suffix: _Suffix(
//             text: '27???',
//           ),
//         ),
//       ],
//     );
//   }
// }
// class DemoFlowPopMenu extends StatefulWidget {
//   @override
//   _DemoFlowPopMenuState createState() => _DemoFlowPopMenuState();
// }
//
// class _DemoFlowPopMenuState extends State<DemoFlowPopMenu>
//     with SingleTickerProviderStateMixin {
//   //???????????????with?????????
//   late AnimationController _ctrlAnimationPopMenu; //?????????????????????
//   IconData lastTapped = Icons.notifications;
//   final List<IconData> menuItems = <IconData>[
//     //?????????icon
//     Icons.home,
//     Icons.new_releases,
//     Icons.notifications,
//     Icons.settings,
//     Icons.menu,
//   ];
//
//   void _updateMenu(IconData icon) {
//     if (icon != Icons.menu) {
//       setState(() => lastTapped = icon);
//     } else {
//       _ctrlAnimationPopMenu.status == AnimationStatus.completed
//           ? _ctrlAnimationPopMenu.reverse() //????????????????????????
//           : _ctrlAnimationPopMenu.forward();
//     }
//   }
//
//   @override
//   void initState() {
//     super.initState();
//     _ctrlAnimationPopMenu = AnimationController(
//       //???????????????????????????
//       duration: const Duration(milliseconds: 250), //????????????250??????
//       vsync: this, //SingleTickerProviderStateMixin?????????
//     );
//   }

//??????Popmenu??????
//   Widget flowMenuItem(IconData icon) {
//     final double buttonDiameter =
//         MediaQuery.of(context).size.width * 2 / (menuItems.length * 3);
//     return Padding(
//       padding: const EdgeInsets.symmetric(vertical: 8.0),
//       child: RawMaterialButton(
//         fillColor: lastTapped == icon ? Colors.amber[700] : Colors.blue,
//         splashColor: Colors.amber[100],
//         shape: CircleBorder(),
//         constraints: BoxConstraints.tight(Size(buttonDiameter, buttonDiameter)),
//         onPressed: () {
//           _updateMenu(icon);
//         },
//         child: Icon(icon, color: Colors.white, size: 30.0),
//       ),
//     );
//   }
//
//   @override
//   Widget build(BuildContext context) {
//     return Center(
//       child: Flow(
//         delegate: FlowMenuDelegate(animation: _ctrlAnimationPopMenu),
//         children: menuItems
//             .map<Widget>((IconData icon) => flowMenuItem(icon))
//             .toList(),
//       ),
//     );
//   }
// }
// class FlowMenuDelegate extends FlowDelegate {
//   FlowMenuDelegate({this.animation}) : super(repaint: animation);
//   final Animation<double>? animation;
//
//   @override
//   void paintChildren(FlowPaintingContext context) {
//     double x = 50.0; //????????????
//     double y = 50.0; //????????????,y??????
//     for (int i = 0; i < context.childCount; ++i) {
//       x = context.getChildSize(i)!.width * i * animation!.value;
//       context.paintChild(
//         i,
//         transform: Matrix4.translationValues(x, y, 0),
//       );
//     }
//   }
//
//   @override
//   bool shouldRepaint(FlowMenuDelegate oldDelegate) =>
//       animation != oldDelegate.animation;
// }
// class DemoFlowMenu extends StatefulWidget {
//   @override
//   _DemoFlowMenuState createState() => _DemoFlowMenuState();
// }
//
// class _DemoFlowMenuState extends State<DemoFlowMenu>
//     with TickerProviderStateMixin {
//   //??????????????????????????????
//   //????????????,????????????????????????
//   late AnimationController _ctrlAnimationCircle;
//
//   @override
//   void initState() {
//     super.initState();
//     _ctrlAnimationCircle = AnimationController(
//       //?????????????????????
//         lowerBound: 0,
//         upperBound: 80,
//         duration: Duration(milliseconds: 300),
//         vsync: this);
//     _ctrlAnimationCircle.addListener(() => setState(() {}));
//   }
//
//   @override
//   void dispose() {
//     _ctrlAnimationCircle.dispose(); //????????????,????????????
//     super.dispose();
//   }
//
//   //??????Flow?????????
//   List<Widget> _buildFlowChildren() {
//     return List.generate(
//         5,
//             (index) => Container(
//           child: Icon(
//             index.isEven ? Icons.timer : Icons.ac_unit,
//             color: Colors.primaries[index % Colors.primaries.length],
//           ),
//         ));
//   }
//
//   @override
//   Widget build(BuildContext context) {
//     return Stack(
//       children: <Widget>[
//         Positioned.fill(
//           child: Flow(
//             delegate: FlowAnimatedCircle(_ctrlAnimationCircle.value),
//             children: _buildFlowChildren(),
//           ),
//         ),
//         Positioned.fill(
//           child: IconButton(
//             icon: Icon(Icons.menu),
//             onPressed: () {
//               setState(() {
//                 //????????????????????????????????????
//                 _ctrlAnimationCircle.status == AnimationStatus.completed
//                     ? _ctrlAnimationCircle.reverse()
//                     : _ctrlAnimationCircle.forward();
//               });
//             },
//           ),
//         ),
//       ],
//     );
//   }
// }
// class FlowAnimatedCircle extends FlowDelegate {
//   final double radius; //????????????,???????????????
//   FlowAnimatedCircle(this.radius);
//
//   @override
//   void paintChildren(FlowPaintingContext context) {
//     if (radius == 0) {
//       return;
//     }
//     double x = 0; //??????(0,0)?????????????????????
//     double y = 0;
//     for (int i = 0; i < context.childCount; i++) {
//       x = radius * cos(i * pi / (context.childCount - 1)); //????????????????????????
//       y = radius * sin(i * pi / (context.childCount - 1)); //????????????????????????
//       context.paintChild(i, transform: Matrix4.translationValues(x, -y, 0));
//     } //??????Matrix?????????????????????
//   }
//
//   @override
//   bool shouldRepaint(FlowDelegate oldDelegate) => true;
// }
// class _Axis extends StatelessWidget {
//   final Widget? child;
//
//   const _Axis({Key? key, this.child}) : super(key: key);
//
//   @override
//   Widget build(BuildContext context) {
//     return Container(
//       decoration: BoxDecoration(
//         border: Border(
//           left: BorderSide(color: Colors.black, width: 2),
//           bottom: BorderSide(color: Colors.black, width: 2),
//         ),
//       ),
//       child: child,
//     );
//   }
// }
// class _Cylinder extends StatelessWidget {
//   final double? height;
//   final double? width;
//   final Color? color;
//
//   const _Cylinder({Key? key, this.height, this.width, this.color})
//       : super(key: key);
//
//   @override
//   Widget build(BuildContext context) {
//     return AnimatedContainer(
//       duration: Duration(seconds: 1),
//       height: height,
//       width: width,
//       color: color,
//     );
//   }
// }
//
// class CylinderChart extends StatefulWidget {
//   @override
//   _CylinderChartState createState() => _CylinderChartState();
// }
//
// class _CylinderChartState extends State<CylinderChart> {
//   final double _width = 20.0;
//   List<double> _heightList = [60.0, 80.0, 100.0, 120.0, 140.0];
//
//   @override
//   Widget build(BuildContext context) {
//     return Center(
//       child: Container(
//         height: 200,
//         width: 250,
//         child: Stack(
//           children: <Widget>[
//             _Axis(),
//             Positioned.fill(
//               left: 5,
//               right: 5,
//               child: Row(
//                   mainAxisAlignment: MainAxisAlignment.spaceBetween,
//                   crossAxisAlignment: CrossAxisAlignment.end,
//                   children: List.generate(_heightList.length, (index) {
//                     return _Cylinder(
//                       height: _heightList[index],
//                       width: _width,
//                       color: Colors.primaries[index % Colors.primaries.length],
//                     );
//                   })),
//             ),
//             Positioned(
//               top: 0,
//               left: 30,
//               child: OutlineButton(
//                 child: Text('??????'),
//                 onPressed: () {
//                   setState(() {
//                     _heightList = _heightList.reversed.toList();
//                   });
//                 },
//               ),
//             )
//           ],
//         ),
//       ),
//     );
//   }
// }

// class ButtonCase extends StatefulWidget {
//   @override
//   _ButtonCaseState createState() => _ButtonCaseState();
// }
//
// class _ButtonCaseState extends State<ButtonCase> {
//   ButtonStatus _buttonStatus = ButtonStatus.none;
//
//   _buildChild() {
//     if (_buttonStatus == ButtonStatus.none) {
//       return Text(
//         '??? ???',
//         style: TextStyle(color: Colors.white,fontSize: 18),
//       );
//     } else if (_buttonStatus == ButtonStatus.loading) {
//       return CircularProgressIndicator(
//         backgroundColor: Colors.white,
//         strokeWidth: 2,
//       );
//     } else if (_buttonStatus == ButtonStatus.done) {
//       return Icon(
//         Icons.check,
//         color: Colors.white,
//       );
//     }
//   }
//
//   @override
//   Widget build(BuildContext context) {
//     return MaterialButton(
//       color: Colors.blue,
//       minWidth: 240,
//       height: 48,
//       onPressed: () {
//         setState(() {
//           _buttonStatus = ButtonStatus.loading;
//           Future.delayed(Duration(seconds: 2), () {
//             setState(() {
//               _buttonStatus = ButtonStatus.done;
//             });
//           });
//         });
//       },
//       child: _buildChild(),
//     );
//   }
// }
//
// enum ButtonStatus { none, loading, done }
// class ListViewDemo extends StatefulWidget {
//   @override
//   _ListViewDemoState createState()=>_ListViewDemoState();
// }
// class _ListViewDemoState extends State<ListViewDemo> {
//   late ScrollController _controller;
//
//   @override
//   void initState() {
//     _controller = ScrollController()
//       ..addListener(() {
//         print('${_controller.position}');
//       });
//     super.initState();
//   }
//
//   @override
//   @override
//   Widget build(BuildContext context) {
//     return Column(
//       children: <Widget>[
//         Container(
//           child: ElevatedButton(
//             child: Text('?????????????????????'),
//             onPressed: () {
//               _controller.animateTo(200,
//                   duration: Duration(milliseconds: 300), curve: Curves.linear);
//             },
//           ),
//         ),
//         Expanded(
//           child: ListView.builder(
//             controller: _controller,
//             reverse: false,
//             itemBuilder: (BuildContext context, int index) {
//               return _ListItem(
//                 title: '$index',
//               );
//             },
//             itemCount: 30,
//             itemExtent: 50,
//           ),
//         )
//       ],
//     );
//   }
//
// }
//
//
// class _ListItem extends StatelessWidget {
//
//   final String title;
//
//   const _ListItem({ Key? key, required this.title}) : super(key: key);
//   @override
//   Widget build(BuildContext context) {
//     return Card(
//       child: Container(
//         height: 45,
//         alignment: Alignment.center,
//         child: Text('$title'),
//       ),
//     );
//   }
// }
// class DragTargetDetailsExample extends StatefulWidget {
//   @override
//   _DragTargetDetailsExampleState createState() =>
//       _DragTargetDetailsExampleState();
// }
//
// class _DragTargetDetailsExampleState extends State<DragTargetDetailsExample> {
//   static const _feedbackSize = Size(100.0, 100.0);
//   static const _padding = 16.0;
//
//   static final _decoration = BoxDecoration(
//     border: Border.all(
//       color: Colors.blue,
//       width: _strokeWidth,
//     ),
//     borderRadius: BorderRadius.circular(12),
//   );
//
//    Offset _lastDropOffset=Offset(0, 0);
//    int _lastDropIndex=0;
//
//   Widget _buildSourceRowChild(int index) => Expanded(
//       child: Padding(
//           padding: EdgeInsets.all(_padding),
//           child: Draggable<int>(
//               data: index,
//               feedback: Transform.translate(
//                   offset: Offset(
//                       -_feedbackSize.width / 2.0, -_feedbackSize.height / 2.0),
//                   child: Container(
//                       decoration: _decoration,
//                       width: _feedbackSize.width,
//                       height: _feedbackSize.height)),
//               child: Container(
//                   decoration: _decoration,
//                   child: Column(
//                       mainAxisAlignment: MainAxisAlignment.center,
//                       children: [
//                         Text('drag me'),
//                         Text('$index', style: TextStyle(fontSize: 32.0))
//                       ])), dragAnchorStrategy: pointerDragAnchorStrategy)));
//
//   void _handleAcceptWithDetails(
//       BuildContext dragTargetContext, DragTargetDetails details) {
//     // Convert global to local coordinates.
//     RenderBox renderBox = dragTargetContext.findRenderObject() as RenderBox;
//     final localOffset = renderBox.globalToLocal(details.offset);
//     setState(() {
//       _lastDropOffset = localOffset;
//       _lastDropIndex = details.data;
//     });
//   }
//
//   Widget _buildDragTargetChild() => Padding(
//       padding: EdgeInsets.all(_padding),
//       child: Container(
//           decoration: _decoration,
//           // Note use of builder to get a context for the [DragTarget] which is
//           // available to pass to [_handleAcceptWithDetails].
//           child: Builder(
//               builder: (targetContext) => DragTarget<int>(
//                   builder: (_, candidateData, __) => Container(
//                       color: candidateData.isNotEmpty
//                           ? Color(0x2200FF00)
//                           : Color(0x00000000),
//                       child: CustomPaint(
//                           painter: _Painter(_lastDropOffset, _lastDropIndex))),
//                   onAcceptWithDetails: (details) =>
//                       _handleAcceptWithDetails(targetContext, details)))));
//
//   @override
//   Widget build(BuildContext context) {
//     return Scaffold(
//         appBar: AppBar(),
//         body: Column(crossAxisAlignment: CrossAxisAlignment.stretch, children: [
//           Expanded(
//               flex: 1,
//               child: Row(
//                   children: List<Widget>.generate(3, _buildSourceRowChild))),
//           Expanded(flex: 4, child: _buildDragTargetChild())
//         ]));
//   }
//   @override
//   void debugFillProperties(DiagnosticPropertiesBuilder properties) {
//     super.debugFillProperties(properties);
//     properties.add(DiagnosticsProperty<ui.Offset>('_lastDropOffset', _lastDropOffset));
//   }
// }
//
// class _Painter extends CustomPainter {
//   static final _diameter = 24.0;
//
//   static final _linePaint = Paint()
//     ..style = PaintingStyle.stroke
//     ..strokeWidth = _strokeWidth
//     ..color = Colors.blue;
//
//   static final _whiteFillPaint = Paint()
//     ..style = PaintingStyle.fill
//     ..color = Colors.white;
//
//   static final _blueFillPaint = Paint()
//     ..style = PaintingStyle.fill
//     ..color = Colors.blue;
//
//   final Offset _offset;
//   final int _index;
//
//   _Painter(this._offset, this._index);
//
//   @override
//   void paint(Canvas canvas, Size size) {
//     if (_offset == null || _index == null) return;
//     canvas.drawLine(
//         Offset(_offset.dx, 0.0), Offset(_offset.dx, size.height), _linePaint);
//     canvas.drawLine(
//         Offset(0.0, _offset.dy), Offset(size.width, _offset.dy), _linePaint);
//
//     canvas.drawCircle(_offset, _diameter + _strokeWidth, _blueFillPaint);
//     canvas.drawCircle(_offset, _diameter, _whiteFillPaint);
//
//     final paragraphBuilder =
//     ui.ParagraphBuilder(ui.ParagraphStyle(textAlign: TextAlign.center))
//       ..pushStyle(ui.TextStyle(
//           fontStyle: FontStyle.normal,
//           color: Colors.blue,
//           fontSize: _diameter))
//       ..addText('$_index');
//     final paragraph = paragraphBuilder.build();
//     paragraph.layout(ui.ParagraphConstraints(width: _diameter));
//     canvas.drawParagraph(
//         paragraph, _offset - Offset(_diameter / 2.0, _diameter / 2.0));
//   }
//
//   @override
//   bool shouldRepaint(_Painter oldPainter) => false;
// }
// class InteractiveViewerDemo extends StatelessWidget {
//   @override
//   Widget build(BuildContext context) {
//     const int _rowCount = 20;
//     const int _columnCount = 10;
//     return Scaffold(
//       appBar: AppBar(),
//       body: Center(
//         child: Container(
//           height: 300,
//           width: 300,
//           child: InteractiveViewer(
//             constrained: false,
//             child: Table(
//               columnWidths: <int, TableColumnWidth>{
//                 for (int column = 0; column < _columnCount; column += 1)
//                   column: const FixedColumnWidth(100.0),
//               },
//               children: <TableRow>[
//                 for (int row = 0; row < _rowCount; row += 1)
//                   TableRow(
//                     children: <Widget>[
//                       for (int column = 0; column < _columnCount; column += 1)
//                         Container(
//                           height: 50,
//                           color: row % 2 + column % 2 == 1
//                               ? Colors.red
//                               : Colors.green,
//                         ),
//                     ],
//                   ),
//               ],
//             ),
//           ),
//         ),
//       ),
//     );
//   }
// }
// class _CalculatorItem extends StatelessWidget {
//   final String? text;
//   final Color? textColor;
//   final Color? color;
//   final Color? highlightColor;
//   final double? width;
//   final ValueChanged<String> onValueChange;
//
//   _CalculatorItem(
//       {this.text,
//       this.textColor,
//       this.color,
//       this.highlightColor,
//       this.width,
//       required this.onValueChange});
//
//   @override
//   Widget build(BuildContext context) {
//     return Ink(
//       decoration: BoxDecoration(
//           color: color, borderRadius: BorderRadius.all(Radius.circular(200))),
//       child: InkWell(
//         onTap: () {
//           onValueChange('$text');
//         },
//         borderRadius: BorderRadius.all(Radius.circular(200)),
//         highlightColor: highlightColor ?? color,
//         child: Container(
//           width: width ?? 70,
//           height: 70,
//           padding: EdgeInsets.only(left: width == null ? 0 : 25),
//           alignment: width == null ? Alignment.center : Alignment.centerLeft,
//           child: Text(
//             '$text',
//             style: TextStyle(color: textColor ?? Colors.white, fontSize: 24),
//           ),
//         ),
//       ),
//     );
//   }
// }

// final List<Map> _keyboardList = [
//   {
//     'text': 'AC',
//     'textColor': Colors.black,
//     'color': Color(0xFFA5A5A5),
//     'highlightColor': Color(0xFFD8D8D8)
//   },
//   {
//     'text': '+/-',
//     'textColor': Colors.black,
//     'color': Color(0xFFA5A5A5),
//     'highlightColor': Color(0xFFD8D8D8)
//   },
//   {
//     'text': '%',
//     'textColor': Colors.black,
//     'color': Color(0xFFA5A5A5),
//     'highlightColor': Color(0xFFD8D8D8)
//   },
//   {
//     'text': '??',
//     'color': Color(0xFFE89E28),
//     'highlightColor': Color(0xFFEDC68F)
//   },
//   {'text': '7', 'color': Color(0xFF363636)},
//   {'text': '8', 'color': Color(0xFF363636)},
//   {'text': '9', 'color': Color(0xFF363636)},
//   {
//     'text': 'x',
//     'color': Color(0xFFE89E28),
//     'highlightColor': Color(0xFFEDC68F)
//   },
//   {'text': '4', 'color': Color(0xFF363636)},
//   {'text': '5', 'color': Color(0xFF363636)},
//   {'text': '6', 'color': Color(0xFF363636)},
//   {
//     'text': '-',
//     'color': Color(0xFFE89E28),
//     'highlightColor': Color(0xFFEDC68F)
//   },
//   {'text': '1', 'color': Color(0xFF363636)},
//   {'text': '2', 'color': Color(0xFF363636)},
//   {'text': '3', 'color': Color(0xFF363636)},
//   {
//     'text': '+',
//     'color': Color(0xFFE89E28),
//     'highlightColor': Color(0xFFEDC68F)
//   },
//   {'text': '0', 'color': Color(0xFF363636), 'width': 158.0},
//   {'text': '.', 'color': Color(0xFF363636)},
//   {
//     'text': '=',
//     'color': Color(0xFFE89E28),
//     'highlightColor': Color(0xFFEDC68F)
//   },
// ];
//
// class _CalculatorKeyboard extends StatelessWidget {
//   final ValueChanged<String> onValueChange;
//
//   const _CalculatorKeyboard({Key? key, required this.onValueChange})
//       : super(key: key);
//
//   @override
//   Widget build(BuildContext context) {
//     return Wrap(
//       runSpacing: 18,
//       spacing: 18,
//       children: List.generate(_keyboardList.length, (index) {
//         return _CalculatorItem(
//           text: _keyboardList[index]['text'],
//           textColor: _keyboardList[index]['textColor'],
//           color: _keyboardList[index]['color'],
//           highlightColor: _keyboardList[index]['highlightColor'],
//           width: _keyboardList[index]['width'],
//           onValueChange: onValueChange,
//         );
//       }),
//     );
//   }
// }
// class MyIcons {
//   // bofang ??????
//   static const IconData bofang =
//       const IconData(0xe791, fontFamily: 'iconfont', matchTextDirection: true);
//
//   // fenlei ??????
//   static const IconData fenlei =
//       const IconData(0xe792, fontFamily: 'iconfont', matchTextDirection: true);
//
//   // dingdan ??????
//   static const IconData dingdan =
//       const IconData(0xe793, fontFamily: 'iconfont', matchTextDirection: true);
//
//   // fenxiang ??????
//   static const IconData fenxiang =
//       const IconData(0xe794, fontFamily: 'iconfont', matchTextDirection: true);
//
//   // mima ??????
//   static const IconData mima =
//       const IconData(0xe795, fontFamily: 'iconfont', matchTextDirection: true);
//
//   // kabao ??????
//   static const IconData kabao =
//       const IconData(0xe796, fontFamily: 'iconfont', matchTextDirection: true);
//
//   // dingwei ??????
//   static const IconData dingwei =
//       const IconData(0xe797, fontFamily: 'iconfont', matchTextDirection: true);
//
//   // dianpu ??????
//   static const IconData dianpu =
//       const IconData(0xe798, fontFamily: 'iconfont', matchTextDirection: true);
//
//   // huodong ??????
//   static const IconData huodong =
//       const IconData(0xe799, fontFamily: 'iconfont', matchTextDirection: true);
// }
