class FacebookModel {
  final String name;
  final String email;
  final String id;
  final FacebookPictureModel picture;
  FacebookModel({
    required this.name,
    required this.email,
    required this.id,
    required this.picture,
  });
  factory FacebookModel.fromjson(Map<String, dynamic> jsondata) {
    return FacebookModel(
      name: jsondata['name'],
      email: jsondata['email'],
      id: jsondata['id'],
      picture: FacebookPictureModel.fromjson(jsondata['picture']['data']),
    );
  }
}

class FacebookPictureModel {
  final String url;
  final int height;
  final int width;
  FacebookPictureModel({
    required this.url,
    required this.height,
    required this.width,
  });
  factory FacebookPictureModel.fromjson(Map<String, dynamic> jsondata) {
    return FacebookPictureModel(
      url: jsondata['url'],
      height: jsondata['height'].toInt(),
      width: jsondata['width'].toInt(),
    );
  }
}
