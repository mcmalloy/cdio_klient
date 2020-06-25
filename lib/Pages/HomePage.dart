import 'package:cdioklient/DAO/imgurREST.dart';
import 'package:cdioklient/Pages/CameraPage.dart';
import 'package:flutter/material.dart';

import 'SolitairePage.dart';

class Home extends StatefulWidget {
  @override
  _HomeState createState() => _HomeState();
}

class _HomeState extends State<Home> {
  imgurAPI api = new imgurAPI();

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
              onPressed: () {
                api.setGameStatus(true);
                Navigator.push(context,
                    MaterialPageRoute(builder: (context)=> SolitairePage(null,true)));
                //Navigator.pushNamed(context, 'Game Screen');
              },
              child: Text('Nyt Spil'),
              color: Colors.blue,
            ),
            RaisedButton(
              onPressed: () {
                api.setGameStatus(false);
                Navigator.push(context,
                    MaterialPageRoute(builder: (context)=> SolitairePage(null,false))
                );
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
