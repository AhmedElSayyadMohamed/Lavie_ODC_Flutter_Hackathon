import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:lavie/data_layer/bloc/GeneralCubit/general_cubit.dart';
import '../../../data_layer/dio_helper/end_points.dart';
import '../component/default_button.dart';
import '../resources/color_manager.dart';

class ProductItem extends StatelessWidget {

  final String? title;
  final int? price;
  final VoidCallback tapToCard;
  final VoidCallback goToCard;
  final VoidCallback removeTap;
  final VoidCallback addTap;
  final int? quantity;
  final String? imageURL;
  final int? index;

  const ProductItem({Key? key,
    this.title,
    this.price,
    required this.tapToCard,
    required this.goToCard,
    required this.removeTap,
    required this.addTap,
    this.quantity,
    this.imageURL,
    this.index,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    var cubit = GeneralLavieCubit.get(context);
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
                        title!,
                        maxLines: 2,
                        overflow: TextOverflow.ellipsis,
                        style: Theme.of(context).textTheme.headline1,
                      ),
                      const SizedBox(
                        height: 5,
                      ),
                      Text(
                          "${price.toString()} EGP",
                          style: Theme.of(context).textTheme.headline1!.copyWith(
                            fontSize: 12,
                          )
                      ),
                      const SizedBox(
                        height: 5,
                      ),
                      Padding(
                        padding: const EdgeInsets.only(top: 5.0, bottom: 10),
                        child: cubit.products[index!].inCard ==true?
                        DefaultButton(
                          onTap: goToCard,
                          label:"Go To Card",
                          labelStyle:Theme.of(context).textTheme.button ,
                          borderRadius: 10,
                          height: 45,
                          buttonColor: Theme.of(context).primaryColor,
                        ):
                        DefaultButton(
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
            left: -2,
            right:50,
            top: 2,
            child:SizedBox(
              width: MediaQuery.of(context).size.width*0.3,
              height: MediaQuery.of(context).size.height*0.25,
              child: CachedNetworkImage(
                imageUrl:EndPoints.baseUrl+imageURL!,
                placeholder: (context, url) => const SizedBox(),
                errorWidget: (context, url, error) =>const Icon(Icons.error),
              ),
            ),
          ),
          Align(
            alignment: AlignmentDirectional.center,
            child: Padding(
              padding: const EdgeInsets.all(8.0),
              child: SizedBox(
                height: MediaQuery.of(context).size.height * 0.3,
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.end,
                  children: [
                    InkWell(
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
                    Padding(
                      padding: const EdgeInsets.all(8.0),
                      child: Text(
                          quantity.toString(),
                          style: Theme.of(context).textTheme.headline2
                      ),
                    ),
                    InkWell(
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
                  ],
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }
}




