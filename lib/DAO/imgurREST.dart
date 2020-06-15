import 'package:imgur/imgur.dart' as imgur;


class imgurAPI{
// Client_id : d690f59a4a3e69e
// Client secret: 17ef771a862e57aa8c391b158dd887d6934f5f50

final String accessToken = 'b33d6c7f46b12a18210f1462f044f79d955984cd';
String _lastImageLink;

    Future<String> main(String imgPath) async {
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
      return imageLink;
    }
    else{
      return null;
    }
  }

  String getLastImageLink(){
      return _lastImageLink;
  }

}