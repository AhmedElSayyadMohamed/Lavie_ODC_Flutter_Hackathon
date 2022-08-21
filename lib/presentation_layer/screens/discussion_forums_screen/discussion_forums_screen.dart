import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:lavie/data_layer/bloc/GeneralCubit/general_cubit.dart';
import 'package:lavie/data_layer/bloc/GeneralCubit/general_states.dart';
import 'package:lavie/presentation_layer/shared/component/default_button.dart';
import 'package:lavie/presentation_layer/shared/resources/color_manager.dart';
import 'package:lavie/presentation_layer/shared/widget/post_item.dart';
import 'package:lavie/presentation_layer/shared/widget/search_bar.dart';

import '../../shared/component/default_navigation.dart';

class DiscussionForums extends StatelessWidget{
  @override
  Widget build(BuildContext context) {

    var postSearchController=TextEditingController();
    return Scaffold(
      appBar: AppBar(
        leading: IconButton(
          padding: EdgeInsets.zero,
          splashRadius: 30,
          onPressed: () {
            Navigation.navigatorBack(context: context);
          },
          icon: const Icon(Icons.arrow_back_ios),
        ),
        title: Text("DiscussionForums",
          style: Theme.of(context).textTheme.headline3,
        ),
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: () {  },
         child:const Icon(Icons.add),
      ),
      body: Padding(
        padding: EdgeInsets.symmetric(horizontal: 20.w),
        child: BlocConsumer<GeneralLavieCubit,GeneralLavieStates>(
          listener: (context,state){},
          builder: (context,state){
            var cubit =GeneralLavieCubit.get(context);

            return  Padding(
              padding: const EdgeInsets.only(top: 8.0),
              child: Column(
                children: [
                  SizedBox(
                    height: MediaQuery.of(context).size.height*0.09,
                    child: searchBar(
                        context: context,
                      enabled:true,
                      searchController: postSearchController,
                    ),
                  ),
                  Padding(
                    padding: const EdgeInsets.symmetric(horizontal: 8.0,vertical: 10),
                    child: Row(
                      children: [
                        DefaultButton(
                          height: 40,
                          width: 130,
                          label: "All Forums",
                          labelStyle: Theme.of(context).textTheme.subtitle2!.copyWith(
                          color: cubit.toggleBetweenAllForumAndMyForum?
                          ColorManager.white:
                          ColorManager.black,
                          ),
                          borderRadius: 7,
                          borderColor:ColorManager.greyAccent ,
                          buttonColor:cubit.toggleBetweenAllForumAndMyForum?
                          Theme.of(context).primaryColor:
                          Theme.of(context).backgroundColor,
                          onTap: (){
                            cubit.changeIsAllForum(isALlForum:true);
                          },
                        ),
                        const SizedBox(
                          width: 10,
                        ),
                        DefaultButton(
                          height: 40,
                          width: 130,
                          label: "My forums",
                          labelStyle: Theme.of(context).textTheme.subtitle2!.copyWith(
                            color: cubit.toggleBetweenAllForumAndMyForum ?
                            ColorManager.black:
                            ColorManager.white,
                          ),
                          borderRadius: 7,
                          borderColor:ColorManager.greyAccent ,
                          buttonColor: cubit.toggleBetweenAllForumAndMyForum?
                          Theme.of(context).backgroundColor:
                          Theme.of(context).primaryColor,
                          onTap: (){
                            cubit.changeIsAllForum(isALlForum:false);
                          },
                        ),
                      ],
                    ),
                  ),
                  const SizedBox(
                    height: 20,
                  ),
                  Expanded(
                    child: SingleChildScrollView(
                     
                      child: postItem(
                          context: context,
                          imageUrl: "",
                          userName: "userName",
                          postDate: "postDate",
                          postTitle: "postTitle postTitle postTitle postTitle postTitle postTitle postTitle postTitle postTitle postTitlepostTitle",
                          postContaining:"postTitle postTitle postTitle postTitle postTitle postTitle postTitle" ,
                          postImage: "postImage",
                          likes: 15,
                          replies: 15,
                          onTapUserImage: () {  },
                          onTapReplies: () {  },
                          onTapLike: () {  },
                          onTapUserName: () {  },
                      ),
                    ),
                  ),
                ],
              ),
            );
          },

        ),
      ),
    );
  }
}