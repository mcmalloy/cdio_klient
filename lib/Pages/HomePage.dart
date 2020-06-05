import 'package:flutter/material.dart';

class Home extends StatefulWidget {
  @override
  _HomeState createState() => _HomeState();
}

class _HomeState extends State<Home> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Home Page'),
      ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
            Text('Du kan starte et nyt spil, eller fortsæt fra hvor du slap'),
            RaisedButton(
              onPressed: (){
                // TODO: GO TO CAMERA PAGE
                Navigator.pushNamed(context, 'Game Screen');
              },
              child: Text('Nyt Spil'),
              color: Colors.blue,
            ),
            RaisedButton(
              onPressed: (){
                // Continue game
              },
              child: Text('Fortsæt Spil'),
              color: Colors.blue,
            )
          ],
        ),
      ), // This trailing comma makes auto-formatting nicer for build methods.
    );
  }
}
