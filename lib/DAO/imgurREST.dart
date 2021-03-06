import 'package:http/http.dart';
import 'package:imgur/imgur.dart' as imgur;


class imgurAPI{
// Client_id : d690f59a4a3e69e
// Client secret: 17ef771a862e57aa8c391b158dd887d6934f5f50

final String accessToken = 'b33d6c7f46b12a18210f1462f044f79d955984cd';
String _lastImageLink;
static List<String> messages = new List<String>();
final haralduri = 'http://87.61.139.38:8081/ImageURL';
final cloudURI = 'http://35.246.214.109:3333/ImageURL?image_url=';
    Future<List<String>> postImageToImgur(String imgPath) async {
    final client = imgur.Imgur(imgur.Authentication.fromToken(accessToken));
    String imageLink;
    /// Upload an image from path
    await client.image
        .uploadImage(
        imagePath: imgPath,
        title: 'Solitaire Image',
        description: 'A description')
        .then((image) => imageLink=image.link);

    print('Uploaded image to: $imageLink');
    if(imageLink.isNotEmpty){
      _lastImageLink = imageLink;
      String response = await postRequest(_lastImageLink);
      messages.add(response);
      return messages;
    }
    else{
      return null;
    }
  }

  Future<String> postRequest(String imgurURL) async {
      final uri = 'http://192.168.1.46:8081/ImageURL?image_url=';
      
      print("Sending post to $uri?image_url="+imgurURL);
      Response response = await post(
        cloudURI+imgurURL,
      );
      print("RESPONSE FROM JAVA: "+response.body.toString());
      return response.body.toString();
  }



  String getLastImageLink(){
      return _lastImageLink;
  }

  Future<List<String>> getMessages() async{
      return messages;
  }

}