import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:lavie/data_layer/dio_helper/end_points.dart';
import 'package:lavie/presentation_layer/shared/resources/color_manager.dart';

Widget blogItem({
  required BuildContext context,
  required String imageURL,
  required String  name,
  required String  description,
  required String date,
  required VoidCallback onTap,
}){

  return  InkWell(
    onTap: onTap,
    child: Container(
      color: Theme.of(context).scaffoldBackgroundColor,
      width: double.infinity,
      height: MediaQuery.of(context).size.height * 0.25,
      child: Card(
        color: Theme.of(context).scaffoldBackgroundColor,
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Container(
              height: double.infinity,
              margin: const EdgeInsets.all(7),
              decoration: BoxDecoration(
                color: ColorManager.whiteAccent,
                borderRadius: BorderRadius.circular(10),
              ),
              width: MediaQuery.of(context).size.width * 0.42,
              clipBehavior: Clip.antiAliasWithSaveLayer,
              child:CachedNetworkImage(
                fit: BoxFit.cover,
                imageUrl:EndPoints.baseUrl+imageURL,
                placeholder: (context, url) => Center(
                  child: CircularProgressIndicator(
                    color: Theme.of(context).primaryColor,
                  ),
                ),
                errorWidget: (context, url, error) =>const Icon(Icons.error),
              ),

            ),
            const SizedBox(
              width: 5,
            ),
            Padding(
              padding: const EdgeInsetsDirectional.only(top: 25,),
              child: Column(
                mainAxisAlignment: MainAxisAlignment.start,
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    date,
                    maxLines: 1,
                    overflow: TextOverflow.ellipsis,
                    style:
                    Theme.of(context).textTheme.bodyText1!.copyWith(
                      color: Theme.of(context).primaryColor,
                      fontSize: 14,
                    ),
                  ),
                  const SizedBox(
                    height: 10,
                  ),
                  SizedBox(
                    width: MediaQuery.of(context).size.width * 0.42,
                    child: Text(
                      name,
                      maxLines: 1,
                      overflow: TextOverflow.ellipsis,
                      style: Theme.of(context)
                          .textTheme
                          .headline3!
                          .copyWith(fontSize: 17),
                    ),
                  ),
                  const SizedBox(
                    height: 15,
                  ),
                  SizedBox(
                    width: MediaQuery.of(context).size.width * 0.42,

                    child: Text(
                      description,
                      style:
                      Theme.of(context).textTheme.subtitle2!.copyWith(
                        fontWeight: FontWeight.w400,
                        height: 1.5

                      )
                    ),
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    ),
  );
}