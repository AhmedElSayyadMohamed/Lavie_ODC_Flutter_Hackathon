import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:lavie/presentation_layer/shared/resources/color_manager.dart';

class ProfileScreen extends StatelessWidget {
  const ProfileScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        body: SafeArea(
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Stack(children: [
            SizedBox(
              width: double.infinity,
              height: MediaQuery.of(context).size.height * 0.4,
              child: Image.asset("assets/images/tree2.png"),
            ),
            Container(
                width: double.infinity,
                color: ColorManager.black.withOpacity(0.7),
                height: MediaQuery.of(context).size.height * 0.4,
                child: Center(
                  child: InkWell(
                    onTap: () {},
                    child: Container(
                      height: 130,
                      width: 130,
                      decoration: BoxDecoration(
                        color: Colors.grey,
                        borderRadius: BorderRadius.circular(500),
                      ),
                      clipBehavior: Clip.antiAliasWithSaveLayer,
                      child: false
                          ? const Center(child: CircularProgressIndicator())
                          : CachedNetworkImage(
                              fit: BoxFit.cover,
                              imageUrl:
                                  "https://encrypted-tbn0.gstatic.com/images?q=tbn:ANd9GcSEmTY7jA0JKjR-mQKTI_yTkmcXkvxT_J-InVdpxdjMRA&s",
                              placeholder: (context, url) => Center(
                                  child: CircularProgressIndicator(
                                color: Theme.of(context).primaryColor,
                              )),
                              errorWidget: (context, url, error) =>
                                  const Icon(Icons.error),
                            ),
                    ),
                  ),
                )),
            Expanded(
              child: Container(
                width: double.infinity,
                decoration: const BoxDecoration(
                  color: Colors.red,
                  borderRadius: BorderRadiusDirectional.only(
                    topStart: Radius.circular(10),
                    topEnd: Radius.circular(10),
                  ),
                ),
              ),
            ),
          ]),

          // SizedBox(
          //   height: 20.h,
          // ),
          // Padding(
          //   padding: const EdgeInsets.all(14.0),
          //   child: Text(
          //     "title",
          //     style: Theme.of(context)
          //         .textTheme
          //         .headline3!
          //         .copyWith(
          //       fontWeight: FontWeight.w600,
          //       fontSize: 23,
          //     ),
          //   ),
          // ),
          // Expanded(
          //   child: SingleChildScrollView(
          //     physics:const BouncingScrollPhysics(),
          //     child: Padding(
          //       padding:  EdgeInsets.all(24.w),
          //       child: Center(
          //         child: Text(
          //           "description",
          //           style: Theme.of(context).textTheme.subtitle2!.copyWith(
          //               fontSize: 16,
          //               fontWeight: FontWeight.w400,
          //               height: 1.5,
          //               color:ColorManager.greyAccent
          //           ),
          //         ),
          //       ),
          //     ),
          //   ),
          // )
        ],
      ),
    ));
  }
}
