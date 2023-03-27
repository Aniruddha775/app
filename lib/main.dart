import 'package:app/Homepage.dart';
import 'package:flutter/material.dart';

void main() => runApp(MyApp());
class MyApp extends StatefulWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  State<MyApp> createState() => _MyAppState();
}

class _MyAppState extends State<MyApp> {
  int _counter = 0;
  void _incrementCounter(){
    setState(() {
      _counter++;
    });
  }
  void _decrementCounter(){
    setState(() {
      _counter--;
    });
  }
  @override
  Widget build(BuildContext context) {
    return  MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'MyApp',
      home: Homepage(),
    );
  }
}
