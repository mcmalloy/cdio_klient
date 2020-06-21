import 'package:cdioklient/DAO/imgurREST.dart';
import 'package:flutter/material.dart';

class SolitairePage extends StatefulWidget {
  List<String> lastMessage;

  SolitairePage(this.lastMessage);

  @override
  _SolitairePageState createState() => _SolitairePageState(lastMessage);
}

class _SolitairePageState extends State<SolitairePage> {
  imgurAPI backend = new imgurAPI();
  List<String> lastMessage;
  List<String> messages;

  _SolitairePageState(this.lastMessage);

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
