import 'package:flutter/material.dart';

class SolitairePage extends StatefulWidget {
  @override
  _SolitairePageState createState() => _SolitairePageState();
}

class _SolitairePageState extends State<SolitairePage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
            SizedBox(height: 50,),
            RaisedButton(
              onPressed: (){
                Navigator.pushNamed(context, 'Camera Screen');
              },
              child: Text('Tag billede af spillet'),
              color: Colors.blue,
            )
          ],
        ),
      )
    );
  }
}
