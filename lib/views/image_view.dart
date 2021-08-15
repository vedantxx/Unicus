import 'dart:io';

import 'package:flutter/material.dart';
import 'package:image_gallery_saver/image_gallery_saver.dart';
import 'package:dio/dio.dart';
import 'package:permission_handler/permission_handler.dart';
import 'dart:typed_data';
// import 'package:rflutter_alert/rflutter_alert.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:unicus/model/media_model.dart';

class ImageView extends StatefulWidget {
  final String imgUrl;
  ImageView({@required this.imgUrl});

  @override
  _ImageViewState createState() => _ImageViewState();
}


class _ImageViewState extends State<ImageView> {
  var filePath;
  FToast fToast;
  List<MediaModel> mediasFavsImgV = new List<MediaModel>();
  MediaModel mediaModel = new MediaModel();

  @override
  void initState() {
    super.initState();
    fToast = FToast();
    fToast.init(context);
  }

  @override
  Widget build(BuildContext context) {
    showSimpleAlert(){
      showDialog(

        context: context,
        builder: (BuildContext context) {
          return AlertDialog(

            backgroundColor: Colors.grey.withOpacity(0.5),

            title: new Text("Download", style: TextStyle(color: Colors.white),),

            content: new Text("Are you sure you wanna download?", style: TextStyle(color: Colors.white),),
            actions: <Widget>[
              // Container(
              //   color: Colors.blue,
              //   alignment: Alignment.topRight,
              //   child: new IconButton(
              //       icon: const Icon(Icons.ac_unit_outlined),
              //       // color: Colors.blue,
              //       alignment: Alignment.topRight,
              //       onPressed: (){
              //     Navigator.of(context).pop();
              //   }),
              // ),
              new TextButton(
                  onPressed: (){
                    _save();
                    _showToast();
                    // _showToast(context);
                  }, child: new Text("Download now", style: TextStyle(color: Colors.black87),)),
              new TextButton(
                // color: Colors.green[200],
                child: new Text("Back", style: TextStyle(color: Colors.black),),
                onPressed: () {
                  Navigator.of(context).pop();
                },
              ),
            ],
          );
        },
      );
    }
    @override
    Widget build(BuildContext context, State state) {
      mediasFavsImgV.add(mediaModel);
    }

    return Scaffold(
      body: Stack(
        children: <Widget>[
          Hero(
            tag: widget.imgUrl,
            child: Container(
                height: MediaQuery.of(context).size.height,
                width: MediaQuery.of(context).size.width,
                child: Image.network(widget.imgUrl, fit: BoxFit.cover,)
            ),
          ),
          Container(
            height: MediaQuery.of(context).size.height,
            width: MediaQuery.of(context).size.width,
            alignment: Alignment.bottomCenter,
            child: Column(
              mainAxisAlignment: MainAxisAlignment.end,
              children: <Widget>[
                GestureDetector(
                  onTap: (){
                    showSimpleAlert();
                    // _save();
                    // Navigator.pop(context);
                  },
                  child: Stack(
                    children: <Widget>[
                      Container(
                        height: 50,
                        decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(30),
                          color: Color(0xff1C1B1B).withOpacity(0.8),
                        ),
                        width: MediaQuery.of(context).size.width/2,


                      ),
                      Container(
                        height: 50,
                        width: MediaQuery.of(context).size.width/2,
                        padding: EdgeInsets.symmetric(horizontal: 8,vertical: 8),
                        decoration: BoxDecoration(
                            border: Border.all(color: Colors.white54, width: 1),
                            borderRadius: BorderRadius.circular(30),
                            gradient: LinearGradient(
                                colors: [
                                  Color(0x36FFFFFF),
                                  Color(0x0FFFFFFF),
                                ]
                            )
                        ),
                        child: Column(
                          children: <Widget>[
                            Text("Download" , style:  TextStyle(
                              fontSize: 16,
                              color: Colors.white70,
                            ),

                            ),
                            Text("Image will be saved in the gallery",
                              style:  TextStyle(
                                fontSize: 10,
                                color: Colors.white70,
                              ),
                            )
                          ],
                        ),
                      )
                    ],
                  ),
                ),
                SizedBox(
                  height: 16,
                ),
                GestureDetector(
                  onTap: (){
                    Navigator.pop(context);
                  },
                  child: Text("Back",
                    style: TextStyle(
                      fontSize: 20,
                      color: Colors.white),
                  ),
                ),
                SizedBox(
                  height: 50,
                ),
                // Container(
                //   child: Row(
                //     children: <Widget> [
                //       IconButton(
                //           icon: Icon(Icons.favorite_border),
                //           onPressed: (){
                //             mediasFavsImgV.add(mediaModel);
                //
                //             icon: Icon(Icons.favorite);
                //           })
                //     ],
                //   ),
                // ),
                // SizedBox(
                //   height: 50,
                // ),
              ],
            ),
          )
        ],
      ),
    );

  }


  _showToast() {
    Widget toast = Container(
      padding: const EdgeInsets.symmetric(horizontal: 24.0, vertical: 12.0),
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(25.0),
        color: Colors.greenAccent,
      ),
      child: Row(
        mainAxisSize: MainAxisSize.min,
        children: [
          Icon(Icons.check),
          SizedBox(
            width: 12.0,
          ),
          Text("Downloaded Successfully !!!"),
        ],
      ),
    );


    fToast.showToast(
      child: toast,
      gravity: ToastGravity.BOTTOM,
      toastDuration: Duration(seconds: 2),
    );

    // Custom Toast Position
    // fToast.showToast(
    //     child: toast,
    //     toastDuration: Duration(seconds: 2),
    //     positionedToastBuilder: (context, child) {
    //       return Positioned(
    //         child: child,
    //         top: 16.0,
    //         left: 16.0,
    //       );
    //     });
  }

  // void _showToast(BuildContext context) {
  //   final scaffold = Scaffold.of(context);
  //   scaffold.showSnackBar(
  //     SnackBar(
  //       content: const Text('Added to favorite'),
  //       action: SnackBarAction(
  //           label: 'UNDO', onPressed: scaffold.hideCurrentSnackBar),
  //     ),
  //   );
  // }

  _save()async {
    if(Platform.isAndroid){
      await _askPermission();
    }
    var response = await Dio().get(
        widget.imgUrl,
        options: Options(responseType: ResponseType.bytes));
    final result = await ImageGallerySaver.saveImage(
        Uint8List.fromList(response.data));
    print(result);
    Navigator.pop(context);
  }

  _askPermission() async {
    if (Platform.isIOS){
      Map<PermissionGroup,PermissionStatus> permissions
      = await PermissionHandler().requestPermissions([PermissionGroup.photos]);
    }
    else {
      PermissionStatus permissionStatus =
      await PermissionHandler().checkPermissionStatus(PermissionGroup.storage);
    }
  }


}




