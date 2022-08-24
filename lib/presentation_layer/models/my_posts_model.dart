class MyPostsModel {

  List<PostData>? data;

  MyPostsModel.fromJson(Map<String, dynamic> json) {
    if (json['data'] != null) {
      data =[];
      json['data'].forEach((element) {
        data!.add(PostData.fromJson(element));
      });
    }
  }
}

class  PostData {

  String? forumId;
  String? title;
  String? description;
  String? imageUrl;
  String? userId;
  List<dynamic>? forumLikes;
  List<dynamic>? forumComments;
  User? user;
  PostData.fromJson(Map<String, dynamic> json) {
    forumId = json['forumId'];
    title = json['title'];
    description = json['description'];
    imageUrl = json['imageUrl'];
    userId = json['userId'];
    if (json['ForumLikes'] != null) {
      forumLikes = [];
      json['ForumLikes'].forEach((element) {
        forumLikes!.add(element);
      });
    }
    if (json['ForumComments'] != null) {
      forumComments = [];
      json['ForumComments'].forEach((element) {
        forumComments!.add(element);
      });
    }
    user = json['user'] != null ?  User.fromJson(json['user']) : null;
  }
}

class User {
  String? firstName;
  String? lastName;
  String? imageUrl;

  User.fromJson(Map<String, dynamic> json) {
    firstName = json['firstName'];
    lastName = json['lastName'];
    imageUrl = json['imageUrl'];
  }
}