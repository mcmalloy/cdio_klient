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

  PreviewScreen({this.imgPath});

  @override
  _PreviewScreenState createState() => _PreviewScreenState();

}
class _PreviewScreenState extends State<PreviewScreen>{
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
                        _messageList = await dao.postImageToImgur(widget.imgPath);
                        animateButton();
                      }
                      else if(_state == 2){
                        if(_messageList.isNotEmpty){
                          Navigator.push(
                            context,
                            MaterialPageRoute(builder: (context) => SolitairePage(_messageList)),);
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

    Timer(Duration(milliseconds: 3300), () {
      setState(() {
        _state = 2;
      });
    });
  }
}