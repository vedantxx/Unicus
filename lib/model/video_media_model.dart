class VideoMediaModel{
  // String name;
  String duration;
  String vdimgUrl;
  // int photographer_id;
  VideoFilesModel video_files;
  VideoMediaModel({
    this.video_files,
    // this.photographer_id,
    this.duration,
    this.vdimgUrl,
    // this.name
  });
  factory VideoMediaModel.fromMap(Map<String,dynamic> jsonData){
    return VideoMediaModel(
      video_files: VideoFilesModel.fromMap(jsonData["video_files"]),
      duration: jsonData["duration"],
      vdimgUrl: jsonData["image"],
      // photographer_id: jsonData["photographer_id"],
      // name: jsonData["name"],
    );
  }
}

class VideoFilesModel{
  // String sd;
  // String hd;
  // String portrait;
  String link;
  VideoFilesModel({
    // this.portrait,
    // this.hd,
    // this.sd
   this.link,
  });
  factory VideoFilesModel.fromMap(Map<String,dynamic> jsonData){
    return VideoFilesModel(
      // portrait: jsonData["portrait"],
      // sd: jsonData["sd"],
      // hd: jsonData["hd"],
      link: jsonData["link"],
    );
  }
}