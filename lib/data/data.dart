import 'package:unicus/model/categories_model.dart';

String apiKey = "563492ad6f91700001000001b759ae51e96046c6b8679eee8f46e2cd";

List<CategoriesModel> getCategories(){

  List<CategoriesModel> categories = new List();
  CategoriesModel categoriesModel = new CategoriesModel();

  categoriesModel.imgUrl = "https://images.pexels.com/photos/545008/pexels-photo-545008.jpeg";
  categoriesModel.categoriesName = "Street Art";
  categories.add(categoriesModel);
  categoriesModel = new CategoriesModel();

  categoriesModel.imgUrl = "https://images.pexels.com/photos/704320/pexels-photo-704320.jpeg";
  categoriesModel.categoriesName = "Wild life";
  categories.add(categoriesModel);
  categoriesModel = new CategoriesModel();

  categoriesModel.imgUrl = "https://images.pexels.com/photos/547115/pexels-photo-547115.jpeg";
  categoriesModel.categoriesName = "Nature";
  categories.add(categoriesModel);
  categoriesModel = new CategoriesModel();

  categoriesModel.imgUrl = "https://images.pexels.com/photos/466685/pexels-photo-466685.jpeg";
  categoriesModel.categoriesName = "City";
  categories.add(categoriesModel);
  categoriesModel = new CategoriesModel();

  categoriesModel.imgUrl = "https://images.pexels.com/photos/1434819/pexels-photo-1434819.jpeg";
  categoriesModel.categoriesName = "Motivation";
  categories.add(categoriesModel);
  categoriesModel = new CategoriesModel();

  categoriesModel.imgUrl = "https://images.pexels.com/photos/2116475/pexels-photo-2116475.jpeg";
  categoriesModel.categoriesName = "Bikes";
  categories.add(categoriesModel);
  categoriesModel = new CategoriesModel();

  categoriesModel.imgUrl = "https://images.pexels.com/photos/1149137/pexels-photo-1149137.jpeg";
  categoriesModel.categoriesName = "Cars";
  categories.add(categoriesModel);
  categoriesModel = new CategoriesModel();

  categoriesModel.imgUrl = "https://images.pexels.com/photos/4614845/pexels-photo-4614845.jpeg";
  categoriesModel.categoriesName = "Fashion";
  categories.add(categoriesModel);
  categoriesModel = new CategoriesModel();

  return categories;

}