class UserModel {
  String? first_name;
  bool? status;

  UserModel(
      {this.first_name,
        this.status


      });

  factory UserModel.fromJson(json) {
    return UserModel(
      first_name: json['first_name'] as String,
      status:json['status'] as bool

    );
  }
}
