
import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:lavie/data_layer/dio_helper/end_points.dart';


Widget postItem({
  required BuildContext context,
  required String userImage,
  required String firstName,
  required String lastName,
  required String postDate,
  required String postTitle,
  required String postContaining,
  required String postImage,
  required int likes,
  required int replies,
  required VoidCallback onTapLike,
  required VoidCallback onTapReplies,
  required VoidCallback onTapUserImage,
  required VoidCallback onTapUserName,
}) {
  return Card(
    child:
    Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Padding(
          padding: const EdgeInsets.symmetric(
            horizontal: 10,
            vertical: 10,
          ),
          child: Row(
            children: [
              InkWell(
                onTap:onTapUserImage,
                child: Container(
                  height: 50,
                  width: 50,
                  decoration: BoxDecoration(
                      borderRadius: BorderRadiusDirectional.circular(50),
                  ),
                  clipBehavior: Clip.antiAliasWithSaveLayer,
                  child: CachedNetworkImage(
                    imageUrl: userImage,
                    fit: BoxFit.cover,
                    placeholder: (context, url) =>Center(child: CircularProgressIndicator(
                      color: Theme.of(context).primaryColor,
                    ),
                    ),
                    errorWidget: (context, url, error) =>const Icon(Icons.error),
                  ),
                ),
              ),
              const SizedBox(
                width: 10,
              ),
              Column(
                mainAxisAlignment: MainAxisAlignment.start,
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  InkWell(
                    onTap:onTapUserName,
                    child: SizedBox(
                      child: Text(
                        firstName+lastName,
                        maxLines: 1,
                        overflow: TextOverflow.ellipsis,
                        style: Theme.of(context).textTheme.headline3,
                      ),
                    ),
                  ),
                  const SizedBox(
                  height:2,
                ),
                  Text(
                    postDate,
                    style: Theme.of(context).textTheme.subtitle2,
                  ),
                ],
              ),
            ],
          ),
        ),
        Padding(
            padding: const EdgeInsets.symmetric(horizontal: 15, vertical: 10),
            child: Text(
              postTitle,
              maxLines: 1,
              style: Theme.of(context).textTheme.subtitle2!.copyWith(
                wordSpacing: 1.5,
                color: Theme.of(context).primaryColor,
                fontSize: 15,
                fontWeight: FontWeight.w700,
              ),
            ),
        ),
        Padding(
          padding: const EdgeInsets.symmetric(horizontal: 15, vertical: 5),
          child: Text(
            postContaining,
            style: Theme.of(context).textTheme.subtitle1,
          ),
        ),
        Container(
          padding: const EdgeInsets.symmetric(horizontal: 10, vertical: 5),
          height: 200,
          width: double.infinity,
          decoration: BoxDecoration(
            borderRadius: BorderRadiusDirectional.circular(5),
          ),
          clipBehavior: Clip.antiAliasWithSaveLayer,
          child: CachedNetworkImage(
            imageUrl:EndPoints.baseUrl+postImage,
            fit: BoxFit.cover,
            placeholder: (context, url) =>Center(child: CircularProgressIndicator(
              color: Theme.of(context).primaryColor,
            ),
            ),
            errorWidget: (context, url, error) => const Icon(Icons.error),
          ),
        ),
        Padding(
          padding: const EdgeInsets.all(8.0),
          child: Row(
            children: [
              InkWell(
                onTap: onTapLike,
                child: Padding(
                  padding:
                  const EdgeInsets.symmetric(horizontal: 10, vertical: 8),
                  child: Row(
                    children: [
                      const Icon(
                        Icons.thumb_up_off_alt_outlined,
                        size: 25,
                      ),
                      const SizedBox(
                        width: 5,
                      ),
                      Text(
                        "$likes likes",
                        style: Theme.of(context).textTheme.subtitle2!.copyWith(
                          fontSize: 16,
                        ),
                      ),
                    ],
                  ),
                ),
              ),
              InkWell(
                onTap:onTapReplies,
                child: Padding(
                  padding:
                  const EdgeInsets.symmetric(vertical: 10, horizontal: 15),
                  child: Text(
                        "$replies Replies",
                        style:Theme.of(context).textTheme.subtitle2!.copyWith(
                        fontSize: 16,
                        ),
                           ),
                  ),
                ),
            ],
          ),
        ),

      ],
    ),
  );
}
