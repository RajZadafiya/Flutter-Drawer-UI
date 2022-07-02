import 'package:flutter/material.dart';

class FirstPage extends StatelessWidget {

  String title = "";

  FirstPage(this.title);
  @override
  Widget build(BuildContext context) {
    return new Scaffold(
      appBar: new AppBar(
        title: new Text(title),
      ),
      body: new Center(
        child: new Text(title),

      ),
    );
  }
}
