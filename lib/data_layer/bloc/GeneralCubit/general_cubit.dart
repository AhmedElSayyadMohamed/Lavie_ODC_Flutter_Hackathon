import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
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
import 'package:sqflite/sqflite.dart';
import '../../../presentation_layer/models/blog_model.dart';

class GeneralLavieCubit extends Cubit<GeneralLavieStates> {
  GeneralLavieCubit() : super(InitialState());

  static GeneralLavieCubit get(BuildContext context) =>
      BlocProvider.of(context);

  /////////////////////////////// variables ///////////////////////

  int currentBottomNavIndex = 2;
  int filterCategoryButtonIndex = 0;
  int increaseProductInCard = 0;
  int decreaseProductInCard = 0;
  int totalOfPill = 0;
  bool productNotFoundAfterSearch = false;
  List<Product> products = [];
  List<dynamic> cardItems = [];
  List<Product> productsSearchResult = [];
  List<String> productsSearchHistory =[];

  List<Widget> screen = [
    BlogsScreen(),
    const ScanScreen(),
    HomeScreen(),
    NotificationScreen(),
    ProfileScreen(),
  ];

  ///////////////////////// Methods //////////////////////////////

  Future<void> changeBottomNavBarIndex(index) async {
    if (index == 0) await getAllBlogs();

    currentBottomNavIndex = index;
    emit(ChangeBottomNavIndexState());
  }

  //filter product by category
  void filterProductByCategory(index) {
    filterCategoryButtonIndex = index;

    if (index == 0) {
      products = [];
      products.addAll(ProductModel.allProduct);
    }
    if (index == 1) {
      products = [];
      products.addAll(ProductModel.plants);
    } else if (index == 2) {
      products = [];
      products.addAll(ProductModel.seeds);
    } else if (index == 3) {
      products = [];
      products.addAll(ProductModel.tools);
    }

    emit(ChangeCategoryIndexState());
  }

  // move product to card
  void changProductWhichGoToCardIndex(index) {
    products[index].inCard = !products[index].inCard;
    emit(ChangeProductWhichGoToCardIndexState());
  }

  //increment  when product in homeScreen
  incrementQuantityOfProduct({
    required int index,
  }) {
    products[index].quantity++;
    emit(IncrementQuantityOfProduct());
  }

  //decrement  when product in homeScreen
  decrementQuantityOfProduct({
    required int index,
  }) {
    if (products[index].quantity > 1) {
      products[index].quantity--;
      emit(DecrementQuantityOfProduct());
    }
  }

  //increment  when product in card
  void incrementQuantityOfProductInCard({
    required int quantity,
  }) {
    increaseProductInCard = quantity;
    increaseProductInCard++;
    emit(IncrementQuantityOfProduct());
  }

  //decrement  when product in card
  void decrementQuantityOfProductInCard({
    required int quantity,
  }) {
    if (quantity > 1) {
      decreaseProductInCard = quantity;
      decreaseProductInCard--;
      emit(DecrementQuantityOfProduct());
    }
  }

  //calculate pill
  int calculateTotalOfPill() {
    int total = 0;
    totalOfPill = 0;
    cardItems.forEach((element) {
      total = element["price"] * element["quantity"];
      totalOfPill += total;
    });

    return totalOfPill;
  }

  // create ProductDatabase
  void initProductDatabase() async {
    openDatabase("product.db", version: 1, onCreate: (db, version) {
      print('database created');
      return db
          .execute('CREATE TABLE  product(id INTEGER PRIMARY KEY,'
              'image TEXT,title TEXT,price INTEGER,'
              'quantity INTEGER,status TEXT)')
          .then((value) {
        print('table created');
      }).catchError(
        (error) {
          print('error when create table : ${error.toString()}');
        },
      );
    }, onOpen: (database) {
      print('database opened');
      DatabaseHelper.getFromDatabase(database).then((value) {
        cardItems = value;
      }).catchError((error) {
        print('error when get :${error.toString()}');
      });
    }).then((value) {
      productDatabase = value;
    }).catchError((error) {
      print(("error when create product database :${error.toString()}"));
    });
  }

  //getBLogs
  BlogDataModel? blogsModel;

  Future<void> getAllBlogs() async {
    emit(GetAllBlogsLoadingState());
    await DioHelper.getData(
      url: EndPoints.getBlogs,
      token: token,
    ).then((value) {
      blogsModel = BlogDataModel.fromJson(value.data);
      emit(GetAllBlogsSuccessState());
    }).catchError((error) {
      debugPrint("error When GetAllBlogs :${error.toString()}");
      emit(GetAllBlogsErrorState());
    });
  }

  //getProducts
  Future<void> getProducts() async {
    emit(GetProductsLoadingState());
    await DioHelper.getData(
      url: EndPoints.getProducts,
      token: token,
    ).then((value) {
      products = [];
      ProductModel.fromJson(value.data);
      products = ProductModel.allProduct;
      emit(GetProductsSuccessState());
    }).catchError((error) {
      debugPrint("error When GetProducts :${error.toString()}");
      emit(GetProductsErrorState());
    });
  }

  Future<void> searchByName({
    required String value,
    required BuildContext context,
  }) async{
      var cubit = GeneralLavieCubit.get(context);
      cubit.productsSearchResult = cubit.products.where((element) => element.name!.toLowerCase().startsWith(value)).toList();
      emit(SearchAboutProductState());
  }
}
