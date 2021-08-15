class MediaModel{
  String photographer;
  String photographer_url;
  int photographer_id;
  SrcModel src;
  MediaModel({
    this.src,
    this.photographer_id,
    this.photographer_url,
    this.photographer
  });
  factory MediaModel.fromMap(Map<String,dynamic> jsonData){
    return MediaModel(
      src: SrcModel.fromMap(jsonData["src"]),
      photographer_url: jsonData["photographer_url"],
      photographer_id: jsonData["photographer_id"],
      photographer: jsonData["photographer"],
    );
  }
}

class SrcModel{
  String original;
  String small;
  String portrait;
  SrcModel({
    this.portrait,
    this.small,
    this.original
});
  factory SrcModel.fromMap(Map<String,dynamic> jsonData){
  return SrcModel(
    portrait: jsonData["portrait"],
    original: jsonData["original"],
    small: jsonData["small"],
  );
  }
}