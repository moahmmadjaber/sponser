
import 'dart:convert';
import 'package:sponsor/Data/api/api.dart';
import 'package:sponsor/Data/model/login/user_model.dart';

class LoginRepository {
  Api api = Api();

  LoginRepository();

  Future<UserModel> login(result) async {
    try {
      Map<String, dynamic> body = {
        'result': result
      };
      final res = await api.callApi(
          body, '/V1/api/f', sendToken: false);
      if (res.isNotEmpty) {
        return UserModel.fromJson(json.decode(res));
      } else {
        throw 'null';
      }
    } catch (ex) {
      rethrow;
    }
  }
}