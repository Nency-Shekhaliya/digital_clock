import 'package:digital_clock/screens/home_Page.dart';
import 'package:digital_clock/utils/utils_page.dart';
import 'package:flutter/material.dart';
import 'package:shared_preferences/shared_preferences.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatefulWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  State<MyApp> createState() => _MyAppState();
}

class _MyAppState extends State<MyApp> {
  String Thoghts = "";
  String thoghts = '';
  int second = DateTime.now().second;
  int second2 = DateTime.now().second;
  int minute = DateTime.now().minute;
  int minute2 = DateTime.now().minute;
  int hour = DateTime.now().hour;
  int hour2 = DateTime.now().hour;

  GlobalKey<FormState> formkey = GlobalKey<FormState>();
  TextEditingController Controller = TextEditingController();
  getime() async {
    SharedPreferences prefs = await SharedPreferences.getInstance();
    setState(() {
      second = prefs.getInt(sfsecond) ?? 0;
    });
  }

  getthoght() async {
    SharedPreferences prefs = await SharedPreferences.getInstance();
    setState(() {
      thoghts = prefs.getString(sfthoght)!;
    });
  }

  getminute() async {
    SharedPreferences prefs = await SharedPreferences.getInstance();
    setState(() {
      minute = prefs.getInt(sfminute)!;
    });
  }

  gethour() async {
    SharedPreferences prefs = await SharedPreferences.getInstance();
    setState(() {
      hour = prefs.getInt(sfhour)!;
    });
  }

  @override
  void initState() {
    super.initState();
    getthoght();
    getime();
    getminute();
    gethour();
  }

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
        debugShowCheckedModeBanner: false,
        theme: ThemeData(useMaterial3: true),
        home: Builder(builder: (context) {
          return Scaffold(
            body: Padding(
              padding: const EdgeInsets.all(15),
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Container(
                        alignment: Alignment.center,
                        height: 80,
                        width: 80,
                        decoration: BoxDecoration(
                            color: Colors.white.withOpacity(0.2),
                            borderRadius: BorderRadius.circular(20),
                            border: Border.all(
                                color: Colors.white.withOpacity(0.4)),
                            boxShadow: [
                              BoxShadow(
                                  spreadRadius: 4,
                                  blurRadius: 8,
                                  offset: const Offset(-10, -10),
                                  color: Colors.white70.withOpacity(0.1))
                            ]),
                        child: Text(
                          "$hour2",
                          style: TextStyle(
                              color: Colors.white70.withOpacity(0.5),
                              fontSize: 50,
                              fontWeight: FontWeight.bold),
                        ),
                      ),
                      Container(
                        alignment: Alignment.center,
                        height: 100,
                        width: 40,
                        child: const Text(
                          ":",
                          style: TextStyle(color: Colors.white, fontSize: 50),
                        ),
                      ),
                      Container(
                        alignment: Alignment.center,
                        height: 80,
                        width: 80,
                        decoration: BoxDecoration(
                            borderRadius: BorderRadius.circular(20),
                            color: Colors.white.withOpacity(0.2),
                            border: Border.all(
                                color: Colors.white.withOpacity(0.4)),
                            boxShadow: [
                              BoxShadow(
                                  spreadRadius: 4,
                                  blurRadius: 8,
                                  offset: const Offset(-10, -10),
                                  color: Colors.white70.withOpacity(0.1)),
                            ]),
                        child: Text(
                          "$minute2",
                          style: TextStyle(
                              color: Colors.white70.withOpacity(0.5),
                              fontSize: 50,
                              fontWeight: FontWeight.bold),
                        ),
                      ),
                      Container(
                        alignment: Alignment.center,
                        height: 100,
                        width: 40,
                        child: const Text(
                          ":",
                          style: TextStyle(color: Colors.white, fontSize: 50),
                        ),
                      ),
                      Container(
                        alignment: Alignment.center,
                        height: 80,
                        width: 80,
                        decoration: BoxDecoration(
                            border: Border.all(
                                color: Colors.white.withOpacity(0.4)),
                            borderRadius: BorderRadius.circular(20),
                            color: Colors.white.withOpacity(0.2),
                            boxShadow: [
                              BoxShadow(
                                  spreadRadius: 4,
                                  blurRadius: 8,
                                  offset: const Offset(-10, -10),
                                  color: Colors.white70.withOpacity(0.1))
                            ]),
                        child: Text(
                          "$second2",
                          style: TextStyle(
                              color: Colors.white70.withOpacity(0.5),
                              fontSize: 50,
                              fontWeight: FontWeight.bold),
                        ),
                      )
                    ],
                  ),
                  SizedBox(
                    height: 20,
                  ),
                  Form(
                    key: formkey,
                    child: TextFormField(
                      controller: Controller,
                      onSaved: (val) {
                        setState(() {
                          Thoghts = val!;
                        });
                      },
                      validator: (val) {
                        if (val!.isEmpty) {
                          return "Please Enter Thoght...";
                        } else {
                          return null;
                        }
                      },
                      style: TextStyle(color: Colors.white),
                      decoration: InputDecoration(
                        border: OutlineInputBorder(),
                        enabledBorder: OutlineInputBorder(
                            borderSide: BorderSide(color: Colors.grey),
                            borderRadius: BorderRadius.circular(50)),
                        focusedBorder: OutlineInputBorder(
                          borderSide: BorderSide(color: Colors.white),
                          borderRadius: BorderRadius.circular(50),
                        ),
                        focusedErrorBorder: OutlineInputBorder(
                          borderRadius: BorderRadius.circular(50),
                          borderSide: BorderSide(color: Colors.red),
                        ),
                        errorBorder: OutlineInputBorder(
                          borderRadius: BorderRadius.circular(50),
                        ),
                      ),
                    ),
                  ),
                  SizedBox(
                    height: 30,
                  ),
                  ElevatedButton(
                      onPressed: () async {
                        SharedPreferences prefs =
                            await SharedPreferences.getInstance();
                        setState(() {
                          prefs.setString(sfthoght, Controller.text.toString());
                        });
                        SharedPreferences pref =
                            await SharedPreferences.getInstance();
                        setState(() {
                          prefs.setInt(sfsecond, DateTime.now().second);
                        });
                        SharedPreferences prefr =
                            await SharedPreferences.getInstance();
                        setState(() {
                          prefs.setInt(sfminute, DateTime.now().minute);
                        });
                        SharedPreferences prefre =
                            await SharedPreferences.getInstance();
                        setState(() {
                          prefs.setInt(sfhour, DateTime.now().hour);
                        });

                        if (formkey.currentState!.validate()) {
                          formkey.currentState!.save();
                          Controller.clear();

                          // Navigator.of(context).push(MaterialPageRoute(
                          //     builder: (context) => Home_Page(
                          //           thoght: thoghts,
                          //           second: second,
                          //           hour: hour,
                          //           minute: minute,
                          //         )));
                        }
                      },
                      child: Text(
                        "Mark My Thought",
                        style: TextStyle(color: Colors.black),
                      )),
                ],
              ),
            ),
            floatingActionButton: FloatingActionButton(
              onPressed: () {
                Navigator.of(context).push(MaterialPageRoute(
                    builder: (context) => Home_Page(
                          second: second,
                          thoght: thoghts,
                          minute: minute,
                          hour: hour,
                        )));
              },
              child: Icon(
                Icons.list_alt_outlined,
                color: Colors.black,
              ),
              backgroundColor: Colors.white,
            ),
            backgroundColor: Colors.black87,
          );
        }));
  }
}
