import 'package:flutter/material.dart';

class Home_Page extends StatefulWidget {
  String thoght;
  int second;
  int minute;
  int hour;

  Home_Page(
      {Key? key,
      required this.thoght,
      required this.second,
      required this.hour,
      required this.minute})
      : super(key: key);

  @override
  State<Home_Page> createState() => _Home_PageState();
}

class _Home_PageState extends State<Home_Page> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Thoghts"),
        centerTitle: true,
      ),
      body: Padding(
        padding: const EdgeInsets.all(15),
        child: Column(
          children: [
            Container(
                alignment: Alignment.centerLeft,
                height: 70,
                width: 330,
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(15),
                  color: Colors.grey.shade400,
                ),
                child: Row(
                  children: [
                    Container(
                      alignment: Alignment.center,
                      height: 100,
                      width: 100,
                      decoration: BoxDecoration(
                          color: Colors.grey.shade300,
                          borderRadius: BorderRadius.circular(15)),
                      child: Column(
                        mainAxisAlignment: MainAxisAlignment.center,
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Container(
                            alignment: Alignment.center,
                            child: const Text(
                              "Time",
                              style: TextStyle(
                                  fontWeight: FontWeight.bold, fontSize: 20),
                            ),
                          ),
                          Container(
                            child: Row(
                              mainAxisAlignment: MainAxisAlignment.center,
                              children: [
                                Text(
                                  "${widget.hour.toString()} : ",
                                  style: TextStyle(fontWeight: FontWeight.w500),
                                ),
                                Text(
                                  "${widget.minute.toString()} : ",
                                  style: TextStyle(fontWeight: FontWeight.w500),
                                ),
                                Text(
                                  "${widget.second.toString()}  ",
                                  style: TextStyle(fontWeight: FontWeight.w500),
                                ),
                              ],
                            ),
                          )
                        ],
                      ),
                    ),
                    Container(
                        padding: EdgeInsets.only(left: 15),
                        alignment: Alignment.centerLeft,
                        child: Text(
                          widget.thoght,
                          style: TextStyle(
                              fontWeight: FontWeight.w400, fontSize: 16),
                        )),
                  ],
                )),
          ],
        ),
      ),
    );
  }
}
