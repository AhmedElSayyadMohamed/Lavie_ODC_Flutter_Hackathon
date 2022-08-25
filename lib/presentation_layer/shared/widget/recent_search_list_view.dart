import 'package:flutter/material.dart';
import 'package:lavie/data_layer/bloc/GeneralCubit/general_cubit.dart';
import 'package:lavie/data_layer/bloc/GeneralCubit/general_states.dart';
import 'package:lavie/data_layer/cach_helper/cach_helper.dart';
import 'package:lavie/presentation_layer/shared/resources/controllers.dart';
import 'package:lavie/presentation_layer/shared/widget/recent_search_item.dart';

Widget recentSearchHistory({required BuildContext context}) {
  var cubit = GeneralLavieCubit.get(context);
  return Column(
    crossAxisAlignment: CrossAxisAlignment.start,
    children: [
      Padding(
        padding: const EdgeInsets.all(24.0),
        child: Text(
          "Recent searchs",
          style: Theme.of(context).textTheme.subtitle1,
        ),
      ),
      const SizedBox(
        height: 5,
      ),
      Expanded(
        child: ListView.separated(
          itemBuilder: (context, index) => recentSearch(
            context: context,
            title: cubit.productsSearchHistory[index],
            onTapDelete: () {
              cubit.productsSearchHistory.removeAt(index);
              CachHelper.sharedPreferences.setStringList(
                  "productSearchHistory", cubit.productsSearchHistory);
              cubit.productsSearchHistory = CachHelper.sharedPreferences
                  .getStringList("productSearchHistory") ??
                  [];
              cubit.emit(SearchAboutProductState());
            },
            onTap: () {
              AppControllers.productsSearchController.text =
              cubit.productsSearchHistory[index];
            },
          ),
          separatorBuilder: (BuildContext context, int index) => const SizedBox(
            height: 10,
          ),
          itemCount: cubit.productsSearchHistory.length,
        ),
      )
    ],
  );
}
