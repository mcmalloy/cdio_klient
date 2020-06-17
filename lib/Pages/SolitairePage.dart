import 'package:cdioklient/DAO/imgurREST.dart';
import 'package:flutter/material.dart';

class SolitairePage extends StatefulWidget {
  @override
  _SolitairePageState createState() => _SolitairePageState();
}

class _SolitairePageState extends State<SolitairePage> {
  imgurAPI backend = new imgurAPI();
  List<String> messages;
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
            FutureBuilder<List<String>>(
              future: backend.getMessages(),
              builder: (context, snapshot) {
                if (snapshot.hasData) {
                  messages = snapshot.data;
                  return listData(messages);
                } else if (snapshot.hasError) {
                  return Text("${snapshot.hasError}");
                }
                return CircularProgressIndicator();
              },
            ),
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

  Widget messageList() {
    return messages != null
        ? new ListView.builder(
            padding: const EdgeInsets.all(10.0),
            itemCount: messages.length,
            itemBuilder: (context, i) {
              return Column(
                children: <Widget>[Text(messages[i])],
              );
            },
          )
        : Center(
            child: CircularProgressIndicator(),
          );
  }
}

Widget listData(List<String> mess) {
  return ListView.separated(
    itemCount: mess.length,
    itemBuilder: (context, index) {
      return Container(
          decoration: BoxDecoration(
            //<-- BoxDecoration
            border: Border(bottom: BorderSide()),
          ),
          child: ListTile(
            title: Text(mess[index]),
          ));
    },
    separatorBuilder: (context, index) {
      return Divider();
    },
  );
}

/*
Scaffold(
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
            SizedBox(height: 40,),
            messageList(),
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
 */

/*
Container(
              height: 20,
              child: SingleChildScrollView(
                child: Text(messages),
              ),
            ),
 */
