import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_loadingindicator/flutter_loadingindicator.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:sponsor/business_logic/login/cubit/login_cubit.dart';
import 'package:sponsor/constants/enum_constant.dart';
import 'package:sponsor/constants/my_constant.dart';
import 'package:sponsor/utilis/shared_pref.dart';

class LoginNo extends StatefulWidget {
  const LoginNo({Key? key}) : super(key: key);

  @override
  State<LoginNo> createState() => _LoginNoState();
}

class _LoginNoState extends State<LoginNo> {
  final _formKey = GlobalKey<FormState>();
  TextEditingController motxt = TextEditingController();
  final FocusNode fcsmo = FocusNode();

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
        onTap: () {
          FocusScopeNode currentFocus = FocusScope.of(context);
          if (!currentFocus.hasPrimaryFocus) {
            currentFocus.unfocus();
          }
        },
        child: BlocListener<LoginCubit, LoginState>(
          listener: (context, state) async {
            if (state is LoginInitial) {
              form();
            }
            else if (state is LoginComplete) {
              await SharedPref.setUser(
                  state.model.first_name,
                  state.model.status);
              EasyLoading.dismiss();
              FloatingActionButton.extended(
                onPressed: () {
                  Navigator.pushReplacementNamed(context, Routes.homeRoute);
                },
                backgroundColor: Colors.teal,
                label: Text("الانتقال الى الصفحه التالية",
                    style: GoogleFonts.notoKufiArabic(
                        fontWeight: FontWeight.normal, fontSize: 16)),
                icon: const Icon(Icons.navigate_next_rounded,
                    textDirection: TextDirection.rtl),
              );
            }
            else if (state is LoginLoading) {
              showToast('يرجى الانتظار', ToastType.load);
              form();
            }
            else if (state is LoginError) {
              showToast(state.err, ToastType.error);
              form();
            }
          },
          child: form(),
        )
    );
  }

  Widget form() {
return Scaffold(
body: Container(
  child:Column(
    children: [
      Flexible(flex:1,
      child: ,)
    ],
  ) ,
),
);
  }
}

