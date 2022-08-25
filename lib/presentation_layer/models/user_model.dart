// class UserModel {
//   static Map<String,dynamic>? data;
//
//
//   static  String getUId(){
//
//     return data!["data"]["userId"];
//   }
//   static  String getName(){
//
//     return data!["data"]["firstName"]+data!["data"]["lastName"];
//   }
//   static  String getEmail(){
//
//     return data!["data"]["email"];
//   }
//   static  String getImageUrl(){
//
//     return data!["data"]["imageUrl"];
//   }
//   static  String getAddress(){
//
//     return data!["data"]["address"];
//   }
//   static  int getUserPoints(){
//     if(data!["data"]["UserPoints"]!=null){
//       return data!["data"]["UserPoints"];
//     }
//     else{
//       return 0;
//     }
//   }
//   static  List<dynamic> getUserNotification(){
//
//     return data!["data"]["UserNotification"];
//   }
//
// }

class UserModel {
  Data? data;


  UserModel.fromJson(Map<String, dynamic> json) {
    data = json['data'] != null ? Data.fromJson(json['data']) : null;
  }
}

class Data {
  String? userId;
  String? firstName;
  String? lastName;
  String? email;
  String? imageUrl;
  String? address;
  String? role;
  int? userPoints;
  List<UserNotification>? userNotification;


  Data.fromJson(Map<String, dynamic> json) {
    userId = json['userId'];
    firstName = json['firstName'];
    lastName = json['lastName'];
    email = json['email'];
    imageUrl = json['imageUrl'];
    address = json['address'];
    role = json['role'];
    userPoints = json['UserPoints'] ?? 0;

    if (json['UserNotification'] != null) {
      userNotification = [];
      json['UserNotification'].forEach((element) {
        userNotification!.add( UserNotification.fromJson(element));
      });
    }
  }

}

class UserNotification {
  String? notificationId;
  String? userId;
  String? imageUrl;
  String? message;
  String? createdAt;

  UserNotification.fromJson(Map<String, dynamic> json) {
    notificationId = json['notificationId'];
    userId = json['userId'];
    imageUrl = json['imageUrl'];
    message = json['message'];
    createdAt = json['createdAt'];
  }


}