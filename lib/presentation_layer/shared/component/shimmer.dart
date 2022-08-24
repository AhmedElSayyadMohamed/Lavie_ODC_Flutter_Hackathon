import 'package:flutter/material.dart';

class ShimmerLoadingScreen extends StatelessWidget {
  const ShimmerLoadingScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {

    return SafeArea(
      child:
      Container(
        color: Colors.brown[50],
        child: Column(
          children: [
            Padding(
              padding: const EdgeInsets.symmetric(vertical: 5),
              child: Container(
                color: Colors.white,
                height: 200,
                child: Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Row(
                        children: [
                          CircleAvatar(
                            radius: 25,
                            backgroundColor: Colors.brown[50],
                          ),
                          const SizedBox(width: 5,),
                          Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              shimmerLoading(widthRatio:0.2, context: context),
                              shimmerLoading(widthRatio:0.3, context: context),
                              shimmerLoading(widthRatio:0.4, context: context)

                            ],
                          ),
                        ],
                      ),
                      const SizedBox(
                        height: 10,
                      ),
                      shimmerLoading(widthRatio:0.95, context: context),
                      shimmerLoading(widthRatio:0.9, context: context),
                      shimmerLoading(widthRatio:0.95, context: context),
                      shimmerLoading(widthRatio:0.7, context: context),
                      const Spacer(),
                      Row(
                        children: [
                          shimmerLoading(widthRatio:0.03, context: context),
                          shimmerLoading(widthRatio:0.03, context: context),
                          shimmerLoading(widthRatio:0.03, context: context),
                          shimmerLoading(widthRatio:0.1, context: context),
                          const Spacer(),
                          shimmerLoading(widthRatio:0.25, context: context),
                          const SizedBox(
                            width: 10,
                          ),
                        ],
                      ),
                      const SizedBox(
                        height: 10,
                      ),
                    ],
                  ),
                ),
              ),
            ),
            Padding(
              padding: const EdgeInsets.symmetric(vertical: 5),
              child: Container(
                color: Colors.white,
                height: 130,
                child: Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Row(
                        children: [
                          CircleAvatar(
                            radius: 25,
                            backgroundColor: Colors.brown[50],
                          ),
                          const SizedBox(width: 5,),
                          Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              shimmerLoading(widthRatio:0.2, context: context),
                              shimmerLoading(widthRatio:0.4, context: context),
                              shimmerLoading(widthRatio:0.3, context: context),

                            ],
                          ),
                        ],
                      ),
                      const SizedBox(
                        height: 10,
                      ),
                      shimmerLoading(widthRatio:0.95, context: context),
                      shimmerLoading(widthRatio:0.9, context: context),

                    ],
                  ),
                ),
              ),
            ),

          ],
        ),
      ),

    );

  }
  Widget shimmerLoading({
    required num widthRatio ,
    required BuildContext context,
  }) {
    return Padding(
      padding: const EdgeInsets.all(3),
      child: Container(
        width: MediaQuery.of(context).size.width* widthRatio,
        height: 12,
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(50),
          color: Colors.brown[50],
        ),
      ),
    );
  }
}