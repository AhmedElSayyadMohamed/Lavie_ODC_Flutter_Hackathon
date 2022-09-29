import 'package:flutter/cupertino.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:lavie/data_layer/bloc/GeneralCubit/general_cubit.dart';
import 'package:lavie/data_layer/bloc/GeneralCubit/general_states.dart';
import 'package:lavie/presentation_layer/screens/cart_screen/cart_screen.dart';
import 'package:lavie/presentation_layer/shared/widget/product_card.dart';
import '../../../data_layer/database/local_database/database_helper.dart';
import '../../../data_layer/dio_helper/end_points.dart';
import '../../models/product_model.dart';
import '../component/flutter_toast.dart';

class ProductGridView extends StatelessWidget{

  const ProductGridView({Key? key}) : super(key: key);
  @override
  Widget build(BuildContext context) {
    var cubit =GeneralLavieCubit.get(context);
    return BlocBuilder<GeneralLavieCubit,GeneralLavieStates>(
      builder: (BuildContext context, state) {
        return GridView.builder(
          physics:const BouncingScrollPhysics(),
          scrollDirection: Axis.vertical,
          shrinkWrap: true,
          gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
            crossAxisCount: 2,
            crossAxisSpacing: 2,
            mainAxisSpacing: 2,
            mainAxisExtent: MediaQuery.of(context).size.height * 0.4,
          ),
          itemCount:  cubit.products.length,
          itemBuilder: (context, index) =>
              ProductItem(
                title: cubit.products[index].name,
                price: cubit.products[index].price,
                quantity: cubit.products[index].quantity,
                imageURL: cubit.products[index].imageUrl,
                index: index,
                tapToCard: ()async{
                  cubit.changProductWhichGoToCardIndex(index);
                  await
                  DatabaseHelper.addProductToDatabase(
                    image: EndPoints.baseUrl+cubit.products[index].imageUrl.toString(),
                    title: cubit.products[index].name.toString(),
                    quantity:cubit.products[index].quantity,
                    context:context,
                    price: cubit.products[index].price,
                  ).then((value) {
                    Alarm.flutterToast(
                      massage:"${ProductModel.allProduct[index].name} added to Card Successfully",
                      toastState: ToastState.success,
                    );
                  }).catchError((error){
                    debugPrint("error when add ${cubit.products[index].name} to Card :${error.toString()} ");});
                },
                removeTap:(){cubit.decrementQuantityOfProduct(index: index);},
                addTap: (){ cubit.incrementQuantityOfProduct(index: index);},
                goToCard: () {
                  Navigator.push(context, CupertinoPageRoute(builder:(context)=>CardScreen()));
                },
              ),
        );
      },
    );
  }
}
