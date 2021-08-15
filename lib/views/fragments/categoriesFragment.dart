import 'package:flutter/material.dart';
import 'package:unicus/data/data.dart';
import 'package:unicus/model/categories_model.dart';
import 'package:unicus/model/media_model.dart';
import 'package:unicus/views/categorie.dart';
import 'package:unicus/views/home.dart';
import 'package:unicus/widgets/widget.dart';
import 'package:unicus/widgets/widget.dart';

class CategoriesFragment extends StatefulWidget {
  @override
  _CategoriesFragmentState createState() => _CategoriesFragmentState();
}

class _CategoriesFragmentState extends State<CategoriesFragment> {


  List<MediaModel> medias = new List();

  List<CategoriesModel> categories = new List();
  @override
  void initState() {
    // TODO: implement initState
    categories = getCategories();
    super.initState();
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

      body: new
      // Center(
      //   child: new Text("This is the categories fragment"),
      // )
      SingleChildScrollView(
          child: Container(
            child: Column(
              children: <Widget>[

            Container(
            // height: 80,
            child: Center(
              child: GridView.builder(
                  padding: EdgeInsets.symmetric(horizontal: 24),
                  itemCount: categories.length,

                  gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                    crossAxisCount: 2,

                    // mainAxisSpacing: 40,
                    // crossAxisSpacing: 50,
                  ),
                  shrinkWrap: true,
                  scrollDirection: Axis.vertical,
                  itemBuilder: (context, index){

                    return CategoriesTile2(
                      title: categories[index].categoriesName,
                      imgUrl: categories[index].imgUrl,
                    );
                  }),
            )),
              mediasList(medias: medias, context: context)
              ]
          )),


      )
    );
  }

}

class CategoriesTile2 extends StatelessWidget {

  final String imgUrl, title;

  CategoriesTile2({@required this.title, @required this.imgUrl});

  @override
  Widget build(BuildContext context) {
    return Center(
      child: GestureDetector(
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
          // margin: EdgeInsets.only(right: 8),
          child: Stack(
            children: <Widget>[
              ClipOval(
                  // borderRadius: BorderRadius.circular(8),
                  child: Image.network(
                    imgUrl,
                    height: 125, width: 125,
                    fit: BoxFit.cover,)
              ),
              ClipOval(
                child: Container(

                  decoration: BoxDecoration(
                    color: Colors.black26,
                    borderRadius: BorderRadius.circular(8),
                  ),
                  alignment: Alignment.center,
                  height: 125,
                  width: 125,
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

