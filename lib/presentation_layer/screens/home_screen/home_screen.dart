import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:lavie/data_layer/bloc/GeneralCubit/general_cubit.dart';
import 'package:lavie/data_layer/bloc/GeneralCubit/general_states.dart';
import 'package:lavie/data_layer/cach_helper/cach_helper.dart';
import 'package:lavie/presentation_layer/shared/component/default_navigation.dart';
import 'package:lavie/presentation_layer/shared/resources/assets_manger.dart';
import 'package:lavie/presentation_layer/shared/widget/card_botton.dart';
import 'package:lavie/presentation_layer/shared/widget/gredview_of_products.dart';
import 'package:lavie/presentation_layer/shared/widget/search_bar.dart';
import '../../../application_layer/routes_manager.dart';
import '../../shared/widget/category_list_view.dart';

class HomeScreen extends StatelessWidget {

  @override
  Widget build(BuildContext context) {
    return BlocConsumer<GeneralLavieCubit, GeneralLavieStates>(
      listener: (context, state) {},
      builder: (context, state) {
        var cubit =GeneralLavieCubit.get(context);
        return Scaffold(
          backgroundColor: Theme.of(context).backgroundColor,
          body: SafeArea(
            child: Padding(
              padding: EdgeInsetsDirectional.only(
                top: 50.h,
                start: 16.h,
                end: 16.h,
              ),
              child: Column(
                mainAxisAlignment: MainAxisAlignment.start,
                crossAxisAlignment: CrossAxisAlignment.center,
                children: [
                   Padding(
                    padding: EdgeInsetsDirectional.only(
                      bottom: 30.h,
                    ),
                    child: Image.asset(AssetsManager.appLogo),
                  ),
                   const SizedBox(
                  height: 10,
                ),
                   Row(
                    children: [
                      Expanded(
                        child: searchBar(
                          context: context,
                          onTap: () {
                            cubit.productsSearchHistory =
                                 CachHelper.sharedPreferences.getStringList("productSearchHistory")??[];

                            Navigation.navigatorTo(
                              context: context,
                              navigatorTo: Routes.searchRoute,
                            );
                          }, enabled: false,
                        ),
                      ),
                      cardBotton(
                        context: context,
                        onTap: () {
                          Navigation.navigatorTo(
                              context: context,
                               navigatorTo: Routes.cartRoute,
                              );
                        },
                      ),
                    ],
                  ),
                   SizedBox(
                     height: 25.h,
                   ),
                   categoryListView(context: context),
                   SizedBox(
                     height: 20.h,
                   ),
                   Expanded(
                     child: state is GetProductsLoadingState ?
                     Center(
                       child: CircularProgressIndicator(
                         color: Theme.of(context).primaryColor,
                       ),
                     ) :
                     greViewOfProducts(context: context),
                   ),
                ],
              ),
            ),
          ),
        );
      },
    );
  }
  }

