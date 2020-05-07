import 'dart:math';
import 'package:flutter/material.dart';

void main() => runApp(new MyApp());

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: Scaffold(
        appBar: AppBar(
          title: const Text('Hello'),
        ),
        body: SimpleWidget(),
      ),
    );
  }
}

class SimpleWidget extends StatefulWidget {
  @override
  _SimpleWidgetState createState() => _SimpleWidgetState();
}

class _SimpleWidgetState extends State<SimpleWidget> {
  Color _color = Colors.white;
  final textField = TextEditingController();
  String _name = 'There';
  bool _validate = false;
  double myOpacity = 0.0;

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () {
        setState(() {
          final random = Random();
          _color = Color.fromRGBO(
              random.nextInt(256), random.nextInt(256), random.nextInt(256), 1);
        });
      },
      child: Container(
        decoration: BoxDecoration(color: _color),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: <Widget>[
            AnimatedOpacity(
              child: FlutterLogo(
                size: 100.0,
              ),
              opacity: myOpacity,
              duration: Duration(seconds: 1),
            ),
            Text('Hey $_name'),
            TextFormField(
              controller: textField,
              autocorrect: true,
              decoration: InputDecoration(
                hintText: 'Enter Your Name',
                errorText: _validate ? 'Please enter name' : null,
              ),
            ),
            RaisedButton(
              onPressed: () {
                setState(() {
                  if ((textField.text.trim()).isEmpty) {
                    _name = _name;
                  } else {
                    _name = textField.text;
                    myOpacity = 1.0;
                  }

                  textField.text.isEmpty ? _validate = true : _validate = false;
                  textField.clear();
                });
              },
              color: Colors.indigo,
              textColor: Colors.white,
              child: Text('Click Here '),
            ),
            IconButton(
              onPressed: () {
                setState(() {
                  myOpacity = 0.0;
                  _name = 'There';
                  _color = Colors.white;
                  _validate = false;
                  textField.clear();
                });
              },
              color: Colors.indigo,
              icon: Icon(Icons.close),
            ),
          ],
        ),
      ),
    );
  }
}
