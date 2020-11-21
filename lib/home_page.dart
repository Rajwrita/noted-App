import 'dart:wasm';

import 'package:flutter/material.dart';

class HomePage extends StatefulWidget {
  @override
  _HomePageState createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  @override
  Widget build(BuildContext context) {
    double screenSize = MediaQuery.of(context).size.height;
    return SafeArea(
      child: Scaffold(
          backgroundColor: Color(0xFFfcca46),
          body: ListView(
            children: <Widget>[
              Padding(
                padding: EdgeInsets.symmetric(horizontal: 15.0, vertical: 10.0),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: <Widget>[
                    IconButton(icon: Icon(Icons.menu), onPressed: () {}),
                    Text(
                      'noted',
                      style: TextStyle(
                        fontSize: 45.0,
                        fontFamily: 'timesnewroman',
                      ),
                    ),
                    CircleAvatar(
                      minRadius: 25.0,
                      backgroundColor: Color(0xfffbfcfc),
                    )
                  ],
                ),
              ),
              Padding(
                padding: EdgeInsets.only(
                  left: 28.0,
                  right: 28.0,
                  bottom: 10.0,
                  top: 20.0,
                ),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: <Widget>[
                    Text(
                      'My Notes',
                      style: TextStyle(
                          fontSize: 20.0,
                          fontFamily: 'RobotoMono',
                          fontWeight: FontWeight.bold),
                    ),
                    Text(
                      'View all',
                      style: TextStyle(
                        fontSize: 17.0,
                        fontFamily: 'RobotoMono',
                        fontWeight: FontWeight.w300,
                      ),
                    ),
                  ],
                ),
              ),
              Stack(
                children: <Widget>[
                  Padding(
                    padding: EdgeInsets.only(top: 60.0),
                    child: Container(
                      height: MediaQuery.of(context).size.height * 1.5,
                      width: MediaQuery.of(context).size.width * 1.0,
                      decoration: BoxDecoration(
                        color: Color(0xfffbfcfc),
                        borderRadius: BorderRadius.only(
                          topLeft: Radius.circular(55.0),
                          topRight: Radius.circular(55.0),
                        ),
                      ),
                    ),
                  ),
                  Padding(
                    padding: EdgeInsets.only(
                      left: 0.0,
                      right: 0.0,
                      bottom: 10.0,
                    ),
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: <Widget>[
                        SingleChildScrollView(
                          scrollDirection: Axis.horizontal,
                          child: Row(
                            children: <Widget>[
                              CourseCard('Orange.png', 'Computer Architecture',
                                  'big daddy'),
                              CourseCard('Orange.png', 'Operating System',
                                  'big daddy'),
                              CourseCard('Orange.png', 'Machine Learning',
                                  'big daddy'),
                            ],
                          ),
                        ),
                        Padding(
                          padding: EdgeInsets.symmetric(
                              horizontal: 20.0, vertical: 25.0),
                          child: Text(
                            'More to learn',
                            style: TextStyle(
                              fontWeight: FontWeight.bold,
                              fontSize: 30.0,
                            ),
                          ),
                        ),
                        Padding(
                          padding: EdgeInsets.symmetric(
                              horizontal: 20.0, vertical: 10.0),
                          child: Column(
                            children: <Widget>[
                              HorizontalCard('Machine Learning',
                                  'John Kumar Doe', 'student.png'),
                              HorizontalCard('Data Structures and Algorithm',
                                  'John Das Doe', 'student.png'),
                              HorizontalCard('Computer Architecture',
                                  'John Doe', 'student.png'),
                            ],
                          ),
                        ),
                      ],
                    ),
                  ),
                ],
              )
            ],
          )),
    );
  }
}

class HorizontalCard extends StatelessWidget {
  final String subjName;
  final String profName;
  final String imgpPath;

  const HorizontalCard(
    this.subjName,
    this.profName,
    this.imgpPath,
  );

  @override
  Widget build(BuildContext context) {
    double screenSize = MediaQuery.of(context).size.height;
    return Padding(
      padding: EdgeInsets.symmetric(vertical: 15.0),
      child: Container(
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: <Widget>[
            Flexible(
              child: Padding(
                padding: EdgeInsets.all(15.0),
                child: Column(
                  mainAxisAlignment: MainAxisAlignment
                      .spaceEvenly, // PLAY AROUND WITH THIS, MAYBE CHANGE SPACEeVENLY TO SPACEbETWEEN
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: <Widget>[
                    Flexible(
                      child: Container(
                        child: Text(
                          subjName,
                          style: TextStyle(
                              fontSize: screenSize > 700 ? 22.0 : 17,
                              fontFamily: 'RobotoMono',
                              fontWeight: FontWeight.bold),
                        ),
                      ),
                    ),
                    Flexible(
                      child: Container(
                        child: Text(
                          "By Prof. $profName",
                          style: TextStyle(
                              fontSize: screenSize > 700 ? 15.0 : 13,
                              fontFamily: 'RobotoMono',
                              fontWeight: FontWeight.w300),
                        ),
                      ),
                    ),
                  ],
                ),
              ),
            ),
            Container(
              height: screenSize > 700
                  ? MediaQuery.of(context).size.height * 0.2
                  : MediaQuery.of(context).size.height * 0.22,
              width: MediaQuery.of(context).size.width * 0.35,
              decoration: BoxDecoration(
                borderRadius: BorderRadius.only(
                  topRight: Radius.circular(30.0),
                  bottomRight: Radius.circular(30.0),
                ),
                color: Colors.red,
                // image: DecorationImage(
                //   image: AssetImage('images/$imgpPath'),
                //   fit: BoxFit.cover
                // ),
              ),
            )
          ],
        ),
        height: screenSize > 700
            ? MediaQuery.of(context).size.height * 0.2
            : MediaQuery.of(context).size.height * 0.22,
        width: MediaQuery.of(context).size.width * 0.9,
        decoration: BoxDecoration(
          color: Color(0xFFfcca46),
          //color: Colors.grey[200],
          borderRadius: BorderRadius.all(
            Radius.circular(30.0),
          ),
          boxShadow: [
            new BoxShadow(
              color: Color(0xffe2e2e2),
              blurRadius: 6.0,
            ),
          ],
        ),
      ),
    );
  }
}

class CourseCard extends StatelessWidget {
  final String imgPath;
  final String courseName;
  final String teacher;

  CourseCard(this.imgPath, this.courseName, this.teacher);
  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.all(15.0),
      child: Container(
        decoration: BoxDecoration(
          color: Color(0xfffbfcfc),
          //color: Colors.grey[200],
          borderRadius: BorderRadius.all(
            Radius.circular(30.0),
          ),
          boxShadow: [
            new BoxShadow(
              color: Color(0xffe2e2e2),
              blurRadius: 6.0,
            ),
          ],
        ),
        height: MediaQuery.of(context).size.height * 0.3,
        width: MediaQuery.of(context).size.width * 0.45,
        child: Padding(
          padding: EdgeInsets.symmetric(horizontal: 20.0, vertical: 15.0),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            crossAxisAlignment: CrossAxisAlignment.start,
            children: <Widget>[
              Flexible(
                child: Padding(
                  padding: EdgeInsets.only(left: 0.0),
                  //padding: EdgeInsets.only(top: 10.0),
                  child: Text(
                    courseName,
                    style: TextStyle(
                        fontSize: 20.0,
                        fontFamily: 'RobotoMono',
                        fontWeight: FontWeight.bold),
                  ),
                ),
              ),
              Padding(
                padding: EdgeInsets.only(top: 0.0),
                child: Container(
                  height: MediaQuery.of(context).size.height * 0.12,
                  width: MediaQuery.of(context).size.width * 0.4,
                  decoration: BoxDecoration(
                    image: DecorationImage(
                        image: AssetImage('images/$imgPath'),
                        fit: BoxFit.cover),
                  ),
                ),
              ),
              Padding(
                padding: EdgeInsets.only(left: 0.0),
                //padding: EdgeInsets.only(top: 0.0),
                child: Text(
                  teacher,
                  style: TextStyle(
                      fontSize: 15.0,
                      fontFamily: 'RobotoMono',
                      fontWeight: FontWeight.bold),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
