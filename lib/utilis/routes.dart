
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:sponsor/Data/repository/home/home_repository.dart';
import 'package:sponsor/Data/repository/login/login_repository.dart';
import 'package:sponsor/business_logic/home/cubit/home_cubit.dart';
import 'package:sponsor/business_logic/login/cubit/login_cubit.dart';
import 'package:sponsor/presentation/home/home.dart';

import '../business_logic/signup/cubit/signup_cubit.dart';
import '../presentation/login/login.dart';

class Routes{
  static const String splashRoute='/';
      static const String loginRoute="/login";
      static const String signupRoute="/signup";
      static const String homeRoute="/home";

}
class RouteGenerator{
  static Route<dynamic> getRoute(RouteSettings settings){
    switch(settings.name){
     // case Routes.splashRoute :
        //return MaterialPageRoute(builder: (context) => const Splash());
      case Routes.loginRoute :
        return MaterialPageRoute(builder: (context) =>
            BlocProvider(
              create: (_) => LoginCubit(LoginRepository()),
              child: const Login(),

            )
        );
      case Routes.homeRoute :
        return MaterialPageRoute(builder: (context) =>
            BlocProvider(
                create: (_) => HomeCubit(HomeRepository()),
                child: const HomePage()));

      default:
        return unDefinedRoute();
    }
  }

  static Route<dynamic> unDefinedRoute() {
    return MaterialPageRoute(
        builder: (_) => Scaffold(
          appBar: AppBar(
            title: const Text('no Route Found'),
          ),
          body: const Center(child: Text('no Route Found')),
        ));
  }
}