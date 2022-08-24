import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import 'package:lavie/data_layer/bloc/profileCubit/profile_cubit.dart';
import 'package:lavie/data_layer/bloc/profileCubit/profile_states.dart';
import 'package:lavie/presentation_layer/shared/component/default_button.dart';
import 'package:lavie/presentation_layer/shared/resources/color_manager.dart';
import 'package:lavie/presentation_layer/shared/widget/post_item.dart';
import 'package:lavie/presentation_layer/shared/widget/search_bar.dart';

import '../../../application_layer/routes_manager.dart';
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
          style: Theme.of(context).appBarTheme.titleTextStyle,
        ),
      ),

      floatingActionButton: FloatingActionButton(
        onPressed: () {
          Navigation.navigatorTo(context: context, navigatorTo: Routes.createPost);
        },
         child:const Icon(Icons.add),
      ),
      body: Padding(
        padding: EdgeInsets.symmetric(horizontal: 20.w),
        child: BlocConsumer<ProfileCubit,ProfileStates>(
          listener: (context,state){},
          builder: (context,state){
            var cubit =ProfileCubit.get(context);

            return  Padding(
              padding: const EdgeInsets.only(top: 15.0),
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
                          height: 35,
                          width: 100,
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
                            cubit.toggleBetweenAllForumAndMyForumButton(isALlForum:true);
                          },
                        ),
                        const SizedBox(
                          width: 10,
                        ),
                        DefaultButton(
                          height: 35,
                          width: 100,
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
                            cubit.toggleBetweenAllForumAndMyForumButton(isALlForum:false);
                          },
                        ),
                      ],
                    ),
                  ),
                  const SizedBox(
                    height: 20,
                  ),
                  Expanded(

                    child: ListView.builder(
                      physics: const BouncingScrollPhysics(),
                        itemBuilder:(context,index)=> postItem(
                          context: context,
                          imageUrl: "https://encrypted-tbn0.gstatic.com/images?q=tbn:ANd9GcQNg6_HWyYywvuYTGWNN7l-Q93Ywo9z5SDywYBfS_tI&s",
                          userName: "userName",
                          postDate: "postDate",
                          postTitle: "postTitle postTitle postTitle postTitle postTitle postTitle postTitle postTitle postTitle postTitlepostTitle",
                          postContaining:"postTitle postTitle postTitle postTitle postTitle postTitle postTitle" ,
                          postImage: "https://encrypted-tbn0.gstatic.com/images?q=tbn:ANd9GcScX3VKCfxHMM9VC8k2uaSemeJl1DoLGpGmh5XQkLwt&s",
                          likes: 15,
                          replies: 15,
                          onTapUserImage: () {  },
                          onTapReplies: () {  },
                          onTapLike: () {  },
                          onTapUserName: () {  },
                        ),
                        itemCount: 10,
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