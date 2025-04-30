class RegisterResponseModel {
  final int? id;


  RegisterResponseModel({this.id});

  factory RegisterResponseModel.fromJson(Map<String, dynamic> json) {
    return RegisterResponseModel(
      id: json['id'],
    );
  }

}
