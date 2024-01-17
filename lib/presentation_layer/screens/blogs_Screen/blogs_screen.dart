import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:lavie/data_layer/bloc/GeneralCubit/general_cubit.dart';
import 'package:lavie/data_layer/bloc/GeneralCubit/general_states.dart';
import 'package:lavie/presentation_layer/screens/blogs_details_screen/blog_detail_screen.dart';
import 'package:lavie/presentation_layer/shared/widget/blog_item.dart';


class BlogsScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(
          "Blogs",
          style: Theme.of(context).appBarTheme.titleTextStyle,
        ),
      ),
      body: BlocConsumer<GeneralLavieCubit,GeneralLavieStates>(
        listener:(context,state) {},
        builder:(context,state){
          var cubit =GeneralLavieCubit.get(context);
          return Padding(
            padding: EdgeInsets.symmetric(horizontal: 15.w),
            child: state is GetAllBlogsLoadingState?
            Center(
              child: CircularProgressIndicator(
              color: Theme.of(context).primaryColor,
            ),)
                :ListView.builder(
              shrinkWrap: true,
              physics:const BouncingScrollPhysics(),
              itemCount: cubit.blogsModel!.data!.blogs.length,
              itemBuilder: (context,index)=>
                  blogItem(
                  context: context,
                  imageURL: cubit.blogsModel!.data!.blogs[index].imageUrl,
                  name: cubit.blogsModel!.data!.blogs[index].name,
                  description: cubit.blogsModel!.data!.blogs[index].description,
                  date: "2 Day ago",
                  onTap: () {
                    print(cubit.blogsModel!.data!.blogs[index].imageUrl );
                 Navigator.push(context,
                     CupertinoPageRoute(builder: (_) => BlogDetailsScreen(
                   imageUrl: cubit.blogsModel!.data!.blogs[index].imageUrl ,
                   title: cubit.blogsModel!.data!.blogs[index].name,
                   description: cubit.blogsModel!.data!.blogs[index].description,
                 ),
                     )
                 );
                  }
              ),
            ),
          );
        },
      ),
    );
  }
}
