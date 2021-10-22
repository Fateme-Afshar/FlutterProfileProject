import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/rendering.dart';
import 'package:google_fonts/google_fonts.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      theme: ThemeData(
        // This is the theme of your application.
        //
        // Try running your application with "flutter run". You'll see the
        // application has a blue toolbar. Then, without quitting the app, try
        // changing the primarySwatch below to Colors.green and then invoke
        // "hot reload" (press "r" in the console where you ran "flutter run",
        // or simply save your changes to "hot reload" in a Flutter IDE).
        // Notice that the counter didn't reset back to zero; the application
        // is not restarted.
        primarySwatch: Colors.blue,
        primaryColor: Colors.pink,
        brightness: Brightness.dark,
        dividerColor: Color.fromARGB(80, 255, 255, 255),
        appBarTheme: AppBarTheme(color: Colors.black),
        backgroundColor: Color.fromARGB(255, 30, 30, 30),
        textTheme: GoogleFonts.latoTextTheme(TextTheme(
            bodyText2: TextStyle(
                fontSize: 12, color: Color.fromARGB(200, 255, 255, 255)),
            headline6: TextStyle(fontSize: 14, fontWeight: FontWeight.bold))),
      ),
      home: const HomePage(),
    );
  }
}

class HomePage extends StatelessWidget {
  const HomePage({Key? key}) : super(key: key);
  final double normalImageSize = 40;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          actions: [
            Padding(
              padding: const EdgeInsets.fromLTRB(8, 16, 0, 16),
              child: Icon(CupertinoIcons.chat_bubble,
                  color: Colors.white, size: 20),
            ),
            Padding(
              padding: const EdgeInsets.fromLTRB(8, 16, 8, 16),
              child: Icon(CupertinoIcons.ellipsis_vertical,
                  color: Colors.white, size: 20),
            )
          ],
          title: Text("Music Player"),
        ),
        body: Column(
          children: [
            Row(children: [
              Padding(
                padding: const EdgeInsets.all(32.0),
                child: Row(
                  children: [
                    ClipRRect(
                      child: Image.asset(
                        '/images/reza_bahram.jpeg',
                        width: 60,
                        height: 60,
                      ),
                      borderRadius: BorderRadius.circular(16),
                    ),
                    Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text(
                          "Reza Bahram",
                          style: Theme.of(context)
                              .textTheme
                              .bodyText2
                              ?.copyWith(
                                  fontWeight: FontWeight.bold,
                                  color: Color.fromARGB(255, 255, 255, 255)),
                        ),
                        SizedBox(
                          height: 2,
                        ),
                        Text("Negar, The so good music"),
                        SizedBox(
                          height: 2,
                        ),
                        Row(
                          children: [
                            Icon(
                              CupertinoIcons.location,
                              size: 16,
                            ),
                            SizedBox(
                              width: 2,
                            ),
                            Text("Iran, Tehran")
                          ],
                        )
                      ],
                    ),
                  ],
                ),
              ),
            ]),
            Padding(
              padding: const EdgeInsets.fromLTRB(16, 0, 16, 8),
              child: Text(
                  "Reza Bahram Nezhad (born 1997 in kangavar) is a filmmaker and film producer and critic, and an Iranian art director. He has made several documentaries for TV channels and advertisement videos for leading brands. He has also written several articles on cinema and media in famous Iranian journals and magazines, as well as his personal web-blog. The main theme of his works is the relation among culture, Art, people's daily life, and the humans' society."),
            ),
            Divider(),
            Padding(
              padding: const EdgeInsets.fromLTRB(16, 8, 16, 8),
              child: Row(
                children: [
                  Text(
                    "Skill",
                    style: Theme.of(context)
                        .textTheme
                        .headline6
                        ?.copyWith(fontSize: 12),
                  ),
                  SizedBox(width: 2),
                  Icon(
                    CupertinoIcons.chevron_down,
                    size: 8,
                  )
                ],
              ),
            ),
            Wrap(
              children: [
                Skill( imageName: "app_icon_01",imageFormat: ".png",skillName:"Photoshop"),
                Skill( imageName: "app_icon_05",imageFormat: ".png",skillName:"Adobe XD"),
                Skill( imageName: "app_icon_04",imageFormat: ".png",skillName:"Illustraitor"),
                Skill( imageName: "app_icon_03",imageFormat: ".png",skillName:"After Effect"),
                Skill( imageName: "app_icon_02",imageFormat: ".png",skillName:"Lightroom"),
              ],
            )
          ],
        ));
  }
}

class Skill extends StatelessWidget {
  final String imageName;
  final String imageFormat;
  final String skillName;

  const Skill({
    Key? key,
    required this.skillName,
    required this.imageName,
    required this.imageFormat,

  }) : super(key: key);

  final String _imageRoot = "/images/";
  final double normalImageSize = 40;

  @override
  Widget build(BuildContext context) {
    return Container(
      alignment: Alignment.center,
      width: 100,
      height: 100,
      margin: EdgeInsets.fromLTRB(8, 0, 8, 8),
      decoration: BoxDecoration(
        color: Color.fromARGB(50, 255, 255, 255),
        borderRadius: BorderRadius.circular(10),
/*                   boxShadow:[
             BoxShadow(blurRadius:3,color:Color.fromARGB(50, 255, 255, 255) )
          ] */
      ),
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Image.asset(
            _imageRoot + imageName+imageFormat,
            width: normalImageSize,
            height: normalImageSize,
          ),
          SizedBox(
            height: 5,
          ),
          Text(skillName)
        ],
      ),
    );
  }
}
