import 'dart:convert';

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:upimodel/convertfile/jsontodart.dart';
import 'package:http/http.dart' as http;

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
        primarySwatch: Colors.blue,
      ),
      home: samble(),
    );
  }
}

class samble extends StatefulWidget {
  const samble({Key? key}) : super(key: key);

  @override
  _sambleState createState() => _sambleState();
}

class _sambleState extends State<samble> {
  String? titile;
  String? date;
  List<Listt>? list = [];
  String url = "https://run.mocky.io/v3/cd1bb69f-7dc0-48e6-826b-1c7d01c79bbb";
  Future? objfuture;
  Future<upi_model> apicall() async {
    upi_model? objupi_model;
    var response = await http.get(Uri.parse(url));
    if (response.statusCode == 200) {
      var data = json.decode(response.body);
      objupi_model = upi_model.fromJson(data);
      print(response.body);
      setState(() {
        titile = objupi_model!.title!;
        date = objupi_model!.date!;
        for (int i = 0; i < objupi_model.listt!.length; i++) {
          list!.add(objupi_model.listt![i]);
        }
      });
    }
    return objupi_model!;
  }

  @override
  void initState() {
    super.initState();
    objfuture = apicall();
  }

  Widget build(BuildContext context) {
    return Scaffold(
      body: FutureBuilder(
        future: objfuture,
        builder: (context, snap) {
          if (snap.hasData) {
            return Container(
              child: Column(
                children: [
                  Row(
                    children: [
                      SizedBox(
                        height: 20,
                      ),
                      Center(child: Text("")),
                      Center(
                        child: Text(
                          "" + titile!,
                          style: TextStyle(
                            color: Colors.black,
                            fontWeight: FontWeight.bold,
                            wordSpacing: 1,
                            letterSpacing: 1,
                          ),
                        ),
                      )
                    ],
                  ),
                  Row(
                    children: [
                      SizedBox(
                        height: 40,
                      ),
                      Text("date"),
                      Text("" + date!)
                    ],
                  ),
                  Expanded(
                      child: ListView.builder(
                          itemCount: list!.length,
                          itemBuilder: (c, i) {
                            return GestureDetector(
                              onTap: () {},
                              child: Card(
                                child: Container(
                                  child: Column(
                                    children: [
                                      Row(
                                        mainAxisAlignment:
                                            MainAxisAlignment.start,
                                        crossAxisAlignment:
                                            CrossAxisAlignment.center,
                                        children: [
                                          SizedBox(
                                            height: 10,
                                          ),
                                          Container(
                                            height: 50,
                                            width: 60,


                                            child:
                                                Image.asset("assets/sbi.jpg"),
                                          ),
                                          Text(list![i].image!),
                                        ],
                                      ),
                                      Row(
                                        mainAxisAlignment:
                                            MainAxisAlignment.center,
                                        children: [
                                          SizedBox(
                                            height: 0,
                                          ),
                                          Center(child: Text("")),
                                          Center(
                                              child: Text(list![i].payment!)),
                                        ],
                                      ),
                                      Row(
                                        mainAxisAlignment:
                                            MainAxisAlignment.center,
                                        children: [
                                          SizedBox(
                                            height: 10,
                                          ),
                                          Text(""),
                                          Text(list![i].transferBnk!),
                                        ],
                                      ),
                                      Row(
                                        mainAxisAlignment:
                                            MainAxisAlignment.end,
                                        crossAxisAlignment:
                                            CrossAxisAlignment.center,
                                        children: [
                                          SizedBox(
                                            height: 10,
                                          ),
                                          Text(""),
                                          Text(
                                            list![i].emount!,
                                            style: TextStyle(
                                              fontWeight: FontWeight.bold,
                                              fontSize: 20,
                                              fontStyle: FontStyle.italic,
                                            ),
                                          ),
                                        ],
                                      ),
                                    ],
                                  ),
                                ),
                              ),
                            );
                          })),
                ],
              ),
            );
          } else {
            return Container(child: Center(child: CircularProgressIndicator()));
          }
        },
      ),
    );
  }
}
