import 'package:flutter/material.dart';
import 'package:lavie/presentation_layer/shared/widget/blog_details_item.dart';

class BlogDetailsScreen extends StatelessWidget {

  final String imageUrl;
  final String title;
  final String description;

  const BlogDetailsScreen({Key? key,
        required this.imageUrl,
        required this.title,
        required this.description,
      }) :super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child:BlogDetailsItem(
          imageURL:imageUrl,
          title: title,
          description: description,
        )
      ),
    );
  }
}
