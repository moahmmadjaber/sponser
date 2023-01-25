import 'dart:convert';
import 'package:sponsor/Data/api/api.dart';
import 'package:sponsor/Data/model/home/home_model.dart';
import 'package:sponsor/Data/model/login/user_model.dart';
import 'package:sponsor/utilis/shared_pref.dart';

class HomeRepository {
  Api api = Api();
  HomeRepository();
  Future<HomeModel> getData() async {
    try {
      Map<String, dynamic> body = {
        'result': await  SharedPref.getID()
      };
      final res = await api.callApi(
          body, '/V1/api/f3', sendToken: false);
      if (res.isNotEmpty) {
        return HomeModel.fromJson(json.decode(res));
      } else {
        throw 'null';
      }
    } catch (ex) {
      rethrow;
    }
  }
}