import 'package:flutter/material.dart';
import 'package:lavie/presentation_layer/shared/widget/product_card.dart';

Widget productGridView({
  required BuildContext context,
  required String title,
  required String price,
  required VoidCallback tapToCard,
  required VoidCallback removeTap,
  required VoidCallback addTap,
  required String quantity,
  required String imageURL,
}) {
  return GridView.builder(
    physics: const NeverScrollableScrollPhysics(),
    shrinkWrap: true,
    gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
      crossAxisCount: 2,
      crossAxisSpacing: 2,
      mainAxisSpacing: 2,
      mainAxisExtent: MediaQuery.of(context).size.height * 0.4,
    ),
    itemBuilder: (context, index) => productCard(
      context: context,
      title: title,
      price: price,
      tapToCard: tapToCard,
      removeTap: removeTap,
      addTap: addTap,
      quantity: quantity,
      imageURL: imageURL,
    ),
    itemCount: 8,
  );
}
