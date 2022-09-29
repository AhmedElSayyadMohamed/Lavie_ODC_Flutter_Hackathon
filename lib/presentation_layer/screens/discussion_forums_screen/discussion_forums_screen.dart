import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:lavie/data_layer/bloc/profileCubit/profile_cubit.dart';
import 'package:lavie/data_layer/bloc/profileCubit/profile_states.dart';
import 'package:lavie/presentation_layer/shared/component/default_button.dart';
import 'package:lavie/presentation_layer/shared/component/shimmer.dart';
import 'package:lavie/presentation_layer/shared/resources/color_manager.dart';
import 'package:lavie/presentation_layer/shared/widget/custom_app_bar/custom_app_bar.dart';
import 'package:lavie/presentation_layer/shared/widget/forums/comment.dart';
import 'package:lavie/presentation_layer/shared/widget/post_item.dart';
import 'package:lavie/presentation_layer/shared/widget/search_bar.dart';
import '../../../application_layer/routes_manager.dart';
import '../../shared/component/default_navigation.dart';

class DiscussionForums extends StatelessWidget {

  final postSearchController = TextEditingController();
  DiscussionForums({Key? key}) : super(key: key);
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: const CustomAppBar(
        isBackButton: true,
        title: 'DiscussionForums',
      ),
      floatingActionButton: FloatingActionButton(
        elevation: 10,
        onPressed: () {
          Navigation.navigatorTo(
              context: context, navigatorTo: Routes.createPost);
        },
        child: const Icon(Icons.add),
      ),
      body: Padding(
        padding: EdgeInsets.symmetric(horizontal: 20.w),
        child: BlocBuilder<ProfileCubit, ProfileStates>(
          builder: (context, state) {
            var cubit = ProfileCubit.get(context);
            return Padding(
              padding: const EdgeInsets.only(top: 15.0),
              child: Column(
                children: [
                  SizedBox(
                    height: 60,
                    width: double.infinity,
                    child: CustomSearchBar(
                      searchController:postSearchController,
                      enabled: true,
                      onChanged: (value){
                        cubit.searchAboutPost(value: value, context: context);
                        cubit.getMyPosts();
                      },
                    ),
                  ),
                  Padding(
                    padding: const EdgeInsets.symmetric(
                        horizontal: 8.0, vertical: 10),
                    child: Row(
                      children: [
                        DefaultButton(
                          height: 35,
                          width: 100,
                          label: "All Forums",
                          labelStyle:
                              Theme.of(context).textTheme.subtitle2!.copyWith(
                                    color: cubit.toggleBetweenAllForumAndMyForum
                                        ? ColorManager.white
                                        : ColorManager.black,
                                  ),
                          borderRadius: 7,
                          borderColor: ColorManager.greyAccent,
                          buttonColor: cubit.toggleBetweenAllForumAndMyForum
                              ? Theme.of(context).primaryColor
                              : Theme.of(context).backgroundColor,
                          onTap: () {
                            cubit.toggleBetweenAllForumAndMyForumButton(
                                isALlForum: true);
                          },
                        ),
                        const SizedBox(
                          width: 10,
                        ),
                        DefaultButton(
                          height: 35,
                          width: 100,
                          label: "My forums",
                          labelStyle:
                              Theme.of(context).textTheme.subtitle2!.copyWith(
                                    color: cubit.toggleBetweenAllForumAndMyForum
                                        ? ColorManager.black
                                        : ColorManager.white,
                                  ),
                          borderRadius: 7,
                          borderColor: ColorManager.greyAccent,
                          buttonColor: cubit.toggleBetweenAllForumAndMyForum
                              ? Theme.of(context).backgroundColor
                              : Theme.of(context).primaryColor,
                          onTap: () {
                            cubit.toggleBetweenAllForumAndMyForumButton(
                                isALlForum: false);
                            cubit.getMyPosts();
                          },
                        ),
                      ],
                    ),
                  ),
                  const SizedBox(
                    height: 20,
                  ),
                  Expanded(
                    child: state is GetMyPostLoadingState
                        ? const ShimmerLoadingScreen()
                        : cubit.toggleBetweenAllForumAndMyForum
                            ? const SizedBox(
                                child: Center(child: Text("all forums")),
                              )
                            : ListView.builder(
                                physics: const BouncingScrollPhysics(),
                                itemBuilder: (context, index) => postItem(
                                  context: context,
                                  userImage: cubit.posts[index].data.user!.imageUrl
                                      .toString(),
                                  firstName: cubit.posts[index].data.user!.firstName
                                      .toString(),
                                  lastName: cubit.posts[index].data.user!.lastName
                                      .toString(),
                                  postDate: "yesterday",
                                  postTitle: cubit.posts[index].data.title
                                      .toString(),
                                  postContaining: cubit.posts[index].data.description
                                      .toString(),
                                  postImage: cubit.posts[index].data.imageUrl
                                      .toString(),
                                  likes: cubit.posts[index].data.forumLikes!.length,
                                  replies: cubit.posts[index].data.forumComments!.length,
                                  onTapUserImage: () {},
                                  onTapReplies: () {
                                    showModalBottomSheet(
                                        context: context,
                                        isScrollControlled: true,
                                        builder: (context) => CommentModelSheet(commentIndex: index));
                                  },
                                  onTapLike: () {
                                    cubit.toggleLikeButton();
                                    cubit.addLike(postId: cubit.posts[index].data.forumId.toString(),
                                    );
                                  },
                                  onTapUserName: () {},
                                ),
                                itemCount: cubit.posts.length,
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
