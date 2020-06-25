import 'dart:io';
import 'dart:typed_data';
import 'package:cdioklient/Pages/SolitairePage.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'dart:async';
import 'package:cdioklient/DAO/imgurREST.dart';
class PreviewScreen extends StatefulWidget{
  final String imgPath;
  bool isNewGame;
  PreviewScreen({this.imgPath,this.isNewGame});
  @override
  _PreviewScreenState createState() => _PreviewScreenState(isNewGame);

}
class _PreviewScreenState extends State<PreviewScreen>{
  bool isNewGame;
  _PreviewScreenState(this.isNewGame);

  List<String> _messageList;
  int _state = 0;
  imgurAPI dao = new imgurAPI();
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        automaticallyImplyLeading: true,
      ),
      body: Container(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.stretch,
          children: <Widget>[
            Expanded(
              flex: 2,
              child: Image.file(File(widget.imgPath),fit: BoxFit.cover,),
            ),
            Align(
              alignment: Alignment.bottomCenter,
              child: Container(
                width: double.infinity,
                height: 60.0,
                color: Colors.black,
                child: Center(
                  child: MaterialButton(
                      child: setUpButtonChild(),
                    onPressed: () async {
                      if(_state==0){
                        print("SENDING");
                        animateButton();
                      }
                      else if(_state == 2){
                        if(_messageList.isNotEmpty){
                          Navigator.push(
                            context,
                            MaterialPageRoute(builder: (context) => SolitairePage(_messageList,isNewGame)),);
                        }
                        else{
                          print("Kunne ikke hente besked fra Java serveren");
                        }
                      }
                    },
                    elevation: 4.0,
                    minWidth: double.infinity,
                    height: 48.0,
                    color: Colors.blueAccent,
                  ),
                ),
              ),
            )
          ],
        ),
      ),
    );
  }
  Widget setUpButtonChild() {
    if (_state == 0) {
      return new Text(
        "Upload to logic server",
        style: const TextStyle(
          color: Colors.white,
          fontSize: 16.0,
        ),
      );
    } else if (_state == 1) {
      return CircularProgressIndicator(
        valueColor: AlwaysStoppedAnimation<Color>(Colors.white),
      );
    } else {
      return Icon(Icons.check, color: Colors.white);
    }
  }
  void animateButton() {
    setState(() {
      _state = 1;
    });

    Timer(Duration(milliseconds: 3300), () async {
      // Her uploader vi imgur link til java, henter besked tilbage og samtidig viser en loading animation i 3300ms, som sikrer at vi får et objekt tilbage
      _messageList = await dao.postImageToImgur(widget.imgPath);
      setState(() {
        _state = 2;
      });
    });
  }
}