import 'package:flutter/material.dart';
import 'package:unicus/model/media_model.dart';
import 'package:unicus/widgets/widget.dart';
class Favsafragment extends StatefulWidget {
  @override
  _FavsafragmentState createState() => _FavsafragmentState();
}

class _FavsafragmentState extends State<Favsafragment> {
  List<MediaModel> mediasFavs = new List<MediaModel>();
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      appBar: AppBar(
        centerTitle: true,
        title: brandName(),
        elevation: 0.0,
      ),
      body:
      // new Center(
      //   child: new Text("This is the favs fragment"),
      // ),
      SingleChildScrollView(
        child: Container(
          child: Column(
            children: [
              SizedBox(
                height: 16,
              ),
              mediasList(medias: mediasFavs,context: context),
            ],
          ),
        ),
      ),
    );
  }
}
