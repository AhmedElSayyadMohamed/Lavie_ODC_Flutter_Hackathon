import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:lavie/data_layer/bloc/GeneralCubit/general_cubit.dart';
import 'package:lavie/data_layer/bloc/GeneralCubit/general_states.dart';
import 'package:lavie/presentation_layer/shared/component/default_navigation.dart';
import 'package:lavie/presentation_layer/shared/resources/assets_manger.dart';
import 'package:lavie/presentation_layer/shared/widget/card_botton.dart';
import 'package:lavie/presentation_layer/shared/widget/search_bar.dart';
import '../../../application_layer/routes_manager.dart';
import '../../shared/widget/category_list_view.dart';
import '../../shared/widget/product_grid_view.dart';

class HomeScreen extends StatelessWidget {
  const HomeScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return BlocConsumer<GeneralLavieCubit, GeneralLavieStates>(
      listener: (context, state) {},
      builder: (context, state) {
        return Scaffold(
          backgroundColor: Theme.of(context).backgroundColor,
          body: SafeArea(
            child: Padding(
              padding: EdgeInsetsDirectional.only(
                top: 50.h,
                start: 16.h,
                end: 16.h,
              ),
              child: SingleChildScrollView(
                physics: const BouncingScrollPhysics(),
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
                    sizedBoxSpace(context: context),
                    Row(
                      children: [
                        searchBar(
                          context: context,
                          onTap: () {
                            Navigation.navigatorTo(
                              context: context,
                              navigatorTo: Routes.searchRoute,
                            );
                          },
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
                    sizedBoxSpace(context: context),
                    categoryListView(
                      context: context,
                      onTap: () {},
                    ),
                    sizedBoxSpace(context: context),
                    productGridView(
                      context: context,
                      title: "title",
                      price: "price",
                      tapToCard: () {},
                      removeTap: () {},
                      addTap: () {},
                      quantity: "1",
                      imageURL: "assets/images/tree2.png",
                    ),
                  ],
                ),
              ),
            ),
          ),
        );
      },
    );
  }

  Widget sizedBoxSpace({
    required BuildContext context,
  }) {
    return SizedBox(
      height: 35.h,
    );
  }
}
