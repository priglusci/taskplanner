/*
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';

class homePagenya extends StatefulWidget {
  @override
  State<StatefulWidget> createState() => InitState();
}

class InitState extends State<homePagenya> {
  final user = FirebaseAuth.instance.currentUser!;
  @override
  Widget build(BuildContext context) => initWidget();
    Widget initWidget(){
    return Scaffold(
      body: Center(
        child: Text('Signed In as:'),
      )
    );
    }
}
*/

import 'package:flutter/material.dart';
import 'package:taskplanner/auth/auth_controller.dart';
import 'package:taskplanner/calendar_page.dart';
import 'package:percent_indicator/percent_indicator.dart';
import 'package:taskplanner/widgets/task_column.dart';
import 'package:taskplanner/widgets/active_project_card.dart';
import 'package:taskplanner/widgets/top_container.dart';

class homePagenya extends StatelessWidget {
  String email;
  var Notifikasinya;
  homePagenya({Key? key, required this.email}) : super(key: key);

  @override
  Text subheading(String title) {
    return Text(
      title,
      style: TextStyle(
          color: Colors.white,
          fontSize: 25.0,
          fontWeight: FontWeight.w900,
          ),
    );
  }

  static CircleAvatar calendarIcon() {
    return CircleAvatar(
      radius: 25.0,
      backgroundColor:Color (0xFF00CA7D),
      child: Icon(
        Icons.calendar_today,
        size: 20.0,
        color: Colors.white,
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    double width = MediaQuery.of(context).size.width;
    return Scaffold(
      backgroundColor: Color (0xFF129261),
      body: SafeArea(
        child: Column(
          children: <Widget>[
            TopContainer(
              height: 120,
              width: width,
              padding: new EdgeInsets.all(10.0),
              child: Column(
                  mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                  children: <Widget>[
                    Padding(
                      padding: const EdgeInsets.symmetric(
                          horizontal: 0, vertical: 0.0),
                      child: Row(
                        crossAxisAlignment: CrossAxisAlignment.center,
                        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                        children: <Widget>[
                          Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: <Widget>[
                              Container(
                                child: Text(
                                  'Hello!',
                                  textAlign: TextAlign.start,
                                  style: TextStyle(
                                    fontSize: 30.0,
                                    color: Colors.white,
                                    fontWeight: FontWeight.w800,
                                  ),
                                ),
                              ),
                              Container(
                                child: Text(
                                  email,
                                  textAlign: TextAlign.start,
                                  style: TextStyle(
                                    fontSize: 15.0,
                                    color: Colors.white,
                                    fontWeight: FontWeight.w400,
                                  ),
                                ),
                              ),
                            ],
                          ),
                          CircularPercentIndicator(
                            radius: 45.0,
                            lineWidth: 5.0,
                            animation: true,
                            percent: 0.75,
                            circularStrokeCap: CircularStrokeCap.round,
                            progressColor: Colors.white,
                            backgroundColor: Color (0xFF00CA7D),
                            center: CircleAvatar(
                              backgroundImage: AssetImage("assets/avatar.png"),
                              //child : Image.asset("assets/avatar.png",width: 50,height: 50,),
                              backgroundColor: Colors.white,
                                radius: 35.0,
                            ),
                          ),

                        ],
                      ),
                    )
                  ]),
            ),
            Expanded(
              child: SingleChildScrollView(
                child: Column(
                  children: <Widget>[
                    Container(
                      color: Colors.transparent,
                      padding: EdgeInsets.symmetric(
                          horizontal: 20.0, vertical: 10.0),
                      child: Column(
                        children: <Widget>[
                          Row(
                            crossAxisAlignment: CrossAxisAlignment.center,
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            children: <Widget>[
                              subheading('My Tasks'),
                              GestureDetector(
                                onTap: () {
                                  Navigator.push(
                                    context,
                                    MaterialPageRoute(
                                        builder: (context) => CalendarPage()),
                                  );
                                },
                                child: calendarIcon(),
                              ),
                            ],
                          ),
                          SizedBox(height: 5.0),
                          TaskColumn(
                            icon: Icons.alarm,
                            iconBackgroundColor: Color (0xFF960D26),
                                gradient: LinearGradient(
                                    colors: [(new Color(0xFF00CA7D)), (new Color(0xFF129261))],
                                    begin: Alignment.centerLeft,
                                    end: Alignment.centerRight
                                ),
                            title: 'To Do',
                            subtitle: '5 tasks now. 1 started',
                          ),
                          SizedBox(
                            height: 15.0,
                          ),
                          TaskColumn(
                            icon: Icons.blur_circular,
                            iconBackgroundColor: Color (0xFFCEA70B),
                            gradient: LinearGradient(
                                colors: [(new Color(0xFF00CA7D)), (new Color(0xFF129261))],
                                begin: Alignment.centerLeft,
                                end: Alignment.centerRight
                            ),
                            title: 'In Progress',
                            subtitle: '1 tasks now. 1 started',
                          ),
                          SizedBox(height: 15.0),
                          TaskColumn(
                            icon: Icons.check_circle_outline,
                            iconBackgroundColor: Color (0xFF00CA7D),
                            gradient: LinearGradient(
                                colors: [(new Color(0xFF00CA7D)), (new Color(0xFF129261))],
                                begin: Alignment.centerLeft,
                                end: Alignment.centerRight
                            ),
                            title: 'Done',
                            subtitle: '18 tasks now. 13 started',
                          ),
                        ],
                      ),
                    ),
                    Container(
                      color: Colors.transparent,
                      padding: EdgeInsets.symmetric(
                          horizontal: 20.0, vertical: 10.0),
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: <Widget>[
                          subheading('Active Projects'),
                          SizedBox(height: 5.0),
                          Row(
                            children: <Widget>[
                              ActiveProjectsCard(
                                cardColor: Color (0xFF00CA7D),
                                gradient: LinearGradient(
                                    colors: [(new Color(0xFF00CA7D)), (new Color(0xFF129261))],
                                    begin: Alignment.topCenter,
                                    end: Alignment.bottomCenter
                                ),
                                loadingPercent: 0.25,
                                title: 'Medical App',
                                subtitle: '9 hours progress',
                              ),
                              SizedBox(width: 20.0),
                              ActiveProjectsCard(
                                cardColor: Color (0xFF00CA7D),
                                gradient: LinearGradient(
                                    colors: [(new Color(0xFF00CA7D)), (new Color(0xFF129261))],
                                    begin: Alignment.centerLeft,
                                    end: Alignment.centerRight
                                ),
                                loadingPercent: 0.6,
                                title: 'Making History Notes',
                                subtitle: '20 hours progress',
                              ),
                            ],
                          ),
                          Row(
                            children: <Widget>[
                              ActiveProjectsCard(
                                cardColor: Color (0xFF00CA7D),
                                gradient: LinearGradient(
                                    colors: [(new Color(0xFF00CA7D)), (new Color(0xFF129261))],
                                    begin: Alignment.centerLeft,
                                    end: Alignment.centerRight
                                ),
                                loadingPercent: 0.45,
                                title: 'Sports App',
                                subtitle: '5 hours progress',
                              ),
                              SizedBox(width: 20.0),
                              ActiveProjectsCard(
                                cardColor: Color (0xFF00CA7D),
                                gradient: LinearGradient(
                                    colors: [(new Color(0xFF00CA7D)), (new Color(0xFF129261))],
                                    begin: Alignment.centerLeft,
                                    end: Alignment.centerRight
                                ),
                                loadingPercent: 0.9,
                                title: 'Online Flutter Course',
                                subtitle: '23 hours progress',
                              ),
                            ],
                          ),
                        ],
                      ),
                    ),
                    GestureDetector(
                      child: GestureDetector(
                        onTap: (){
                          AuthController.instance.logOut();
                        },
                        child: Container(
                          alignment: Alignment.center,
                          margin: EdgeInsets.only(left: 20, right: 20, top: 20, bottom: 20),
                          padding: EdgeInsets.only(left: 20, right: 20),
                          height: 60,
                          decoration: BoxDecoration(
                            gradient: LinearGradient(colors: [(new  Color(0xFF00CA7D)), new Color(0xFF00CA7D)],
                                begin: Alignment.centerLeft,
                                end: Alignment.centerRight
                            ),
                            borderRadius: BorderRadius.circular(50),
                            color: Colors.grey[200],

                          ),
                          child: Text(
                            "LOGOUT",
                            style: TextStyle(
                                color: Colors.white
                            ),
                          ),
                        ),
                      ),
                    ),
                  ],
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
