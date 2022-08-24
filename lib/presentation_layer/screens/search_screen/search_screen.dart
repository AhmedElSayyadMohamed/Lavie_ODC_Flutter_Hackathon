import 'package:flutter/material.dart';
import 'package:lavie/presentation_layer/shared/widget/recent_search_item.dart';
import 'package:lavie/presentation_layer/shared/widget/search_bar.dart';

import '../../shared/component/default_navigation.dart';

class SearchScreen extends StatelessWidget {

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Theme.of(context).backgroundColor,
      body: SafeArea(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Row(
              children: [
                IconButton(
                  padding: EdgeInsets.zero,
                  splashRadius: 30,
                  onPressed: () {
                    Navigation.navigatorBack(context: context);
                  },
                  icon: const Icon(Icons.arrow_back),
                ),
                Expanded(
                  child: searchBar(
                    context: context,
                      enabled:true,
                    onSubmitted: (value) {
                      print(value);
                    }, searchController: null,
                  ),
                ),
              ],
            ),
            Padding(
              padding: const EdgeInsets.all(24.0),
              child: Text(
                "Recent searchs",
                style: Theme.of(context).textTheme.subtitle1,
              ),
            ),
            const SizedBox(
              height: 5,
            ),
            Expanded(
              child: ListView.builder(
                physics: const BouncingScrollPhysics(),
                itemBuilder: (context, index) => recentSearch(
                  context: context,
                  title: "hunter",
                  onTap: () {},
                ),
                itemCount: 2,
              ),
            ),
          ],
        ),
      ),
    );
  }
}
