import 'dart:convert';

import 'package:dio/dio.dart' as Dio;
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:sponsor/SponsorInfo.dart';
import 'package:sponsor/constants/enum_constant.dart';
import 'package:sponsor/constants/my_constant.dart';
import 'package:sponsor/remot_service.dart';
import 'package:sponsor/utilis/shared_pref.dart';

import '../../network/http_service.dart';
import '../../notification.dart';

class HomePage extends StatefulWidget {
  const HomePage({Key? key}) : super(key: key);


  @override
  State<HomePage> createState() => _HomePageState();


}

class _HomePageState extends State<HomePage> {
  Future dataIn() async{
    Dio.Response response=await dio().post(

        'find',
        data:"1344"
    );
      String res=json.decode(response.toString());
      print(res);
      return res;
  }
  @override
  void initState() {
    //posts?.add(Posts(questionId: 1, question: "question", questionDate: DateTime.now()));
    super.initState();
  }

  getData() async{
   // SponsorInfo? info=await RemoteService().getPosts();
   //  print(info);
   //  return info;
  }
  @override


 //Future<String> _usernameget() async{
   // SharedPreferences prefs=await SharedPreferences.getInstance();
    //inal username=SharedPref.getUser(UserEnum.username);
    //return username

  //}


  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.blue[800],
      body: SafeArea(
        child: Column(
          children: [

            /*SizedBox(
              height: 80,child:
              Container(
                height: 100,
                width: MediaQuery.of(context).size.width,
                decoration: BoxDecoration(
                    color: Colors.lightBlue[300]?.withOpacity(0.5),
                    borderRadius: BorderRadius.circular(12)),
                padding: EdgeInsets.all(0.1),
                child: Image(
                      image: new AssetImage("assets/aynf.png"),
                      width: 90,
                      height: 90,),
              ),

            ),*/
            SizedBox(height: 30,),
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 25.0),
              child: Column(
                children: [
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      // hi sponsor
                      Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Text('مصطفى'),
                            SizedBox(
                              height: 8,
                            ),
                            Text(
                              '23 jan , 2022',
                              style: TextStyle(color: Colors.blue[200]),
                            )
                          ]),
                      //notification
                      Container(
                        decoration: BoxDecoration(
                            color: Colors.blue[600],
                            borderRadius: BorderRadius.circular(12)),
                        padding: EdgeInsets.all(7),
                        child: IconButton(
                          color: Colors.white, onPressed: () {
                                 Navigator.of(context).pushAndRemoveUntil(MaterialPageRoute(builder: (BuildContext context) {
                                  return NoificationPage();
                                      }), (route) => false);
                        }, icon:Icon( Icons.notifications, size: 28,),
                        ),
                      ),
                    ],
                  ),
                ],
              ),
            ),
            SizedBox(
              height: 50,
            ),
            Expanded(
              child: ClipRRect(
                borderRadius: BorderRadius.only(
                    topLeft: Radius.circular(50),
                    topRight: Radius.circular(50)),
                child: Container(
                  color: Colors.grey[200],
                  padding: EdgeInsets.all(25),
                  child: Column(
                    children: [
                      //heading
                      Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          Text('بيانات الكفيل ',
                          style: GoogleFonts.tajawal(fontWeight: FontWeight.bold,fontSize: 20),),
                          PopupMenuButton<Text>(
                              itemBuilder: (context) {
                                return [
                                  PopupMenuItem(
                                    child: Text(
                                      'First',
                                    ),
                                  ),
                                  PopupMenuItem(
                                    child: Text(
                                      'Second',
                                    ),
                                  ),
                                  PopupMenuItem(
                                    child: Text(
                                      'Third',
                                    ),
                                  ),
                                ];}
                          ),
                        ],
                      ),
                      SizedBox(height: 20,),
                      //listview
                      Container(
                      decoration: BoxDecoration(
                        color: Colors.white,
                        borderRadius: BorderRadius.circular(16)
                      ),
                        child: ListTile(horizontalTitleGap: 20,
                          tileColor: Colors.lightBlue,
                          leading: Icon(Icons.info_outlined),
                          title: Text(
                              getData().toString()
                          ),
                          subtitle: Text('التفاصيل'),
                        ),
                      ),
                    ],
                  ),
                ),
              ),
            )
          ],
        ),
      ),
    );
  }
}
