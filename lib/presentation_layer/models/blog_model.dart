
class BlogDataModel {
  BlogsModel? data;
  BlogDataModel.fromJson(Map<String, dynamic> json) {
    data = BlogsModel.fromJson(json['data']);
  }
}

class BlogsModel {
   List<dynamic> blogs=[];

  BlogsModel.fromJson(Map<String, dynamic> json) {

    if (json['plants'] != null) {
      json['plants'].forEach((element) {
        blogs.add(PlantData.fromJson(element));
      });

    }
    if (json['seeds'] != null) {
      json['seeds'].forEach((element) {
        blogs.add(SeedData.fromJson(element));
      });
    }
    if (json['tools'] != null) {
      json['tools'].forEach((element) {
        blogs.add(ToolData.fromJson(element));
      });
    }
  }

}

class PlantData{
  String? id;
  String? name;
  String? description;
  String? imageUrl;

  PlantData.fromJson(Map<String, dynamic> json) {

    id = json['plantId'];
    name = json['name'];
    description = json['description'];
    imageUrl = json['imageUrl'];

  }
}
class SeedData{
  String? id;
  String? name;
  String? description;
  String? imageUrl;

  SeedData.fromJson(Map<String, dynamic> json) {
    id = json['seedId'];
    name = json['name'];
    description = json['description'];
    imageUrl = json['imageUrl'];

  }
}
class ToolData{
  String? id;
  String? name;
  String? description;
  String? imageUrl;

  ToolData.fromJson(Map<String, dynamic> json) {
    id = json['toolId'];
    name = json['name'];
    description = json['description'];
    imageUrl = json['imageUrl'];

  }
}

