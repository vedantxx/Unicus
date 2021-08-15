import 'dart:io';

import 'package:flutter/material.dart';
import 'package:image_gallery_saver/image_gallery_saver.dart';
import 'package:dio/dio.dart';
import 'package:permission_handler/permission_handler.dart';
import 'dart:typed_data';
// import 'package:rflutter_alert/rflutter_alert.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:video_player/video_player.dart';

class VideoView extends StatefulWidget {
  // final String imgUrl;
  final String videoUrl;
  VideoView({
    // @required this.imgUrl,
    @required this.videoUrl});

  @override
  _VideoViewState createState() => _VideoViewState();
}


class _VideoViewState extends State<VideoView> {
  var filePath;
  FToast fToast;
  VideoPlayerController _controller;
  Future<void> _initializeVideoPlayerFuture;

  @override
  void initState() {
    super.initState();
    fToast = FToast();
    fToast.init(context);
    _controller = VideoPlayerController.network(
      // 'https://flutter.github.io/assets-for-api-docs/assets/videos/butterfly.mp4',
      widget.videoUrl,
    );

    _initializeVideoPlayerFuture = _controller.initialize();
  }
  @override
  void dispose() {
    // Ensure disposing of the VideoPlayerController to free up resources.
    _controller.dispose();

    super.dispose();
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

    return Scaffold(
      // body: Stack(
      //   children: <Widget>[
      //     Hero(
      //       tag: widget.videoUrl,
      //       child: Container(
      //           height: MediaQuery.of(context).size.height,
      //           width: MediaQuery.of(context).size.width,
      //           child: Image.network(widget.videoUrl, fit: BoxFit.cover,)
      //       ),
      //     ),
      //     Container(
      //       height: MediaQuery.of(context).size.height,
      //       width: MediaQuery.of(context).size.width,
      //       alignment: Alignment.bottomCenter,
      //       child: Column(
      //         mainAxisAlignment: MainAxisAlignment.end,
      //         children: <Widget>[
      //           GestureDetector(
      //             onTap: (){
      //               showSimpleAlert();
      //               // _save();
      //               // Navigator.pop(context);
      //             },
      //             child: Stack(
      //               children: <Widget>[
      //                 Container(
      //                   height: 50,
      //                   decoration: BoxDecoration(
      //                     borderRadius: BorderRadius.circular(30),
      //                     color: Color(0xff1C1B1B).withOpacity(0.8),
      //                   ),
      //                   width: MediaQuery.of(context).size.width/2,
      //
      //
      //                 ),
      //                 Container(
      //                   height: 50,
      //                   width: MediaQuery.of(context).size.width/2,
      //                   padding: EdgeInsets.symmetric(horizontal: 8,vertical: 8),
      //                   decoration: BoxDecoration(
      //                       border: Border.all(color: Colors.white54, width: 1),
      //                       borderRadius: BorderRadius.circular(30),
      //                       gradient: LinearGradient(
      //                           colors: [
      //                             Color(0x36FFFFFF),
      //                             Color(0x0FFFFFFF),
      //                           ]
      //                       )
      //                   ),
      //                   child: Column(
      //                     children: <Widget>[
      //                       Text("Download" , style:  TextStyle(
      //                         fontSize: 16,
      //                         color: Colors.white70,
      //                       ),
      //
      //                       ),
      //                       Text("Image will be saved in the gallery",
      //                         style:  TextStyle(
      //                           fontSize: 10,
      //                           color: Colors.white70,
      //                         ),
      //                       )
      //                     ],
      //                   ),
      //                 )
      //               ],
      //             ),
      //           ),
      //           SizedBox(
      //             height: 16,
      //           ),
      //           GestureDetector(
      //             onTap: (){
      //               Navigator.pop(context);
      //             },
      //             child: Text("Back",
      //               style: TextStyle(
      //                   color: Colors.white),
      //             ),
      //           ),
      //           SizedBox(
      //             height: 50,
      //           ),
      //         ],
      //       ),
      //     )
      //   ],
      // ),
      body: FutureBuilder(
        future: _initializeVideoPlayerFuture,
        builder: (context, snapshot) {
          if (snapshot.connectionState == ConnectionState.done) {
            // If the VideoPlayerController has finished initialization, use
            // the data it provides to limit the aspect ratio of the video.
            return AspectRatio(
              aspectRatio: _controller.value.aspectRatio,
              // Use the VideoPlayer widget to display the video.
              child: VideoPlayer(_controller),
            );
          } else {
            // If the VideoPlayerController is still initializing, show a
            // loading spinner.
            return Center(child: CircularProgressIndicator());
          }
        },
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: () {
          // Wrap the play or pause in a call to `setState`. This ensures the
          // correct icon is shown.
          setState(() {
            // If the video is playing, pause it.
            if (_controller.value.isPlaying) {
              _controller.pause();
            } else {
              // If the video is paused, play it.
              _controller.play();
            }
          });
        },
        // Display the correct icon depending on the state of the player.
        child: Icon(
          _controller.value.isPlaying ? Icons.pause : Icons.play_arrow,
        ),
      ), // This trailing comma makes auto-formatting nicer for build methods.
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
          Text("Downloaded"),
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
        widget.videoUrl,
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


