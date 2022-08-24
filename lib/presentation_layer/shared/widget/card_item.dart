import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:lavie/presentation_layer/shared/resources/color_manager.dart';

Widget cardItem({
  required BuildContext context,
  required String productURL,
  required String productName,
  required int? productPrice,
  required int quantity,
  required VoidCallback onTapAddProduct,
  required VoidCallback onTapMinusProduct,
  required VoidCallback onTapRemoveProductFromMyCard,
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
              imageUrl:productURL,
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
            padding: const EdgeInsetsDirectional.only(top: 7,end: 5),
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                SizedBox(
                  width: MediaQuery.of(context).size.width * 0.42,
                  child: Text(
                    productName,
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
                Text(
                  "${productPrice} EGP",
                  maxLines: 1,
                  overflow: TextOverflow.ellipsis,
                  style:
                  Theme.of(context).textTheme.bodyText1!.copyWith(
                    color: Theme.of(context).primaryColor,
                    fontSize: 15,
                  ),
                ),
                const SizedBox(
                  height: 20,
                ),
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Container(
                      width: 60,
                      height: 40,
                      decoration: BoxDecoration(
                        color:ColorManager.lightWhite ,
                        borderRadius: BorderRadius.circular(10),
                      ),
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          InkWell(

                            onTap:onTapMinusProduct ,
                            splashColor: Colors.redAccent,
                            child: Icon(
                              Icons.remove,
                              size: 20,
                              color: Theme.of(context).primaryColor,
                            ),
                          ),
                          Padding(
                            padding: const EdgeInsets.all(5.0),
                            child: Text(
                              '$quantity',
                              style: Theme.of(context)
                                  .textTheme
                                  .bodyText1!
                                  .copyWith(
                                color: ColorManager.black,
                              ),
                            ),
                          ),
                          InkWell(
                            onTap:onTapAddProduct ,
                            child: Icon(
                              Icons.add,
                              size: 20,
                              color: Theme.of(context).primaryColor,
                            ),
                          ),
                        ],
                      ),
                    ),
                    Spacer(),
                    IconButton(
                      onPressed: onTapRemoveProductFromMyCard,
                      splashRadius: 20,
                      icon: Icon(
                        Icons.delete,
                        color: Theme.of(context).primaryColor,
                      ),
                    ),
                  ],
                ),
              ],
            ),
          ),
        ],
      ),
    ),
  );
}