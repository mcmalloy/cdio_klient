import 'package:cdioklient/DAO/imgurREST.dart';
import 'package:flutter/material.dart';

class SolitairePage extends StatefulWidget {
  @override
  _SolitairePageState createState() => _SolitairePageState();
}

class _SolitairePageState extends State<SolitairePage> {
  imgurAPI backend = new imgurAPI();
  static String messages = "";
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
            SizedBox(height: 50,),
            Container(
              height: 20,
              child: SingleChildScrollView(
                child: Text(messages),
              ),
            ),
            SizedBox(height: 25,),
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
  void updateMessages(){
    messages += backend.getLastImageLink()+"\n";
    print("messages: "+messages);
  }
}
