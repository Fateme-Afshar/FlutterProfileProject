import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/rendering.dart';
import 'package:flutter/services.dart';
import 'package:google_fonts/google_fonts.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    final Color surfaceColor = Color.fromARGB(30, 255, 255, 255);
    final Color primaryColor = Colors.pink.shade400;
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
        primaryColor: primaryColor,
        brightness: Brightness.dark,
        dividerColor: surfaceColor,
        elevatedButtonTheme: ElevatedButtonThemeData(
            style: ButtonStyle(backgroundColor: MaterialStateProperty.all(Colors.pink.shade400))),
        appBarTheme: AppBarTheme(color: Colors.black),
        backgroundColor: Color.fromARGB(255, 30, 30, 30),
        inputDecorationTheme: InputDecorationTheme(
            border: OutlineInputBorder(
                borderRadius: BorderRadius.circular(8),
                borderSide: BorderSide.none),
            filled: true,
            fillColor: surfaceColor),
        textTheme: GoogleFonts.latoTextTheme(TextTheme(
            bodyText2: TextStyle(
                fontSize: 12, color: Color.fromARGB(200, 255, 255, 255)),
            headline6: TextStyle(fontSize: 14, fontWeight: FontWeight.bold))),
      ),
      home: const HomePage(),
    );
  }
}

enum _SkillType { photoshop, illustrator, xd, afterEffect, lightRoom }

class HomePage extends StatefulWidget {
  const HomePage({Key? key}) : super(key: key);

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  _SkillType _skillType = _SkillType.photoshop;

  void updateSelectedSkillState(_SkillType skillType) {
    setState(() {
      this._skillType = skillType;
    });
  }

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
        body: SingleChildScrollView(
          physics: BouncingScrollPhysics(),
          child: Column(
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
                  Skill(
                    type: _SkillType.photoshop,
                    imageName: "app_icon_01",
                    imageFormat: ".png",
                    skillName: "Photoshop",
                    isActive: _skillType == _SkillType.photoshop,
                    onTap: () {
                      updateSelectedSkillState(_SkillType.photoshop);
                    },
                    shadowColor: Colors.blue,
                  ),
                  Skill(
                    type: _SkillType.xd,
                    imageName: "app_icon_05",
                    imageFormat: ".png",
                    skillName: "Adobe XD",
                    isActive: _skillType == _SkillType.xd,
                    onTap: () {
                      updateSelectedSkillState(_SkillType.xd);
                    },
                    shadowColor: Colors.purple.shade800,
                  ),
                  Skill(
                    type: _SkillType.illustrator,
                    imageName: "app_icon_04",
                    imageFormat: ".png",
                    skillName: "Illustraitor",
                    isActive: _skillType == _SkillType.illustrator,
                    onTap: () {
                      updateSelectedSkillState(_SkillType.illustrator);
                    },
                    shadowColor: Colors.yellow.shade900,
                  ),
                  Skill(
                    type: _SkillType.afterEffect,
                    imageName: "app_icon_03",
                    imageFormat: ".png",
                    skillName: "After Effect",
                    isActive: _skillType == _SkillType.afterEffect,
                    onTap: () {
                      updateSelectedSkillState(_SkillType.afterEffect);
                    },
                    shadowColor: Colors.blue.shade900,
                  ),
                  Skill(
                    type: _SkillType.lightRoom,
                    imageName: "app_icon_02",
                    imageFormat: ".png",
                    skillName: "Lightroom",
                    isActive: _skillType == _SkillType.lightRoom,
                    onTap: () {
                      updateSelectedSkillState(_SkillType.lightRoom);
                    },
                    shadowColor: Colors.blue.shade200,
                  ),
                ],
              ),
              Divider(),
              Padding(
                padding: const EdgeInsets.fromLTRB(16, 8, 16, 8),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text("Personal information"),
                    SizedBox(
                      height: 16,
                    ),
                    TextField(
                      decoration: InputDecoration(
                          labelText: "Email",
                          prefixIcon: Icon(CupertinoIcons.at)),
                    ),
                    SizedBox(
                      height: 8,
                    ),
                    TextField(
                      decoration: InputDecoration(
                          labelText: "Password",
                          prefixIcon: Icon(CupertinoIcons.lock)),
                    ),
                    SizedBox(height: 8),
                    SizedBox(
                      width: double.infinity,
                      height: 45,
                      child:
                          ElevatedButton(onPressed: () {}, child: Text("Save")),
                    )
                  ],
                ),
              ),
            ],
          ),
        ));
  }
}

class Skill extends StatelessWidget {
  final String imageName;
  final String imageFormat;
  final String skillName;
  final bool isActive;
  final _SkillType type;
  final Function() onTap;
  final Color shadowColor;

  final BorderRadius defaultBorderRadius = BorderRadius.circular(10);

  Skill(
      {Key? key,
      required this.type,
      required this.skillName,
      required this.imageName,
      required this.imageFormat,
      required this.isActive,
      required this.onTap,
      required this.shadowColor})
      : super(key: key);

  final String _imageRoot = "/images/";
  final double normalImageSize = 40;

  Color? backgroundColor() {
    return isActive ? Color.fromARGB(50, 255, 255, 255) : null;
  }

  Color? itemShadowColor() {
    return isActive == true ? shadowColor : null;
  }

  @override
  Widget build(BuildContext context) {
    return InkWell(
      borderRadius: defaultBorderRadius,
      onTap: onTap,
      child: Container(
        alignment: Alignment.center,
        width: 100,
        height: 100,
        margin: EdgeInsets.fromLTRB(8, 0, 8, 8),
        decoration: BoxDecoration(
          color: backgroundColor(),
          borderRadius: defaultBorderRadius,
        ),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Container(
              decoration: isActive
                  ? BoxDecoration(boxShadow: [
                      BoxShadow(blurRadius: 10, color: shadowColor)
                    ])
                  : null,
              child: Image.asset(
                _imageRoot + imageName + imageFormat,
                width: normalImageSize,
                height: normalImageSize,
              ),
            ),
            SizedBox(
              height: 5,
            ),
            Text(skillName)
          ],
        ),
      ),
    );
  }
}
