class UserDataModel {
  UserModel? data;

  UserDataModel.formJson(Map<String, dynamic> json) {
    data = json["data"] != null ? UserModel.fromJson(json["data"]) : null;
  }
}

class UserModel {
  DataModel? user;
  String? accessToken;
  String? refreshToken;

  UserModel.fromJson(Map<String, dynamic> json) {
    user = json["user"] != null ? DataModel.fromJson(json["user"]) : null;
    accessToken = json["accessToken"];
    refreshToken = json["refreshToken"];
  }
}

class DataModel {
  String? id;
  String? firstName;
  String? lastName;
  String? email;
  String? imageUrl;
  String? address;
  String? role;

  DataModel.fromJson(Map<String, dynamic> json) {
    id = json["userId"];
    firstName = json["firstName"];
    lastName = json["lastName"];
    email = json["email"];
    imageUrl = json["imageUrl"];
    address = json["address"];
    role = json["role"];
  }
}