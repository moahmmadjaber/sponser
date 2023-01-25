import 'dart:convert';
import 'package:dio/dio.dart' as Dio;
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_loadingindicator/flutter_loadingindicator.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:intl/intl.dart';
import 'package:sponsor/Data/model/login/user_model.dart';
import 'package:sponsor/business_logic/home/cubit/home_cubit.dart';
import 'package:sponsor/constants/enum_constant.dart';
import 'package:sponsor/constants/my_constant.dart';
import 'package:sponsor/utilis/routes.dart';
import 'package:sponsor/utilis/shared_pref.dart';
import '../../network/http_service.dart';
import '../notification/notification.dart';


class Home extends StatefulWidget {
  const Home({Key? key}) : super(key: key);


  @override
  State<Home> createState() => _HomeState();


}

class _HomeState extends State<Home> {

  UserModel _userModel = UserModel();
  @override
  void initState() {
    super.initState();

    SharedPref.getName().then((value) {
      setState(() {
        _userModel.first_name = value;
      });
    });
    showToast('يرجى الانتظار', ToastType.load);
        BlocProvider.of<HomeCubit>(context).getData();

  }


  //getData() async {
    // SponsorInfo? info=await RemoteService().getPosts();
    //  print(info);
    //  return info;
  //}

  @override
  Widget build(BuildContext context) {
    return Container(
    child: BlocListener<HomeCubit, HomeState>(
    listener: (context, state) async {
    if (state is HomeInitial) {
      form();
    }
    else if (state is HomeLoading ){
    form();
    }
    else if (state is HomeComplete) {
      EasyLoading.dismiss();
    }
    else if (state is HomeError) {
    showToast(state.err, ToastType.error);
    form();

    }
    },
    child: form()
    )
    );
  }
      Widget form() {
        DateTime now = DateTime.now();
        String formattedDate = DateFormat.yMMMEd().format(now);
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
                const SizedBox(height: 30,),
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
                                Text('مرحبا ${_userModel.first_name}',
                                    style: const TextStyle(
                                        color: Colors.white70,
                                        fontSize: 20,
                                        fontWeight: FontWeight.w600)),
                                const SizedBox(
                                  height: 8,
                                ),
                                Text(formattedDate,
                                  style: TextStyle(color: Colors.blue[200]),
                                )
                              ]),

                          Container(
                            decoration: BoxDecoration(
                                color: Colors.blue[600],
                                borderRadius: BorderRadius.circular(12)),
                            padding: EdgeInsets.all(7),
                            child: IconButton(
                              color: Colors.white, onPressed: () {Navigator.pushReplacementNamed(context, Routes.NotificationRoute);
                              }, icon: Icon(Icons.notifications, size: 28,),
                            ),
                          ),
                          Spacer(),
                          IconButton(onPressed: logout, icon: Icon(Icons
                              .logout))
                        ],
                      ),
                    ],
                  ),
                ),
                const SizedBox(height: 50,),
                Expanded(
                  child: ClipRRect(
                    borderRadius: const BorderRadius.only(
                        topLeft: Radius.circular(50),
                        topRight: Radius.circular(50)),
                    child: Container(
                      color: Colors.grey[200],
                      padding: const EdgeInsets.all(25),
                      child: Column(
                        children: [
                          //heading
                          Row(
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            children: [
                              Text('بيانات الكفيل ',
                                style: GoogleFonts.tajawal(
                                    fontWeight: FontWeight.bold,
                                    fontSize: 20),),
                              PopupMenuButton<Text>(
                                  itemBuilder: (context) {
                                    return [
                                      const PopupMenuItem(
                                        child: Text(
                                          'First',
                                        ),
                                      ),
                                      const PopupMenuItem(
                                        child: Text(
                                          'Second',
                                        ),
                                      ),
                                      const PopupMenuItem(
                                        child: Text(
                                          'Third',
                                        ),
                                      ),
                                    ];
                                  }
                              ),
                            ],
                          ),
                          const SizedBox(height: 20,),
                          //listview
                          Container(
                            decoration: BoxDecoration(
                                color: Colors.white,
                                borderRadius: BorderRadius.circular(16)
                            ),
                            child: const ListTile(horizontalTitleGap: 20,
                              tileColor: Colors.lightBlue,
                              leading: Icon(Icons.info_outlined),
                              title: Text(
                                  'مجموع المبالغ المدفوعة'
                              ),
                              subtitle: Text(),
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

  void logout(){
    SharedPref.removeUser();
    Navigator.pushReplacementNamed(context, Routes.loginRoute);
  }

}

