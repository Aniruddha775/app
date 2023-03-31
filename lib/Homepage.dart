import 'package:flutter/material.dart';
import 'package:cloud_firestore/cloud_firestore.dart';

class Homepage extends StatefulWidget {
  const Homepage({Key? key}) : super(key: key);

  @override
  State<Homepage> createState() => _HomepageState();
}

class _HomepageState extends State<Homepage> {
  dynamic _counter = 25;
  dynamic _ph = 7.5;
  bool isVisible = true;
  void _incrementCounter() {
    if (_counter >= 0 && _counter < 100 && _counter != _ph) {
      setState(() {
        _counter++;
      });
    }
    ;
  }

  void _decrementCounter() {
    if (_counter > 15 && _counter != _ph) {
      setState(() {
        _counter--;
      });
    }
    ;
  }

  void _pH() {
    setState(() {
      _counter = _ph;
      isVisible = false;
    });
  }

  void _temperature() {
    setState(() {
      _counter = 25;
      isVisible = true;
    });
  }

  final databaseRef = FirebaseDatabase.instance.ref('Data');
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Column(
        children: [
          AppBar(
            title: Text("Temperature"),
          ),
          Container(
            padding: EdgeInsets.fromLTRB(0, 60, 0, 0),
            child: Column(
              //mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Text(
                  '$_counter',
                  style: TextStyle(
                    fontSize: 48.0,
                    fontWeight: FontWeight.bold,
                  ),
                ),
                SizedBox(height: 16.0),
                Visibility(
                  visible: isVisible,
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      ElevatedButton(
                        onPressed: _decrementCounter,
                        child: Text('-'),
                      ),
                      SizedBox(width: 16.0),
                      ElevatedButton(
                        onPressed: _incrementCounter,
                        child: Text('+'),
                      ),
                    ],
                  ),
                ),
                ElevatedButton(
                  onPressed: _pH,
                  child: Text("pH"),
                ),
                ElevatedButton(
                  onPressed: _temperature,
                  child: Text("Temperature"),
                ),
                SizedBox(
                  height: 100,
                ),
                ElevatedButton(
                  onPressed: () {},
                  child: Text("Start"),
                ),
                ElevatedButton(
                    onPressed: () {},
                    child: FirebaseAnimatedList(
                        queue: databaseRef,
                        itemBuilder: (context, snapshot, animation, index) {
                          return Column(
                            children: [
                              ListTile(
                                title: Text(snapshot
                                    .child('latitude')
                                    .value
                                    .toString()),
                              ),
                              ListTile(
                                  title: Text(snapshot
                                      .child('longitude')
                                      .value
                                      .toString())),
                            ],
                          );
                        })),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
