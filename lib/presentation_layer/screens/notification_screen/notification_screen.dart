import 'package:jiffy/jiffy.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import 'package:lavie/data_layer/bloc/profileCubit/profile_cubit.dart';
import 'package:lavie/data_layer/bloc/profileCubit/profile_states.dart';
import 'package:lavie/presentation_layer/shared/widget/empty_cart_widgt.dart';
import 'package:lavie/presentation_layer/shared/widget/notification_item.dart';

class NotificationScreen extends StatelessWidget {
  const NotificationScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          title: Text(
            "Notification",
            style: Theme.of(context).appBarTheme.titleTextStyle,
          ),
        ),
        body: BlocConsumer<ProfileCubit,ProfileStates>(
              listener: (context,state){},
              builder: (context,state){
                var cubit =ProfileCubit.get(context);
                return cubit.userModel!.data!.userNotification!.isEmpty?
                     emptyCardItem(
                         context: context,
                         title: "Notifications",
                         description:"You don't have notifications .",
                     )
                    :ListView.separated(
                  physics:const  BouncingScrollPhysics(),
                  itemBuilder: (context, index) => notificationItem(
                    context: context,
                    imageURL:cubit.userModel!.data!.userNotification![index].imageUrl.toString() ,
                    notificationMassege:cubit.userModel!.data!.userNotification![index].message.toString()  ,
                    notificationDate: Jiffy(cubit.userModel!.data!.userNotification![index].createdAt.toString()).yMMMMd


                  ),
                  separatorBuilder: (context, index) =>const Divider(
                    thickness: 1,
                  ),
                  itemCount: cubit.userModel!.data!.userNotification!.length,
                );
              },
        ),
    );
  }
}
