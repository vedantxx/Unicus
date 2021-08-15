import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:unicus/data/data.dart';
import 'package:unicus/model/media_model.dart';
import 'package:http/http.dart' as http;
import 'package:unicus/model/video_media_model.dart';
import 'package:unicus/widgets/widget.dart';

class VideoCategories extends StatefulWidget {
  final String categorieName;
  VideoCategories({this.categorieName});
  @override
  _VideoCategoriesState createState() => _VideoCategoriesState();
}

class _VideoCategoriesState extends State<VideoCategories> {

  List<VideoMediaModel> medias2 = new List();

  getSearchMedia(String query) async{
    Uri uri = Uri.parse('https://api.pexels.com/v1/search?query=$query&per_page=64&page=1');
    var response = await http.get(uri,
        headers: {
          "Authorization" : apiKey
        });
    // print(response.body.toString());
    Map<String,dynamic> jsonData = jsonDecode(response.body);

    jsonData["photos"].forEach((element){
      // print(element);
      VideoMediaModel videoMediaModel = new VideoMediaModel();
      videoMediaModel = VideoMediaModel.fromMap(element);
      medias2.add(videoMediaModel);
    });

    setState(() {});

  }

  @override
  void initState() {
    //implement initState
    getSearchMedia(widget.categorieName);
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
      body: SingleChildScrollView(
        child: Container(
          child: Column(
            children: <Widget>[
              // Container(
              //   decoration: BoxDecoration(
              //     color: Color(0xfff5f8fd),
              //     borderRadius: BorderRadius.circular(30),
              //   ),
              //   padding: EdgeInsets.symmetric(horizontal: 24),
              //   margin: EdgeInsets.symmetric(horizontal: 24),
              //   child: Row(children: <Widget> [
              //     Expanded(
              //       child: TextField(
              //         controller: searchController,
              //         decoration: InputDecoration(
              //           hintText: "search",
              //           border: InputBorder.none,
              //         ),
              //       ),
              //     ),
              //     InkWell(
              //         onTap: (){
              //           getSearchMedia(searchController.text);
              //           // Navigator.push(context, MaterialPageRoute(
              //           //   builder: (context) => Search(
              //           //     searchQuery: searchController.text,
              //           //   ),
              //           // )
              //           // );
              //         },
              //         child: Container(
              //             child: Icon(
              //                 Icons.search
              //             )
              //         )
              //     )
              //   ],),
              // ),
              SizedBox(
                height: 16,
              ),
              mediasList4(medias2: medias2, context: context),
            ],
          ),
        ),
      ),
    );
  }
}
