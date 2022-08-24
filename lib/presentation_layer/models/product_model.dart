
class ProductModel {

 static List<Product> allProduct = [];
  List<Product> plants = [];
  List<Product> seeds = [];
  List<Product> tools = [];

  ProductModel.fromJson(Map<String, dynamic> json) {
    if (json['data'] != null) {
      json['data'].forEach((element) {
          if(element["type"]=="PLANT"){

              allProduct.add(Product.fromJson(element));
              plants.add(Product.fromJson(element));
           }
          if(element["type"]=="TOOL"){

            allProduct.add(Product.fromJson(element));
            tools.add(Product.fromJson(element));
          }
          if(element["type"]=="SEED"){

            allProduct.add(Product.fromJson(element));
            seeds.add(Product.fromJson(element));
          }
      });
    }

  }
}

class Product{

  String? id;
  String? name;
  String? description;
  String? imageUrl;
  String? type;
  int? price;
  int quantity = 1;
  bool inCard  = false;
  Product.fromJson(Map<String, dynamic> json) {

    name  = json['name'];
    description  = json['description'];
    imageUrl  = json['imageUrl'];
    type  = json['type'];
    price = json['price'];

  }
}
