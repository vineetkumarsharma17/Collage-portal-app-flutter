import 'package:flutter/material.dart';

import 'FacultyAttendence/takeFacultyAttendence.dart';
class DirectorDashboard extends StatefulWidget {
  DirectorDashboard({Key? key}) : super(key: key);
  @override
  _DirectorDashboardState createState() => _DirectorDashboardState();
}
class _DirectorDashboardState extends State<DirectorDashboard> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      //backgroundColor: Color(0xFFC0C9BF),
      appBar: AppBar(
        elevation: 0.0,
        // backgroundColor: Color(0xFFC0C9BF),
        //backgroundColor: Colors.grey[200],
        leading: IconButton(
          icon: Icon(Icons.menu),
          onPressed: () {},
          tooltip: 'Menu',
        ),
        title: Text("Director"),
        actions: [
          Padding(
            padding: EdgeInsets.symmetric(horizontal: 16),
            child: IconButton(
              onPressed: () {},
              icon: Icon(Icons.more_vert),
            ),
          )
        ],
      ),
      body: Center(
        child: SingleChildScrollView(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.start,
            children: [
              //SliderScreen(),
              SizedBox(
                height: 150,
              ),
              Container(
                padding: EdgeInsets.only(top: 30),
                decoration: BoxDecoration(
                  color: Color(0xFFFFFFFF),
                  borderRadius: BorderRadius.only(
                      topLeft: Radius.circular(30),
                      topRight: Radius.circular(30)),
                ),
                width: MediaQuery.of(context).size.width * .99,
                child: Column(
                  children: [
                    SizedBox(height: 10),
                    Card(
                      color: Colors.orange,
                      elevation: 2.0,
                      shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(15.0),
                      ),
                      child: Padding(
                        padding: const EdgeInsets.symmetric(vertical: 30),
                        child: Column(
                          children: [
                            Container(
                              child: Text(
                                "Dashboard",
                                style: TextStyle(
                                    color: Colors.white,
                                    fontSize: 20,
                                    fontWeight: FontWeight.bold),
                                textAlign: TextAlign.left,
                              ),
                            ),
                            SizedBox(height: 20),
                            Padding(
                              padding: const EdgeInsets.symmetric(vertical: 10.0),
                              child: Container(
                                child: Row(
                                  crossAxisAlignment: CrossAxisAlignment.start,
                                  mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                                  children: [
                                    InkWell(
                                      onTap: () {
                                        // Navigator.of(context).push(MaterialPageRoute(
                                        //     builder: (context) => RegisterPersonalInfo()));
                                      },
                                      child: Container(
                                        width: MediaQuery.of(context).size.width * 0.27,
                                        child: Column(
                                          children: [
                                            Icon(Icons.school_rounded),
                                            Padding(
                                              padding: const EdgeInsets.symmetric(vertical: 10),
                                              child: Text(
                                                ""
                                                    "Studence Attendence",
                                                style: TextStyle(
                                                  fontSize: 16,
                                                  color: Colors.white,
                                                ),
                                                textAlign: TextAlign.center,
                                              ),
                                            ),
                                          ],
                                        ),
                                      ),
                                    ),
                                    InkWell(
                                      onTap: () {
                                        Navigator.of(context).push(MaterialPageRoute(
                                            builder: (context) => TakeFacultyAttendence()));
                                      },
                                      child: Container(
                                        width: MediaQuery.of(context).size.width * 0.27,
                                        child: Column(
                                          children: [
                                            Icon(Icons.school_rounded),
                                            Padding(
                                              padding: const EdgeInsets.symmetric(vertical: 10),
                                              child: Text(
                                                "Take Faculty Attendence",
                                                style: TextStyle(
                                                  fontSize: 16,
                                                  color: Colors.white,
                                                ),
                                                textAlign: TextAlign.center,
                                              ),
                                            ),
                                          ],
                                        ),
                                      ),
                                    ),
                                    // InkWell(
                                    //   onTap: () {},
                                    //   child: Container(
                                    //     width: MediaQuery.of(context).size.width * 0.27,
                                    //     child: Column(
                                    //       children: [
                                    //         Icon(Icons.school_rounded),
                                    //         Padding(
                                    //           padding: const EdgeInsets.symmetric(vertical: 10),
                                    //           child: Text(
                                    //             "Student List",
                                    //             style: TextStyle(
                                    //               fontSize: 16,
                                    //               color: Colors.white,
                                    //             ),
                                    //             textAlign: TextAlign.center,
                                    //           ),
                                    //         ),
                                    //       ],
                                    //     ),
                                    //   ),
                                    // ),
                                  ],
                                ),
                              ),
                            ),
                            SizedBox(
                              height: 20,
                            ),
                            // Container(
                            //   child: Row(
                            //     crossAxisAlignment: CrossAxisAlignment.start,
                            //     //mainAxisAlignment: MainAxisAlignment.start,
                            //     children: [
                            //       InkWell(
                            //         onTap: () {
                            //           // Navigator.of(context).push(MaterialPageRoute(
                            //           //     builder: (context) => PromoteStudent()));
                            //         },
                            //         child: Container(
                            //           width: MediaQuery.of(context).size.width * 0.3,
                            //           child: Padding(
                            //             padding: const EdgeInsets.only(left: 12),
                            //             child: Column(
                            //               children: [
                            //                 Icon(Icons.school_rounded),
                            //                 Padding(
                            //                   padding: const EdgeInsets.symmetric(vertical: 10),
                            //                   child: Text(
                            //                     "Promote Student",
                            //                     style: TextStyle(
                            //                       fontSize: 16,
                            //                       color: Colors.white,
                            //                     ),
                            //                     textAlign: TextAlign.center,
                            //                   ),
                            //                 ),
                            //               ],
                            //             ),
                            //           ),
                            //         ),
                            //       ),
                            //       InkWell(
                            //         onTap: () {},
                            //         child: Container(
                            //           width: MediaQuery.of(context).size.width * 0.3,
                            //           child: Column(
                            //             children: [
                            //               Icon(Icons.school_rounded),
                            //               Padding(
                            //                 padding: const EdgeInsets.symmetric(vertical: 10),
                            //                 child: Text(
                            //                   "Today Present Student Classwise",
                            //                   style: TextStyle(
                            //                     fontSize: 16,
                            //                     color: Colors.white,
                            //                   ),
                            //                   textAlign: TextAlign.center,
                            //                 ),
                            //               ),
                            //             ],
                            //           ),
                            //         ),
                            //       ),
                            //     ],
                            //   ),
                            // ),
                          ],
                        ),
                      ),
                    )
                  ],
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
