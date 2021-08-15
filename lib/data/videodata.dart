import 'package:unicus/model/video_categories_model.dart';

String apiKey = "563492ad6f91700001000001b759ae51e96046c6b8679eee8f46e2cd";

List<VideoCategoriesModel> getVideoCategories(){

  List<VideoCategoriesModel> videoCategories = new List();
  VideoCategoriesModel videoCategoriesModel = new VideoCategoriesModel();

  videoCategoriesModel.imgUrl = "https://images.pexels.com/videos/5561490/free-video-5561490.jpg?fit=crop&w=1200&h=630&auto=compress&cs=tinysrgb";
  videoCategoriesModel.videoUrl = "https://www.pexels.com/video/5561490/";
  videoCategoriesModel.categoriesName = "Street Art";
  videoCategories.add(videoCategoriesModel);
  videoCategoriesModel = new VideoCategoriesModel();

  videoCategoriesModel.imgUrl = "https://images.pexels.com/videos/3765078/free-video-3765078.jpg?fit=crop&w=1200&h=630&auto=compress&cs=tinysrgb";
  videoCategoriesModel.videoUrl = "https://www.pexels.com/video/3765078/";
  videoCategoriesModel.categoriesName = "Wild life";
  videoCategories.add(videoCategoriesModel);
  videoCategoriesModel = new VideoCategoriesModel();

  videoCategoriesModel.imgUrl = "https://images.pexels.com/videos/1321208/free-video-1321208.jpg?fit=crop&w=1200&h=630&auto=compress&cs=tinysrgb";
  videoCategoriesModel.videoUrl = "https://www.pexels.com/video/1321208/";
  videoCategoriesModel.categoriesName = "Nature";
  videoCategories.add(videoCategoriesModel);
  videoCategoriesModel = new VideoCategoriesModel();

  videoCategoriesModel.imgUrl = "https://images.pexels.com/videos/3320517/free-video-3320517.jpg?fit=crop&w=1200&h=630&auto=compress&cs=tinysrgb";
  videoCategoriesModel.videoUrl = "https://www.pexels.com/video/3320517/";
  videoCategoriesModel.categoriesName = "City";
  videoCategories.add(videoCategoriesModel);
  videoCategoriesModel = new VideoCategoriesModel();

  videoCategoriesModel.imgUrl = "https://images.pexels.com/videos/3831853/free-video-3831853.jpg?fit=crop&w=1200&h=630&auto=compress&cs=tinysrgb";
  videoCategoriesModel.videoUrl = "https://www.pexels.com/video/3831853/";
  videoCategoriesModel.categoriesName = "Motivation";
  videoCategories.add(videoCategoriesModel);
  videoCategoriesModel = new VideoCategoriesModel();

  videoCategoriesModel.imgUrl = "https://images.pexels.com/videos/3055287/free-video-3055287.jpg?fit=crop&w=1200&h=630&auto=compress&cs=tinysrgb";
  videoCategoriesModel.videoUrl = "https://www.pexels.com/video/3055287/";
  videoCategoriesModel.categoriesName = "Bikes";
  videoCategories.add(videoCategoriesModel);
  videoCategoriesModel = new VideoCategoriesModel();

  videoCategoriesModel.imgUrl = "https://images.pexels.com/videos/5951267/free-video-5951267.jpg?fit=crop&w=1200&h=630&auto=compress&cs=tinysrgb";
  videoCategoriesModel.videoUrl = "https://www.pexels.com/video/5951267/";
  videoCategoriesModel.categoriesName = "Cars";
  videoCategories.add(videoCategoriesModel);
  videoCategoriesModel = new VideoCategoriesModel();

  videoCategoriesModel.imgUrl = "https://images.pexels.com/videos/3888252/free-video-3888252.jpg?fit=crop&w=1200&h=630&auto=compress&cs=tinysrgb";
  videoCategoriesModel.videoUrl = "https://www.pexels.com/video/3888252/";
  videoCategoriesModel.categoriesName = "Fashion";
  videoCategories.add(videoCategoriesModel);
  videoCategoriesModel = new VideoCategoriesModel();

  return videoCategories;

}