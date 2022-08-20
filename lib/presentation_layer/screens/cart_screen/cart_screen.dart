import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:lavie/presentation_layer/shared/resources/color_manager.dart';

class CardScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(
          "My Card",
          style: Theme.of(context).textTheme.headline3,
        ),
      ),
      body: Padding(
        padding: EdgeInsets.symmetric(horizontal: 15.w),
        child: Column(
          children: [
            Container(
              color: Theme.of(context).scaffoldBackgroundColor,
              width: double.infinity,
              height: MediaQuery.of(context).size.height * 0.25,
              child: Card(
                color: Theme.of(context).scaffoldBackgroundColor,
                child: Row(
                  children: [
                    Container(
                      margin: const EdgeInsets.all(10),
                      decoration: BoxDecoration(
                        color: ColorManager.whiteAccent,
                        borderRadius: BorderRadius.circular(10),
                      ),
                      width: MediaQuery.of(context).size.width * 0.42,
                      child: Image.asset("assets/images/tree2.png"),
                    ),
                    const SizedBox(
                      width: 5,
                    ),
                    Column(
                      mainAxisSize: MainAxisSize.max,
                      mainAxisAlignment: MainAxisAlignment.center,
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        // Container(
                        //   color: Colors.amber,
                        //   child: Text(
                        //     "Cactus plant",
                        //     maxLines: 1,
                        //     overflow: TextOverflow.ellipsis,
                        //     style: Theme.of(context)
                        //         .textTheme
                        //         .headline3!
                        //         .copyWith(fontSize: 18),
                        //   ),
                        // ),
                        const SizedBox(
                          height: 15,
                        ),
                        Text(
                          "200 EGP",
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
                                  borderRadius: BorderRadius.circular(2)),
                              child: Card(
                                  child: Row(
                                children: [
                                  InkWell(
                                    onTap: () {},
                                    child: Icon(
                                      Icons.remove,
                                      size: 20,
                                      color: Theme.of(context).primaryColor,
                                    ),
                                  ),
                                  Text(
                                    "1",
                                    style: Theme.of(context)
                                        .textTheme
                                        .bodyText1!
                                        .copyWith(
                                          color: ColorManager.black,
                                        ),
                                  ),
                                  InkWell(
                                    onTap: () {},
                                    child: Icon(
                                      Icons.add,
                                      size: 20,
                                      color: Theme.of(context).primaryColor,
                                    ),
                                  )
                                ],
                              )),
                            ),
                            IconButton(
                              onPressed: () {},
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
                  ],
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
