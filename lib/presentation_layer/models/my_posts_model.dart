class MyPostsModel {
  PostData data = PostData();
  MyPostsModel.fromJson(Map<String, dynamic> json) {
    data = PostData.fromJson(json) ;
  }
}

class PostData {
  String? forumId;
  String title =' ';
  String? description;
  String? imageUrl;
  String? userId;
  List<ForumLikes>? forumLikes;
  List<ForumComments>? forumComments;
  User? user;

  PostData();
  PostData.fromJson(Map<String, dynamic> json) {
    forumId = json['forumId'];
    title = json['title'];
    description = json['description'];
    imageUrl = json['imageUrl'];
    userId = json['userId'];
    if (json['ForumLikes'] != null) {
      forumLikes =[];
      json['ForumLikes'].forEach((v) {
        forumLikes!.add( ForumLikes.fromJson(v));
      });
    }
    if (json['ForumComments'] != null) {
      forumComments = [];
      json['ForumComments'].forEach((v) {
        forumComments!.add( ForumComments.fromJson(v));
      });
    }
    user = json['user'] != null ?  User.fromJson(json['user']) : null;
  }
}

class ForumLikes {
  String? forumId;
  String? userId;

  ForumLikes.fromJson(Map<String, dynamic> json) {
    forumId = json['forumId'];
    userId = json['userId'];
  }
}

class ForumComments {
  String? forumCommentId;
  String? forumId;
  String? userId;
  String? comment;
  String? createdAt;

  ForumComments.fromJson(Map<String, dynamic> json) {
    forumCommentId = json['forumCommentId'];
    forumId = json['forumId'];
    userId = json['userId'];
    comment = json['comment'];
    createdAt = json['createdAt'];
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