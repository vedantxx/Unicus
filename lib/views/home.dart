import 'dart:convert';
// import 'dart:io';
// import 'dart:typed_data';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:unicus/data/data.dart';
import 'package:unicus/model/categories_model.dart';
import 'package:unicus/model/media_model.dart';
import 'package:unicus/model/video_categories_model.dart';
import 'package:unicus/model/video_media_model.dart';
import 'package:unicus/views/categorie.dart';
import 'package:unicus/views/image_view.dart';
// import 'package:unicus/views/image_view.dart';
import 'package:unicus/views/search.dart';
import 'package:unicus/views/video_categorie.dart';
import 'package:unicus/widgets/widget.dart';
import 'package:scroll_snap_list/scroll_snap_list.dart';
// import 'package:unicus/views/fragments/categoriesFragment.dart';
import 'package:http/http.dart' as http;
// import 'package:flutter_staggered_grid_view/flutter_staggered_grid_view.dart';



class Home extends StatefulWidget {

  final String searchQuery2;

  Home({Key key, this.searchQuery2});
  // Search({this.searchQuery2});
  @override
  _HomeState createState() => _HomeState();



}

class _HomeState extends State<Home> {
  List<CategoriesModel> categories = new List();
  List<VideoCategoriesModel> videoCategories = new List();
  List<MediaModel> medias = new List();
  List<MediaModel> medias3 = new List();
  List<VideoMediaModel> medias2 = new List();
  TextEditingController searchController = new TextEditingController();
  int _focusedIndex = 0;
  // PageController _pageController;




  getSearchMedia2() async{
    Uri uri = Uri.parse('https://api.pexels.com/v1/search?query=trending&per_page=15&page=1');
    var response = await http.get(uri,
        headers: {
          "Authorization" : apiKey
        });
    // print(response.body.toString());
    Map<String,dynamic> jsonData = jsonDecode(response.body);

    jsonData["photos"].forEach((element){
      // print(element);
      MediaModel mediaModel = new MediaModel();
      mediaModel = MediaModel.fromMap(element);
      medias3.add(mediaModel);
    });

    setState(() {});

  }

  Widget _horizontalListWheelScrollView (BuildContext context,int index){
    if(index == categories.length){
      return Center(
        child: CircularProgressIndicator(),
      );
    }
    return Container(
      width: 150,
      child: Column(
        children: [
          Container(
            width: 150,
            height: 200,
            child: Center(
              child: CategoriesTile(
              // child: CategoriesTile5(
              //   title: videoCategories[index].categoriesName,
              //   imgUrl: videoCategories[index].imgUrl,
              //   videoUrl: videoCategories[index].videoUrl,
                title: categories[index].categoriesName,
                imgUrl: categories[index].imgUrl,



              ),
              // child: mediasList5(
              //   medias2: medias3,context: context,
              // ),
              // child: Image.network(
              //   medias3, height: 175, width: 250, fit: BoxFit.cover,
              // ),

            ),
          ),
        ],
      ),
    );
  }


  getTrendingMedia() async{
    Uri uri = Uri.parse('https://api.pexels.com/v1/curated?per_page=64&page=1');
    var response = await http.get(uri,
    headers: {
      "Authorization" : apiKey
    });
    // print(response.body.toString());
    Map<String,dynamic> jsonData = jsonDecode(response.body);

    jsonData["photos"].forEach((element){
      // print(element);
       MediaModel mediaModel = new MediaModel();
       mediaModel = MediaModel.fromMap(element);
       medias.add(mediaModel);
    });

    setState(() {});

  }

  @override
  void initState() {
    //implement initState
    // getSearchMedia2();
    getTrendingMedia();
    getSearchMedia2();
    categories = getCategories();
    // _pageController = PageController();
    // for (int i = 0; i < 30; i++) {
    //   categories.add(Random().ne(100) + 1);
    // }

    super.initState();
  }
  // @override
  // void dispose() {
  //   _pageController.dispose();
  //   super.dispose();
  // }
  void _onItemFocus(int index) {
    setState(() {
      _focusedIndex = index;
    });
  }



  @override
  Widget build(BuildContext context) {



    return Scaffold(
      backgroundColor: Colors.white,
      appBar: AppBar(
        centerTitle: true,
        title: brandName(),
        elevation: 0.0,
      ),



      body: SingleChildScrollView(
        child: Container(
          child: Column(
          children: <Widget>[
            Container(
              decoration: BoxDecoration(
                color: Color(0xfff5f8fd),
                borderRadius: BorderRadius.circular(30),
              ),
              padding: EdgeInsets.symmetric(horizontal: 24),
              margin: EdgeInsets.symmetric(horizontal: 24),
              child: Row(
                children: <Widget> [
                Expanded(
                  child: TextField(
                    controller: searchController,
                    decoration: InputDecoration(
                      hintText: "search",
                      border: InputBorder.none,
                    ),
                  ),
                ),
                InkWell(
                  onTap: (){
                    Navigator.push(context, MaterialPageRoute(
                      builder: (context) => Search(
                        searchQuery: searchController.text,
                      ),
                    )
                    );
                  },
                    child: Container(
                        child: Icon(
                            Icons.search
                        )
                    )
                )
              ],),
            ),
            SizedBox(
              height: 8,
            ),
            Container(
              child: Text(
                'Categories',
                style: TextStyle(
                  color: Colors.black,
                  fontSize: 8,
                ),
              ),
            ),
            SizedBox(
              height: 8,
            ),
            Container(
              height: 200,
              // child: ListView.builder(
              //     padding: EdgeInsets.symmetric(horizontal: 24),
              // itemCount: categories.length,
              // shrinkWrap: true,
              // scrollDirection: Axis.horizontal,
              //
              // itemBuilder: (context, index){
              //   return CategoriesTile(
              //     title: categories[index].categoriesName,
              //     imgUrl: categories[index].imgUrl,
              //   );
              // }),
              child: Flex(
                direction: Axis.vertical,


                children: [
                  Expanded(

                    child: ScrollSnapList(
                      itemBuilder: _horizontalListWheelScrollView,
                      itemSize: 150,

                      dynamicItemSize: true,
                      itemCount: categories.length,
                      onItemFocus: _onItemFocus,

                    ),
                  ),
                ],
              ),
            ),

            SizedBox(
              height: 8,
            ),

            Container(
              child: Text(
                'Latest',
                style: TextStyle(
                  color: Colors.black,
                  fontSize: 8,
                ),
              ),
            ),
            SizedBox(
              height: 12,
            ),
            Container(
              height: 120,
              child: ListView.builder(
                  padding: EdgeInsets.symmetric(horizontal: 24),
              itemCount: categories.length,
              shrinkWrap: true,
              scrollDirection: Axis.horizontal,

              itemBuilder: (context, index){
                return CategoriesTile3(
                  title: categories[index].categoriesName,
                  imgUrl: categories[index].imgUrl,
                );
              }),
            ),
            SizedBox(
              height: 12,
            ),
            Container(
              child: Text(
                'Curated',
                style: TextStyle(
                  color: Colors.black,
                  fontSize: 8,
                ),
              ),
            ),
            SizedBox(
              height: 16,
            ),

            mediasList(medias: medias, context: context),
          ],

        ),
        ),

      ),
    );
  }
}
class CategoriesTile extends StatelessWidget {

  final String imgUrl, title;

  CategoriesTile({@required this.title, @required this.imgUrl});

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () {
        Navigator.push(
            context, MaterialPageRoute(
          builder: (context) =>
              Categories(
                categorieName: title.toLowerCase(),
              ),
        )
        );
      },
      child: Container(
        margin: EdgeInsets.only(right: 8),
        child: Stack(
          children: <Widget>[
            ClipRRect(
                borderRadius: BorderRadius.circular(8),
                child: Image.network(
                  imgUrl, height: 175, width: 250, fit: BoxFit.cover,)
            ),
            Container(

              decoration: BoxDecoration(
                color: Colors.black26,
                borderRadius: BorderRadius.circular(8),
              ),
              alignment: Alignment.center,
              height: 175,
              width: 250,
              child: Text(title, style: TextStyle(
                color: Colors.white,
                fontWeight: FontWeight.w500,
                fontSize: 24,
              ),
              ),
            )
          ],
        ),
      ),
    );
  }
}
class CategoriesTile3 extends StatelessWidget {

  final String imgUrl, title;
  // videoUrl;

  CategoriesTile3({@required this.title, @required this.imgUrl,
    // @required this.videoUrl
  });

  @override
  Widget build(BuildContext context) {
    return Center(
      child: GestureDetector(
        onTap: () {
          Navigator.push(
              context, MaterialPageRoute(
            builder: (context) =>
                VideoCategories(
                  categorieName: title.toLowerCase(),
                ),
          )
          );
        },
        child: Container(
          margin: EdgeInsets.only(right: 8),
          child: Stack(
            children: <Widget>[
              ClipOval(
                // borderRadius: BorderRadius.circular(8),
                  child: Image.network(
                    imgUrl,
                    height: 112, width: 112,
                    fit: BoxFit.cover,
                  )
              ),
              ClipOval(
                child: Container(

                  decoration: BoxDecoration(
                    color: Colors.black26,
                    borderRadius: BorderRadius.circular(8),
                  ),
                  alignment: Alignment.center,
                  height: 112,
                  width: 112,
                  child: Text(title, style: TextStyle(
                    color: Colors.white,
                    fontWeight: FontWeight.w500,
                    fontSize: 24,

                  ),
                  ),
                ),
              )
            ],
          ),
        ),
      ),
    );
  }
}
class CategoriesTile4 extends StatelessWidget {

  final String imgUrl;
  // title;

  CategoriesTile4({
    // @required this.title,
    @required this.imgUrl});

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () {
        Navigator.push(
            context, MaterialPageRoute(
          builder: (context) =>
              ImageView(
                imgUrl: imgUrl,
                // categorieName: title.toLowerCase(),
              ),
        )
        );
      },
      child: Container(
        margin: EdgeInsets.only(right: 8),
        child: Stack(
          children: <Widget>[
            ClipRRect(
                borderRadius: BorderRadius.circular(8),
                child: Image.network(
                  imgUrl, height: 175, width: 250, fit: BoxFit.cover,)
            ),
            // Container(
            //
            //   decoration: BoxDecoration(
            //     color: Colors.black26,
            //     borderRadius: BorderRadius.circular(8),
            //   ),
            //   alignment: Alignment.center,
            //   height: 175,
            //   width: 250,
            //   child: Text(
            //     // title,
            //     style: TextStyle(
            //     color: Colors.white,
            //     fontWeight: FontWeight.w500,
            //     fontSize: 24,
            //   ),
            //   ),
            // )
          ],
        ),
      ),
    );
  }
}
class CategoriesTile5 extends StatelessWidget {

  final String imgUrl, title, videoUrl;

  CategoriesTile5({@required this.title, @required this.imgUrl,@required this.videoUrl});

  @override
  Widget build(BuildContext context) {
    return Center(
      child: GestureDetector(
        onTap: () {
          Navigator.push(
              context, MaterialPageRoute(
            builder: (context) =>
                VideoCategories(
                  categorieName: title.toLowerCase(),
                ),
          )
          );
        },
        child: Container(
          margin: EdgeInsets.only(right: 8),
          child: Stack(
            children: <Widget>[
              ClipOval(
                // borderRadius: BorderRadius.circular(8),
                  child: Image.network(
                    imgUrl,
                    height: 112, width: 112,
                    fit: BoxFit.cover,
                  )
              ),
              ClipOval(
                child: Container(

                  decoration: BoxDecoration(
                    color: Colors.black26,
                    borderRadius: BorderRadius.circular(8),
                  ),
                  alignment: Alignment.center,
                  height: 112,
                  width: 112,
                  child: Text(title, style: TextStyle(
                    color: Colors.white,
                    fontWeight: FontWeight.w500,
                    fontSize: 24,

                  ),
                  ),
                ),
              )
            ],
          ),
        ),
      ),
    );
  }
}


