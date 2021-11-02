import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:video_player/video_player.dart';

import 'models/projects_home.dart';

void main() {
  runApp( MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      home:  MyHomePage(),
    );
  }
}


List<ProjectsHome> projects = [
  
  ProjectsHome(description: 'Online Post Production, in conjunction with TVF International, produced and created a four-part wildlife documentary series. Working in a remote collaboration, with filming taking place in South East Asia, the series highlighted unusual aquatic species.', title: 'Ocean Wild'),
  ProjectsHome(description: 'Online Post Production, in conjunction with TVF International, produced and created a four-part wildlife documentary series. Working in a remote collaboration, with filming taking place in South East Asia, the series highlighted unusual aquatic species.', title: 'JIM AL-KHALILI’S GUIDE TO LIFE, THE UNIVERSE AND EVERYTHING'),
  ProjectsHome(description: 'Online Post Production, in conjunction with TVF International, produced and created a four-part wildlife documentary series. Working in a remote collaboration, with filming taking place in South East Asia, the series highlighted unusual aquatic species.', title: 'PIZZA ON THE PARk'),
  ProjectsHome(description: 'Online Post Production, in conjunction with TVF International, produced and created a four-part wildlife documentary series. Working in a remote collaboration, with filming taking place in South East Asia, the series highlighted unusual aquatic species.', title: 'ODOKBOX TRAILERS'),
  ProjectsHome(description: 'Online Post Production, in conjunction with TVF International, produced and created a four-part wildlife documentary series. Working in a remote collaboration, with filming taking place in South East Asia, the series highlighted unusual aquatic species.', title: 'IBM + WIMBLEDON: #WHATMAKESGREAT'),
  ProjectsHome(description: 'Online Post Production, in conjunction with TVF International, produced and created a four-part wildlife documentary series. Working in a remote collaboration, with filming taking place in South East Asia, the series highlighted unusual aquatic species.', title: 'Ocean Wild'),
  ProjectsHome(description: 'Online Post Production, in conjunction with TVF International, produced and created a four-part wildlife documentary series. Working in a remote collaboration, with filming taking place in South East Asia, the series highlighted unusual aquatic species.', title: 'Ocean Wild'),

];



class MyHomePage extends StatefulWidget {
  @override
  _MyHomePageState createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {

  late VideoPlayerController _controller;



  @override
  void initState() {
    super.initState();
    _controller = VideoPlayerController.network(
        'https://api.onlinepp.co.uk/assets/page-videos/c4fdac1a46/SELECTS-FOR-CAROUSEL-4_1.mp4')
      ..initialize().then((_) {
        _controller.play();
        _controller.setLooping(true);
        // Ensure the first frame is shown after the video is initialized
        setState(() {});
      });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(

      body:
      Stack(
        fit: StackFit.loose,
        children:[



          ColorFiltered(
      colorFilter:  ColorFilter.mode(
          Colors.black.withOpacity(0.6),
        BlendMode.darken),
            child: SizedBox.expand(
            child: SizedBox(
              child: VideoPlayer(_controller),
            ),
            ),
          ),


CircleAvatar(
  child: Image.asset('assets/monty-logo.png'),
),


ListView.separated(
  padding: EdgeInsets.only(top: 50, left: 650),

    scrollDirection: Axis.horizontal,
    itemBuilder: (context, index){
  return Row(
    children: [
      Column(
          children:[
        Opacity(
          opacity:0.8,

            child: Container(

              color: Colors.grey.shade900,width: 700, height: 427,

            child: Center(
              child: Column(
                children: [
                  Center(
                    child: SizedBox(
                      width: 500,
                      child: Text(projects[index].title,style: TextStyle(fontSize: 40, color: CupertinoColors.white),),
                    ),
                  )


                ],
              ),
            ),
            )),

        Container(color: Colors.blue,width: 700, height: 427,),



      ])
    ],
  );
}, separatorBuilder: (context, index){
  return  SizedBox(width: 20,)/* Your separator widget here */;
}, itemCount: projects.length)

,
Container()

        ])


    );
  }
}
