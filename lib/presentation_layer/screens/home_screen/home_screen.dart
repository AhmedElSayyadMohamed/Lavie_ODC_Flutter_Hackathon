import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:lavie/data_layer/bloc/GeneralCubit/general_cubit.dart';
import 'package:lavie/data_layer/bloc/GeneralCubit/general_states.dart';
import 'package:lavie/data_layer/cach_helper/cach_helper.dart';
import 'package:lavie/presentation_layer/shared/component/default_navigation.dart';
import 'package:lavie/presentation_layer/shared/resources/assets_manger.dart';
import 'package:lavie/presentation_layer/shared/widget/card_botton.dart';
import 'package:lavie/presentation_layer/shared/widget/custom_app_bar/custom_app_bar.dart';
import 'package:lavie/presentation_layer/shared/widget/custom_circle_progress_indicator/circle_progress_indicator.dart';
import 'package:lavie/presentation_layer/shared/widget/exams_button/exams_button.dart';
import 'package:lavie/presentation_layer/shared/widget/gredview_of_products.dart';
import 'package:lavie/presentation_layer/shared/widget/search_bar.dart';
import '../../../application_layer/routes_manager.dart';
import '../../shared/widget/products_categories/products_categories.dart';

class HomeScreen extends StatelessWidget {
  final search =TextEditingController();
  HomeScreen({Key? key}) : super(key: key);
  @override
  Widget build(BuildContext context) {
    return BlocConsumer<GeneralLavieCubit, GeneralLavieStates>(
      listener: (context, state) {},
      builder: (context, state) {
        var cubit = GeneralLavieCubit.get(context);
        return Scaffold(
          appBar: CustomAppBar(
            action: [
              ExamsButton(
                onTap: () {},
              )
            ],
          ),
          body: SafeArea(
            child: Padding(
              padding: EdgeInsetsDirectional.only(
                start: 16.h,
                end: 16.h,
              ),
              child: Column(
                children: [
                  Image.asset(AssetsManager.appLogo),
                  SizedBox(
                    height: 40.h,
                  ),
                  Row(
                    children: [
                      Expanded(
                        child: CustomSearchBar(
                          enabled: false,
                          onTap: () {
                                cubit.productsSearchHistory =
                                CachHelper.sharedPreferences.getStringList("productSearchHistory") ??[];
                                Navigation.navigatorTo(
                              context: context,
                              navigatorTo: Routes.searchRoute,
                            );
                          }, searchController: search,
                        ),
                      ),
                      CustomCardButton(
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
                  const ProductHomeCategories(),
                  SizedBox(
                    height: 20.h,
                  ),
                  Expanded(
                    child: state is GetProductsLoadingState
                        ? const CustomCircleProgressIndicator()
                        : const ProductGridView(),
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