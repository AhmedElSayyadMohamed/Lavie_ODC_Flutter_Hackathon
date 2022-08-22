class UserModel {
  static Map<String,dynamic>? data;


  static  String getUId(){

    return data!["data"]["userId"];
  }
  static  String getName(){

    return data!["data"]["firstName"]+data!["data"]["lastName"];
  }
  static  String getEmail(){

    return data!["data"]["email"];
  }
  static  String getImageUrl(){

    return data!["data"]["imageUrl"];
  }
  static  String getAddress(){

    return data!["data"]["address"];
  }
  static  int getUserPoints(){
    if(data!["data"]["UserPoints"]!=null){
      return data!["data"]["UserPoints"];
    }
    else{
      return 0;
    }
  }
  static  List<dynamic> getUserNotification(){

    return data!["data"]["UserNotification"];
  }

}