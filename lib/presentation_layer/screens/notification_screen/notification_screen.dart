import 'package:flutter/material.dart';
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
        body: ListView.separated(
          physics:const  BouncingScrollPhysics(),
            itemBuilder: (context, index) => notificationItem(
                context: context,
                imageURL: "assets/images/tree2.png",
                notificationMassege: "Joy Arnold left 6 comments on Your Post",
                notificationDate: "Yesterday at 5:42 PM",
                ),
            separatorBuilder: (context, index) =>const Divider(
              thickness: 1,
            ),
            itemCount: 14,
            ));
  }
}
