import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:lavie/presentation_layer/shared/resources/assets_manger.dart';
import 'package:lavie/presentation_layer/shared/resources/color_manager.dart';
import '../../../data_layer/dio_helper/end_points.dart';
import 'custom_circle_progress_indicator/circle_progress_indicator.dart';

class BlogDetailsItem extends StatelessWidget{

   final String imageURL;
   final String title;
   final String description;

   const BlogDetailsItem({Key? key,
     required this.imageURL,
     required this.title,
     required this.description,
   }) : super(key: key);

  @override
  Widget build(BuildContext context) {
  return Column(
    crossAxisAlignment: CrossAxisAlignment.start,
    children: [
      Expanded(
        flex: 2,
        child: Stack(
            fit: StackFit.expand,
            children:[
              CachedNetworkImage(
                fit: BoxFit.cover,
                color: ColorManager.lightWhite,
                imageUrl: EndPoints.baseUrl+'/'+imageURL,
                placeholder: (context, url) => const CustomCircleProgressIndicator(),
                errorWidget: (context, url, error) =>Image.network(AssetsManager.imageNotFound),
              ),
              const Align(
                  alignment: AlignmentDirectional.topStart,
                  child: BackButton(),
              ),
            ]
        ),
      ),
      Padding(
        padding:EdgeInsets.symmetric(
          vertical:20.h,
          horizontal: 15.w,
        ),
        child: Text(
          title,
          style: Theme.of(context).textTheme.headline3!.copyWith(
            fontWeight: FontWeight.w600,
            fontSize: MediaQuery.of(context).size.height/ MediaQuery.of(context).size.width*11,
          ),
        ),
      ),
      Expanded(
        flex: 2,
        child: SingleChildScrollView(
          physics:const BouncingScrollPhysics(),
          child: Padding(
            padding: EdgeInsets.symmetric(horizontal: 15.w,vertical:20.h),
            child: Text(
              description,
              style: Theme.of(context).textTheme.subtitle2!.copyWith(
                  fontSize: MediaQuery.of(context).size.height/ MediaQuery.of(context).size.width*8,
                  fontWeight: FontWeight.w400,
                  height: 1.5,
                  color:ColorManager.greyAccent
              ),
            ),
          ),
        ),
      )
    ],
  );
  }
}