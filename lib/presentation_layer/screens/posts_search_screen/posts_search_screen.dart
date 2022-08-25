import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:lavie/data_layer/bloc/GeneralCubit/general_cubit.dart';
import 'package:lavie/data_layer/bloc/GeneralCubit/general_states.dart';
import 'package:lavie/data_layer/cach_helper/cach_helper.dart';
import 'package:lavie/presentation_layer/shared/resources/controllers.dart';
import 'package:lavie/presentation_layer/shared/widget/empty_cart_widgt.dart';
import 'package:lavie/presentation_layer/shared/widget/post_item.dart';
import 'package:lavie/presentation_layer/shared/widget/recent_search_list_view.dart';
import 'package:lavie/presentation_layer/shared/widget/search_bar.dart';
import 'package:lavie/presentation_layer/shared/widget/card_search_item.dart';
import '../../shared/component/default_navigation.dart';

class PostsSearchScreen extends StatelessWidget {
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
                    IconButton(
                      padding: EdgeInsets.zero,
                      splashRadius: 30,
                      onPressed: () {
                        Navigation.navigatorBack(context: context);
                      },
                      icon: const Icon(Icons.arrow_back),
                    ),
                    Expanded(
                      child: searchBar(
                          context: context,
                          enabled: true,
                          searchController:
                          AppControllers.postsSearchController,
                          onSubmitted: (value) {
                          },
                          onChanged: (value) {

                          }),
                    ),
                  ],
                ),
                Expanded(
                  child: cubit.productsSearchResult.isEmpty ?
                  recentSearchHistory(context: context)
                      : ListView.separated(
                    itemBuilder: (context, index) =>
                        postItem(
                          context: context,
                          userImage:"cubit.myPostsModel!.data![index].user!.imageUrl.toString()" ,
                          firstName:"cubit.myPostsModel!.data![index].user!.firstName.toString()",
                          lastName: "cubit.myPostsModel!.data![index].user!.lastName.toString()",
                          postDate: "yesterday",
                          postTitle:"cubit.myPostsModel!.data![index].title.toString()" ,
                          postContaining:"cubit.myPostsModel!.data![index].description.toString()",
                          postImage:"cubit.myPostsModel!.data![index].imageUrl.toString() ",
                          likes:0,
                          replies:1,
                          onTapUserImage: () {  },
                          onTapReplies: () {  },
                          onTapLike: () {  },
                          onTapUserName: () {  },
                        ),
                    separatorBuilder: (context, int index) =>
                    const SizedBox(
                      height: 5,
                    ),
                    itemCount: 2,
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

