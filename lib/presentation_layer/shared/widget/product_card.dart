import 'package:flutter/material.dart';
import '../component/default_button.dart';
import '../resources/color_manager.dart';

Widget productCard({
  required BuildContext context,
  required String title,
  required String price,
  required VoidCallback tapToCard,
  required VoidCallback removeTap,
  required VoidCallback addTap,
  required String quantity,
  required String imageURL,
}) {
  return Container(
    color: Theme.of(context).backgroundColor,
    height: MediaQuery.of(context).size.height,
    width: double.infinity,
    child: Stack(
      children: [
        Align(
          alignment: Alignment.bottomCenter,
          child: SizedBox(
            height: MediaQuery.of(context).size.height * 0.3,
            width: double.infinity,
            child: Card(
              color: Theme.of(context).backgroundColor,
              shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(15),
              ),
              child: Padding(
                padding: const EdgeInsets.symmetric(horizontal: 8.0),
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.end,
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      title,
                      maxLines: 2,
                      overflow: TextOverflow.ellipsis,
                      style: Theme.of(context).textTheme.headline1,
                    ),
                    const SizedBox(
                      height: 5,
                    ),
                    Text(
                      price,
                      style: Theme.of(context).textTheme.headline1!.copyWith(
                        fontSize: 12,
                      )
                    ),
                    const SizedBox(
                      height: 5,
                    ),
                    Padding(
                      padding: const EdgeInsets.only(top: 5.0, bottom: 10),
                      child: DefaultButton(
                        onTap: tapToCard,
                        label:"Add To Card",
                        labelStyle:Theme.of(context).textTheme.button ,
                        borderRadius: 10,
                        height: 45,
                        buttonColor: Theme.of(context).primaryColor,
                      ),
                    ),
                  ],
                ),
              ),
            ),
          ),
        ),
        Positioned(
          left: -5,
          child: Image.asset(imageURL),
        ),
        Positioned(
          top: 15,
          right:10,
          child: SizedBox(
            height: MediaQuery.of(context).size.height * 0.3,
            child: Row(
              mainAxisAlignment: MainAxisAlignment.end,
              children: [
                Material(
                  child: InkWell(
                    onTap: removeTap,
                    child: Ink(
                      child: Card(
                        child: Icon(
                          Icons.remove,
                          color: ColorManager.midGrey,
                          size: 20,
                        ),
                      ),
                    ),
                  ),
                ),
                Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: Text(
                    quantity,
                    style: Theme.of(context).textTheme.headline2
                  ),
                ),
                Material(
                  child: InkWell(
                    onTap: addTap,
                    child: Ink(
                      child: Card(
                        child: Icon(
                          Icons.add,
                          color: ColorManager.midGrey,
                          size: 20,
                        ),
                      ),
                    ),
                  ),
                ),
              ],
            ),
          ),
        ),
      ],
    ),
  );
}



