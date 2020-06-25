import 'package:cdioklient/DAO/imgurREST.dart';
import 'package:flutter/material.dart';

import 'CameraPage.dart';

class SolitairePage extends StatefulWidget {
  List<String> lastMessage;
  bool isNewGame;
  SolitairePage(this.lastMessage, this.isNewGame);


  @override
  _SolitairePageState createState() => _SolitairePageState(lastMessage,isNewGame);
}

class _SolitairePageState extends State<SolitairePage> {
  bool isNewGame = false;
  imgurAPI backend = new imgurAPI();
  List<String> lastMessage;
  List<String> messages;

  _SolitairePageState(this.lastMessage,this.isNewGame);

  @override
  void initState() {
    super.initState();
    Future<List<String>> messageHistory = backend.getMessages();
    //messages = messageHistory;
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        body: Center(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: <Widget>[
              SizedBox(
                height: 50,
              ),
              lastMessage != null ? scrollV() : Container(
                height: 1,
                child: Text("Har ikke modtaget server response endnu"),),
              SizedBox(
                height: 25,
              ),
              RaisedButton(
                onPressed: () {
                  Navigator.push(context,
                      MaterialPageRoute(builder: (context)=> CameraScreen())
                  );
                },
                child: Text('Tag billede af spillet'),
                color: Colors.blue,
              ),
              Text("Starting new game: $isNewGame")
            ],
          ),
        )
    );
  }

  Widget scrollV(){
    return SizedBox(
      height: 500,
        child: new ListView.builder
          (
            itemCount: lastMessage.length,
            itemBuilder: (BuildContext ctxt, int Index) {
              return new Text(lastMessage[Index].toString());
            }
        )
    );

  }


}
