import 'package:flutter/material.dart';
import 'package:lavie/data_layer/bloc/GeneralCubit/general_cubit.dart';
import 'package:lavie/data_layer/bloc/GeneralCubit/general_states.dart';
import 'package:sqflite/sqflite.dart';
 Database? productDatabase;

class DatabaseHelper{

 static Future addProductToDatabase({
    required String image,
    required String title,
    required int? price,
    required int quantity,
    required BuildContext context,
  }) async {

   var cubit =GeneralLavieCubit.get(context);
     cubit.emit(AddProductToDatabaseLoadingState());
    await productDatabase!
        .rawInsert(
        'INSERT INTO product (image,title,price,quantity,status) '
         'VALUES ("$image","$title","$price","$quantity","new")')
        .then((value) {
         print('$value Successfully inserted');
         getFromDatabase(productDatabase).then((value) {
           cubit.cardItems =value;
           cubit.emit(GetProductDatabaseSuccessfullyState());

         }).catchError((error) {
           print('error when get :${error.toString()}');
         });
         cubit.emit(AddProductToDatabaseSuccessfullyState());

    }).catchError((error) {
         print('error when inserted record : ${error.toString()}');
         cubit.emit(AddProductToDatabaseErrorState());

    });
         }


 static Future<List<dynamic>> getFromDatabase(database) async {
    return await database!.rawQuery('SELECT* FROM product');
  }

 static void updateRecordInDatabase({
    required int quantity,
    required int id,
    required BuildContext context,
  }) {
    var cubit =GeneralLavieCubit.get(context);
    productDatabase!.rawUpdate(
        'UPDATE product SET quantity =? WHERE id =?',
        [quantity, id]).then((value) {

      getFromDatabase(productDatabase).then((value){
        cubit.cardItems=[];
        cubit.cardItems =value;
        cubit.emit(DeleteProductFromDatabaseState());
      }).catchError((error){
        print("error when get products from database after delete record :${error.toString()}");
      });
      }).catchError((error) {
      print('error when update :${error.toString()}');
      });
  }

static  Future<void> deleteRecordFromDatabase({
  required int id,
  required BuildContext context,
})async {
   var cubit =GeneralLavieCubit.get(context);

   await productDatabase!.rawDelete('DELETE FROM product WHERE id =? ', [id]).
    then((value) {

     getFromDatabase(productDatabase).then((value){
       cubit.cardItems=[];
       cubit.cardItems =value;
       cubit.emit(DeleteProductFromDatabaseState());
     }).catchError((error){
       print("error when get products from database after delete record :${error.toString()}");
     });
    }).catchError((error) {
      print('error when delete record :${error.toString()}');
    });
  }
}
