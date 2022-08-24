import 'dart:io';

import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:image_picker/image_picker.dart';
import 'package:lavie/data_layer/bloc/GeneralCubit/general_states.dart';
import 'package:lavie/data_layer/database/local_database/database_helper.dart';
import 'package:lavie/data_layer/dio_helper/dio_helper.dart';
import 'package:lavie/data_layer/dio_helper/end_points.dart';
import 'package:lavie/presentation_layer/models/product_model.dart';
import 'package:lavie/presentation_layer/screens/blogs_Screen/blogs_screen.dart';
import 'package:lavie/presentation_layer/screens/home_screen/home_screen.dart';
import 'package:lavie/presentation_layer/screens/notification_screen/notification_screen.dart';
import 'package:lavie/presentation_layer/screens/scan_screen/scan_screen.dart';
import 'package:lavie/presentation_layer/screens/user_profile_screen/user_profile_screen.dart';
import 'package:lavie/presentation_layer/shared/constant/constant.dart';
import 'package:permission_handler/permission_handler.dart';
import 'package:sqflite/sqflite.dart';

import '../../../presentation_layer/models/blog_model.dart';
import '../../../presentation_layer/models/user_model.dart';

class GeneralLavieCubit extends Cubit<GeneralLavieStates> {
  GeneralLavieCubit() : super(InitialState());
  static GeneralLavieCubit get(BuildContext context) => BlocProvider.of(context);

  // variables
  int  currentBottomNavIndex = 2;
  int  filterCategoryButtonIndex = 0;
  bool toggleBetweenAllForumAndMyForum = true;
  int increaseProductInCard=0;
  int decreaseProductInCard=0;
  int totalOfPill = 0;
  List<Product> products=[];
  List<dynamic> cardItems = [];

  List<Widget> screen = [
    BlogsScreen(),
    const ScanScreen(),
    HomeScreen(),
    NotificationScreen(),
    ProfileScreen(),
  ];


  //Methods
  Future<void> changeBottomNavBarIndex(index)async {

    if(index==0)await getAllBlogs();
    if(index==4)await getUserData();
    currentBottomNavIndex = index;

    emit(ChangeBottomNavIndexState());
  }

  void changeCategoryIndex(index) {
    filterCategoryButtonIndex = index;

    if(index==0){
      products = ProductModel.allProduct;
    }
    if(index==1) {
      products = ProductModel.plants;
    } else if(index ==2){
      products = ProductModel.seeds;
    }
    else if(index ==3){
      products =ProductModel.tools;
    }

    emit(ChangeCategoryIndexState());
  }

  void changProductWhichGoToCardIndex(index) {
    ProductModel.allProduct[index].inCard=!ProductModel.allProduct[index].inCard;
    emit(ChangeProductWhichGoToCardIndexState());
  }

  void toggleBetweenAllForumAndMyForumButton({
  required bool isALlForum
  }) {
    toggleBetweenAllForumAndMyForum = isALlForum;
    emit(ChangeIsAllForumState());
  }

 void incrementQuantityOfProduct({
  required int index,
}){
      ProductModel.allProduct[index].quantity++;
      emit(IncrementQuantityOfProduct());
 }

 void decrementQuantityOfProduct({
  required int index,
 }
){
   if(ProductModel.allProduct[index].quantity>1){
     ProductModel.allProduct[index].quantity--;
     emit(DecrementQuantityOfProduct());

   }
 }

  void incrementQuantityOfProductInCard({
    required int quantity,
  }){
    increaseProductInCard=quantity;
    increaseProductInCard++;
    emit(IncrementQuantityOfProduct());

  }

  void decrementQuantityOfProductInCard({
    required int quantity,
  }
      ){
    if(quantity>1){
      decreaseProductInCard=quantity;
      decreaseProductInCard--;
      emit(DecrementQuantityOfProduct());

    }
  }

  int calculateTotalOfPill(){
    int total =0;
    totalOfPill =0;
    cardItems.forEach((element) {
     total=element["price"]*element["quantity"];
    totalOfPill +=total;
    });

    return totalOfPill;
  }


  // create ProductDatabase
  void initProductDatabase()async{

    openDatabase("product.db",
        version: 1,
        onCreate: (db, version) {

          print('database created');
          return db.execute(
              'CREATE TABLE  product(id INTEGER PRIMARY KEY,image TEXT,title TEXT,price INTEGER,quantity INTEGER,status TEXT)').
          then((value){ print('table created');}).
          catchError((error){ print('error when create table : ${error.toString()}');});},

        onOpen: (database) {
          print('database opened');
         DatabaseHelper.getFromDatabase(database).then((value) {

            cardItems=value;
          }).catchError((error) {
            print('error when get :${error.toString()}');
          });
        }).then((value) {
      productDatabase =value;
    }).catchError((error){
      print(("error when create product database :${error.toString()}"));
    });
  }

  //getUserData

  Future<void> getUserData()async {
    emit(GetUserDataLoadingState());
   await DioHelper.getData(
      url:EndPoints.getUserData,
      token:token,
   ).then((value){
    UserModel.data =Map<String,dynamic>.from(value.data);
    emit(GetUserDataSuccessState());
  }).catchError((error){
     print("error When getUserdata :${error.toString()}");
    emit(GetUserDataErrorState());
    });

  }


  // pickImage
  final ImagePicker _imagePicker = ImagePicker();
  File? postImage;

  // void pickImageFromGallary({
  //   bool isProfileImage = false,
  //   bool isPostImage = false,
  // }) async {
  //
  //   //Check Permissions
  //   var permissionStatus = await Permission.photos.status;
  //   await Permission.photos.request();
  //
  //   if (permissionStatus.isGranted) {
  //     //Select Image
  //     var pikedFile = await _imagePicker.pickImage(source: ImageSource.gallery);
  //     if (pikedFile != null) {
  //       if (ispostImage) {
  //         emit(PickPostImageLoadingState());
  //         postImage = File(pikedFile.path);
  //         print("post image: ${postImage}");
  //
  //         ispostImage = false;
  //         emit(PickPostImageSuccessState());
  //       }
  //       if (isProfileImage) {
  //         profileImage = File(pikedFile.path);
  //       } else {
  //         coverImage = File(pikedFile.path);
  //       }
  //
  //       emit(PickCoverImageSuccessState());
  //     } else {
  //       print('No Image Path Received');
  //       emit(PickCoverImageErrorState());
  //     }
  //   } else {
  //     print("permission to gallary is denied");
  //   }
  // }

  Future<void> editUserData({
  required String firstName,
  required String lastName,
  // required String email,
  // required String address,
})async {
    emit(EditUserDataLoadingState());
   await DioHelper.patchData(
       url: EndPoints.updateUserData,
       data:{
           "firstName": "firstName",
           "lastName": lastName,
           // "email": email,
           // "address": "tempor elit sed"
         },

   ).then((value){
    emit(EditUserDataSuccessState());
  }).catchError((error){
     print("error When editUserdata :${error.toString()}");
    emit(EditUserDataErrorState());
    });

  }


  //getBLogs
  BlogDataModel? blogsModel;
  Future<void> getAllBlogs()async {

    emit(GetAllBlogsLoadingState());
   await DioHelper.getData(
      url:EndPoints.getBlogs,
      token:token,
   ).then((value){
     blogsModel = BlogDataModel.fromJson(value.data) ;
     emit(GetAllBlogsSuccessState());
  }).catchError((error){
     debugPrint("error When GetAllBlogs :${error.toString()}");
     emit(GetAllBlogsErrorState());
    });

  }


  //getProducts
  Future<void> getProducts()async {
    emit(GetProductsLoadingState());
   await DioHelper.getData(
      url:EndPoints.getProducts,
      token:token,
   ).then((value){

      ProductModel.fromJson(value.data) ;
      products =ProductModel.allProduct;
      emit(GetProductsSuccessState());
  }).catchError((error){
     debugPrint("error When GetProducts :${error.toString()}");
     emit(GetProductsErrorState());
    });

  }



}
