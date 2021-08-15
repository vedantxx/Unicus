import 'package:flutter/material.dart';
import 'package:unicus/model/media_model.dart';
import 'package:unicus/model/video_media_model.dart';
import 'package:unicus/views/image_view.dart';
import 'package:flutter_staggered_grid_view/flutter_staggered_grid_view.dart';
import 'package:unicus/views/video_view.dart';
List<MediaModel> medias = new List();
List<VideoMediaModel> medias2 = new List();
Map map = Map();
// medias.map(media);


Widget brandName(){
  return RichText(
    text: TextSpan(
      style: TextStyle(fontSize: 16,fontWeight: FontWeight.w500),
      children: <TextSpan>[
        TextSpan(text: 'Uni', style: TextStyle(color: Colors.black87)),
        TextSpan(text: 'cus', style: TextStyle(color: Colors.blue)),
      ],
    ),
  );
}

Widget mediasList({List<MediaModel> medias, context}){
  return Container(
    padding: EdgeInsets.symmetric(horizontal: 16),
    child: GridView.count(
      shrinkWrap: true,
        physics: ClampingScrollPhysics(),
        crossAxisCount: 2,
      childAspectRatio: 0.6,
      mainAxisSpacing: 6.0,
      crossAxisSpacing: 6.0,
      children: medias.map((media){
        return GridTile(
            child: GestureDetector(
              onTap: (){
                Navigator.push(
                    context, MaterialPageRoute(
                    builder: (context) => ImageView(
                      imgUrl: media.src.portrait,
                    )
                )
                );
              },
              child: Hero(
                tag: media.src.portrait,
                child: Container(
          child: ClipRRect(
                borderRadius: BorderRadius.circular(16),
                child: Image.network(media.src.portrait, fit: BoxFit.cover,
                ),
          ),
        ),
              ),
            ));
      }).toList(),
    ),
  );
}

Widget mediasList2({List<MediaModel> medias, context}){
  return Container(
    padding: EdgeInsets.symmetric(horizontal: 16),
    child: new StaggeredGridView.countBuilder(
      crossAxisCount: 4,
      itemCount: 8,
      scrollDirection: Axis.vertical,
      shrinkWrap: true,
      itemBuilder: (BuildContext context, int index) => new GestureDetector(
          // color: Colors.green,
          // child: new Center(
          //   // child: new CircleAvatar(
          //   //   backgroundColor: Colors.white,
          //   //   child: new Text('$index'),
          //   // ),
          //)

        child: Flex(
          direction: Axis.vertical,
          children: <Widget> [
            Expanded(

              child: SizedBox(
                height: 200,
                width: 200,
                child: Column(

                  children: medias.map((media){

                    return GridTile(
                        child: GestureDetector(

                          onTap: (){
                            Navigator.push(
                                context, MaterialPageRoute(
                                builder: (context) => ImageView(
                                  imgUrl: media.src.portrait,
                                )
                            )
                            );
                          },
                          child: Hero(
                            tag: media.src.original,
                            child: Container(
                              child: ClipRRect(
                                borderRadius: BorderRadius.circular(16),

                                child: Image.network(
                                  media.src.original,fit: BoxFit.cover,
                                ),
                              ),
                            ),
                          ),
                        )
                        );
                  }).toList(),
                ),
              ),
            ),
          ],
        ),
      ),
      staggeredTileBuilder: (int index) =>
      new StaggeredTile.count(
        (index %  7 == 0) ? 2 : 1, (index %  7 == 0) ? 2 : 1,
      ),
      mainAxisSpacing: 8.0,
      crossAxisSpacing: 8.0,

    ),
  );
}

Widget mediasList3({List<VideoMediaModel> medias2, context}){
  return Container(
    padding: EdgeInsets.symmetric(horizontal: 16),
    child: GridView.count(
      shrinkWrap: true,
      physics: ClampingScrollPhysics(),
      crossAxisCount: 2,
      childAspectRatio: 0.6,
      mainAxisSpacing: 6.0,
      crossAxisSpacing: 6.0,
      children: medias2.map((media){
        return GridTile(
            child: GestureDetector(
              onTap: (){
                Navigator.push(
                    context, MaterialPageRoute(
                    builder: (context) => ImageView(
                      imgUrl: media.video_files.link,
                    )
                )
                );
              },
              child: Hero(
                tag: media.video_files.link,
                child: Container(
                  child: ClipRRect(
                    borderRadius: BorderRadius.circular(16),
                    child: Image.network(media.video_files.link, fit: BoxFit.cover,
                    ),
                  ),
                ),
              ),
            ));
      }).toList(),
    ),
  );
}

Widget mediasList4({List<VideoMediaModel> medias2, context}){
  return Container(
    padding: EdgeInsets.symmetric(horizontal: 16),
    child: GridView.count(
      shrinkWrap: true,
      physics: ClampingScrollPhysics(),
      crossAxisCount: 2,
      childAspectRatio: 0.6,
      mainAxisSpacing: 6.0,
      crossAxisSpacing: 6.0,
      children: medias2.map((media){
        return GridTile(
            child: GestureDetector(
              onTap: (){
                Navigator.push(
                    context, MaterialPageRoute(
                    builder: (context) => VideoView(
                      videoUrl: media.video_files.link,
                    )
                )
                );
              },
              child: Hero(
                tag: media.vdimgUrl,
                child: Container(
                  child: ClipRRect(
                    borderRadius: BorderRadius.circular(16),
                    child: Image.network(
                      media.vdimgUrl,
                      fit: BoxFit.cover,
                    ),
                  ),
                ),
              ),
            ));
      }).toList(),
    ),
  );
}

Widget mediasList5({List<MediaModel> medias2, context}){
  return Container(
    padding: EdgeInsets.symmetric(horizontal: 16),
    child: GridView.count(

      shrinkWrap: true,

      physics: ClampingScrollPhysics(),
      crossAxisCount: 1,

      scrollDirection: Axis.horizontal,
      childAspectRatio: 0.6,
      mainAxisSpacing: 6.0,
      crossAxisSpacing: 6.0,
      children: medias.map((media){
        return GridTile(

            child: GestureDetector(
              onTap: (){
                Navigator.push(
                    context, MaterialPageRoute(
                    builder: (context) => ImageView(
                      imgUrl: media.src.portrait,
                    )
                )
                );
              },
              child: Hero(
                tag: media.src.portrait,
                child: Container(
                  child: ClipRRect(
                    // borderRadius: BorderRadius.circular(16),
                    child: Image.network(media.src.portrait, fit: BoxFit.cover,
                    ),
                  ),
                ),
              ),
            ));
      }).toList(),

    ) ,
  );
}