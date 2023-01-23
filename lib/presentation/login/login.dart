import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_loadingindicator/flutter_loadingindicator.dart';
import 'package:flutter_native_splash/flutter_native_splash.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:qr_code_scanner/qr_code_scanner.dart';
import 'package:sponsor/presentation/home/home.dart';
import 'package:sponsor/business_logic/login/cubit/login_cubit.dart';
import 'package:sponsor/constants/enum_constant.dart';
import 'package:sponsor/constants/my_color.dart';
import 'package:sponsor/constants/my_constant.dart';
import 'package:sponsor/utilis/routes.dart';
import 'package:sponsor/utilis/shared_pref.dart';



  @override
  Widget build(BuildContext context) {
    FlutterNativeSplash.remove();
    return MaterialApp(
      title: 'Flutter Demo',
      theme: ThemeData(

        primarySwatch: Colors.blue,
      ),
      home: const Login(title: 'Flutter Demo Home Page'),
    );
  }

class Login extends StatefulWidget {
  const Login({super.key,title});


  @override
  State<Login> createState() => _LoginState();

}

class _LoginState extends State<Login> {

  final _qrKey = GlobalKey<FormState>(debugLabel: 'QR');
  Barcode? result;
  QRViewController? controller;

  @override
  Widget build(BuildContext context) {
    _goNext()

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
            else if (state is LoginLoading ){
              showToast('يرجى الانتظار', ToastType.load);
              form();
            }
            else if (state is LoginComplete) {
              EasyLoading.dismiss();
              if (state.model.status==false){
              showToast('رقم المحسن غير صحيح', ToastType.error);}else
             { await SharedPref.setUser(
                  state.model.first_name.toString(),
              state.model.status);
                Navigator.pushReplacementNamed(context, Routes.homeRoute);}

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
  Widget form(){

  return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.white30,
        title: const Center(child: Text('مؤسسة العين للرعاية الاجتماعية',
          style: TextStyle(color: Color.fromRGBO(0, 155, 0, 0.8),
            fontFamily: 'Reem',
            fontWeight: FontWeight.w200,
            fontSize: 25
            ,),)),

      ),
      body: Center(

        child: Column(
          children: <Widget>[
            Container(
              height: MediaQuery
                  .of(context)
                  .size
                  .height * .7,

              child: QRView(
                key: _qrKey,
                onQRViewCreated: _onQRViewCreated,
                overlay: QrScannerOverlayShape(
                  borderLength: 10,
                  borderRadius: 10,
                  borderColor: Colors.blueAccent,
                  borderWidth: 10,
                  cutOutSize: MediaQuery
                      .of(context)
                      .size
                      .width * .8,
                ),
              ),
            ),
            Expanded(
              flex: 1,
              child: Center(child: ElevatedButton(
                onPressed: _login,
                style: ElevatedButton.styleFrom(
                    backgroundColor: MyColor.colorMain
                ),
                child: const Text('تسجيل الدخول'),
              )


              ),
            )
          ],
        ),
      ),
      // This trailing comma makes auto-formatting nicer for build methods.
    );
  }


  void _onQRViewCreated(QRViewController controller) {
    this.controller = controller;
    controller.scannedDataStream.listen((scanData) {
      setState(() {
        result = scanData;
      });
    });
  }

  void _login() {
    if (result != null) {
      FocusScope.of(context).unfocus();
      BlocProvider.of<LoginCubit>(context).login(result!.code);
    }
  }
  @override
  void dispose() {
    controller?.dispose();
    super.dispose();
  }
}

void _goNext() async{
  if(await SharedPref.haveLogin()){
    Navigator.pushReplacementNamed(context, Routes.homeRoute);
  }else{
    Navigator.pushReplacementNamed(context, Routes.loginRoute);
  }
}
