import 'dart:async';
import 'package:flutter/material.dart';
import 'package:lottie/lottie.dart';
import 'package:sponsor/utilis/routes.dart';
import 'package:sponsor/utilis/shared_pref.dart';

class Splash extends StatefulWidget {
  const Splash({Key? key}) : super(key: key);
@override
State<Splash> createState() => _SplashState();

}

class _SplashState extends State<Splash>{
  Timer? _timer;
  _startDelay() {
    _timer = Timer(const Duration(milliseconds: 1000), _goNext);}
    void _goNext() async{
      if(await SharedPref.haveLogin()){
        Navigator.pushReplacementNamed(context, Routes.homeRoute);
      }else{
        Navigator.pushReplacementNamed(context, Routes.loginRoute);
      }
    }

    @override
    void initState() {
      super.initState();
      _startDelay();
    }
  Widget build(BuildContext context) {
    return Scaffold(body:
    Container(padding:const EdgeInsets.only(left: 100) ,child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        crossAxisAlignment: CrossAxisAlignment.center,children:[Lottie.asset('lib/assets/lottie/alayn.json')])));
  }
  @override
  void dispose() {
    _timer?.cancel();
    super.dispose();
  }
}

