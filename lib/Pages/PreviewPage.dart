import 'dart:io';
import 'dart:typed_data';
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
                  child: RaisedButton(
                      child: Text('Upload to Solitaire Logic'),
                      color: Colors.blue,
                    onPressed: () async {
                      if(dao.main(widget.imgPath)!=null){
                          if(dao.getMessages()!=null){
                            Navigator.pushNamed(context, 'home');
                          }
                      }
                    },
                  ),
                ),
              ),
            )
          ],
        ),
      ),
    );
  }


}