import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:jiffy/jiffy.dart';
import 'package:lavie/data_layer/bloc/profileCubit/profile_states.dart';
import 'package:lavie/presentation_layer/shared/widget/notification_item.dart';
import '../../../../data_layer/bloc/profileCubit/profile_cubit.dart';
import '../../component/default_text_form_field.dart';
import '../../resources/color_manager.dart';
import '../../resources/controllers.dart';

class CommentModelSheet extends StatelessWidget{

  final int commentIndex ;
  const CommentModelSheet({Key? key, required this.commentIndex}) : super(key: key);
  @override
  Widget build(BuildContext context) {
    return BlocBuilder<ProfileCubit,ProfileStates>(
      builder: (context,state){
        var cubit = ProfileCubit.get(context);
        return  Container(
          width: double.infinity,
          height: MediaQuery.of(context).size.height * 0.9,
          decoration: BoxDecoration(
            color: Theme.of(context).scaffoldBackgroundColor,
            borderRadius: const BorderRadiusDirectional.only(
              topStart: Radius.circular(10),
              topEnd: Radius.circular(10),
            ),
          ),
          child: Column(
            children: [
              SizedBox(
                width: double.infinity,
                height: MediaQuery.of(context).size.height * 0.08,
              ),
              Expanded(
                child: ListView.separated(
                  itemBuilder: (context, index) => notificationItem(
                    context: context,
                    imageURL: cubit
                        .userModel!.data!.userNotification![index].imageUrl
                        .toString(),
                    notificationMassege: cubit.posts[index].data.forumComments![index].comment
                        .toString(),
                    notificationDate: Jiffy(cubit.posts[index].data.forumComments![index].createdAt)
                        .yMMMMd,
                  ),
                  separatorBuilder: (context, index) => const SizedBox(
                    height: 5,
                  ),
                  itemCount: cubit.posts[commentIndex].data.forumComments!.length,
                ),
              ),
              Container(
                width: double.infinity,
                height: MediaQuery.of(context).size.height * 0.15,
                decoration: BoxDecoration(
                    color: ColorManager.lightGrey.withOpacity(0.4),
                    borderRadius: const BorderRadius.only(
                      topRight: Radius.circular(10),
                      topLeft: Radius.circular(10),
                    )),
                child: CustomTextFormField(
                  controller: AppControllers.typeCommentController,
                  keyboardType: TextInputType.text,
                ),
              )
            ],
          ),
        );
      },
    );
  }
}