import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:lavie/data_layer/bloc/GeneralCubit/general_cubit.dart';
import 'package:lavie/data_layer/bloc/GeneralCubit/general_states.dart';
import 'package:lavie/data_layer/cach_helper/cach_helper.dart';
import 'package:lavie/presentation_layer/shared/resources/controllers.dart';
import 'package:lavie/presentation_layer/shared/widget/empty_cart_widgt.dart';
import 'package:lavie/presentation_layer/shared/widget/recent_search_list_view.dart';
import 'package:lavie/presentation_layer/shared/widget/search_bar.dart';
import 'package:lavie/presentation_layer/shared/widget/card_search_item.dart';
import '../../shared/component/default_navigation.dart';

class SearchScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return BlocConsumer<GeneralLavieCubit, GeneralLavieStates>(
      listener: (context, state) {},
      builder: (context, state) {
        var cubit = GeneralLavieCubit.get(context);
        return Scaffold(
          backgroundColor: Theme.of(context).backgroundColor,
          body: SafeArea(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Row(
                  children: [
                    const BackButton(),
                    Expanded(
                      child: CustomSearchBar(
                          enabled: true,
                          searchController:AppControllers.productsSearchController,
                          onSubmitted: (value) {
                            if(value.isNotEmpty) {
                              cubit.productsSearchHistory.add(value);
                              CachHelper.sharedPreferences.setStringList("productSearchHistory", cubit.productsSearchHistory);
                            }
                            cubit.searchByName(value: value, context: context).then((value) {
                              cubit.productNotFoundAfterSearch =true;
                              cubit.emit(SearchAboutProductState());
                            });
                          },
                          onChanged: (value) {
                            if (value.isEmpty) {
                              cubit.productsSearchResult = [];
                              cubit.emit(SearchAboutProductState());
                            }
                          }),
                    ),
                  ],
                ),
               Expanded(
                  child: cubit.productsSearchResult.isEmpty ?
                        recentSearchHistory(context: context)
                      : ListView.separated(
                          itemBuilder: (context, index) => cardSearchItem(
                            context: context,
                            image: cubit.productsSearchResult[index].imageUrl
                                .toString(),
                            name: cubit.productsSearchResult[index].name
                                .toString(),
                            description: cubit
                                .productsSearchResult[index].description
                                .toString(),
                            price: cubit.productsSearchResult[index].price,
                          ),
                          separatorBuilder: (context, int index) =>
                              const SizedBox(
                            height: 5,
                          ),
                          itemCount: cubit.productsSearchResult.length,
                        ),
                )
              ],
            ),
          ),
        );
      },
    );
  }
}

