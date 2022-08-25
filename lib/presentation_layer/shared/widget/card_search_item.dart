import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:lavie/data_layer/dio_helper/end_points.dart';
import 'package:lavie/presentation_layer/shared/resources/color_manager.dart';

Widget cardSearchItem({
  required BuildContext context,
  required String image,
  required String name,
  required String description,
  required int? price,
}){

  return  Container(
    color: Theme.of(context).scaffoldBackgroundColor,
    width: double.infinity,
    height: MediaQuery.of(context).size.height * 0.25,
    child: Card(
      shape:  RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(15),
      ),
      color: Theme.of(context).scaffoldBackgroundColor,
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Container(
            margin: const EdgeInsets.all(7),
            decoration: BoxDecoration(
              color: ColorManager.whiteAccent,
              borderRadius: BorderRadius.circular(10),
            ),
            width: MediaQuery.of(context).size.width * 0.42,
            child: CachedNetworkImage(
              fit: BoxFit.cover,
              imageUrl:EndPoints.baseUrl+image,
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
          Column(
            mainAxisAlignment: MainAxisAlignment.center,
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              SizedBox(
                width: MediaQuery.of(context).size.width*0.49,
                child: Text(
                  name,
                  maxLines: 2,
                  overflow: TextOverflow.ellipsis,
                  style: Theme.of(context)
                      .textTheme
                      .headline3!
                      .copyWith(fontSize: 18),
                ),
              ),
              const SizedBox(
                height: 15,
              ),
                SizedBox(
                  width: MediaQuery.of(context).size.width*0.49,
                  child: Text(
                    description,
                    maxLines: 3,
                    overflow: TextOverflow.ellipsis,
                    style: Theme.of(context)
                        .textTheme
                        .subtitle1!,
                  ),
                ),
              const SizedBox(
                height: 15,
              ),
              Text(
                "${price} EGP",
                maxLines: 1,
                overflow: TextOverflow.ellipsis,
                style:
                Theme.of(context).textTheme.bodyText1!.copyWith(
                  color: Theme.of(context).primaryColor,
                  fontSize: 15,
                ),
              ),

            ],
          ),
        ],
      ),
    ),
  );
}