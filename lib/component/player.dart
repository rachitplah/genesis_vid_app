import 'package:video_player/video_player.dart';
import 'package:flutter/material.dart';
import 'package:genesis_vid_app/neeko/lib/neeko.dart';
import 'package:flutter/services.dart';


class VideoApp extends StatefulWidget {
  var datid;
  VideoApp(this.datid);
  @override
  _VideoAppState createState() => _VideoAppState();
}

class _VideoAppState extends State<VideoApp> {
  VideoPlayerController _controller;

  @override
  void initState() {
    super.initState();
    _controller = VideoPlayerController.network(
        'http://www.sample-videos.com/video123/mp4/720/big_buck_bunny_720p_20mb.mp4')
      ..initialize().then((_) {
        // Ensure the first frame is shown after the video is initialized, even before the play button has been pressed.
        setState(() {});
      });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        body: Center(
          child: _controller.value.initialized
              ? AspectRatio(
                  aspectRatio: _controller.value.aspectRatio,
                  child: VideoPlayer(_controller),
                )
              : Container(),
        ),
        floatingActionButton: FloatingActionButton(
          onPressed: () {
            setState(() {
              _controller.value.isPlaying
                  ? _controller.pause()
                  : _controller.play();
            });
          },
          child: Icon(
            _controller.value.isPlaying ? Icons.pause : Icons.play_arrow,
          ),
        ),
    );
  }

  @override
  void dispose() {
    super.dispose();
    _controller.dispose();
  }
}

class VideoPlayerScreen extends StatefulWidget {
  //VideoPlayerScreen({Key key}) : super(key: key);
  var datid;
  VideoPlayerScreen(this.datid);

  @override
  _VideoPlayerScreenState createState() => _VideoPlayerScreenState(this.datid);
}

class _VideoPlayerScreenState extends State<VideoPlayerScreen> {
  VideoPlayerController _controller;
  Future<void> _initializeVideoPlayerFuture;
  var dataid;
  _VideoPlayerScreenState(this.dataid);
  @override
  void initState() {
    // Create and store the VideoPlayerController. The VideoPlayerController
    // offers several different constructors to play videos from assets, files,
    // or the internet.
    _controller = VideoPlayerController.network(//'https://flutter.github.io/assets-for-api-docs/assets/videos/butterfly.mp4'
      dataid
       //android:usesCleartextTraffic="true" part is added to allow establish http connections in android manifest
      ,);

    // Initialize the controller and store the Future for later use.
    _initializeVideoPlayerFuture = _controller.initialize();

    // Use the controller to loop the video.
    _controller.setLooping(true);

    super.initState();
  }

  @override
  void dispose() {
    // Ensure disposing of the VideoPlayerController to free up resources.
    _controller.dispose();

    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      // Use a FutureBuilder to display a loading spinner while waiting for the
      // VideoPlayerController to finish initializing.
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
}


class NeekoP extends StatefulWidget {
  var datid;
  NeekoP(this.datid);

  @override
  NeekoPState createState() => NeekoPState(this.datid);
}

class NeekoPState extends State<NeekoP> {
  var datid;
  NeekoPState(this.datid);

// static const String beeUri = 'https://media.w3.org/2010/05/sintel/trailer.mp4';
 // static const String beeUri ='http://vfx.mtime.cn/Video/2019/03/09/mp4/190309153658147087.mp4';

//static const String beeUri = datid;

   VideoControllerWrapper videoControllerWrapper = VideoControllerWrapper(
      DataSource.network(
          'http://litebulb.in/storage/media/6be3fa8b596aa8f04f37f276e9dce493.mp4',
          //datid,
          ));
          
   
   /*
   VideoControllerWrapper(
      DataSource.network(
          //'http://vfx.mtime.cn/Video/2019/03/09/mp4/190309153658147087.mp4',
          datid,
          displayName: "displayName"));*/

  @override
  void initState() {
    super.initState();
    SystemChrome.setEnabledSystemUIOverlays([SystemUiOverlay.top]);
  }

  @override
  void dispose() {
    SystemChrome.restoreSystemUIOverlays();
    super.dispose();
  }

  

  @override
  Widget build(BuildContext context) {
  
    return Scaffold(
      body: NeekoPlayerWidget(
        onSkipNext: () {
          print("skip");
          videoControllerWrapper.prepareDataSource(DataSource.network(
              //"http://vfx.mtime.cn/Video/2019/03/12/mp4/190312083533415853.mp4",
              datid,
          ));
        },
        videoControllerWrapper: videoControllerWrapper,
        actions: <Widget>[
          IconButton(
              icon: Icon(
                Icons.share,
                color: Colors.white,
              ),
              onPressed: () {
                print("share");
              })
        ],
      ),
    );
  }
}