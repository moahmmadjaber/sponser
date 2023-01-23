class HomeModel{

  String? first_Name;
  bool? status;

  HomeModel(
      {this.first_Name,this.status});

  HomeModel.fromJson(Map<String, dynamic> json) {
    first_Name = json['first_name'];
    status=json['status'];
  }
}