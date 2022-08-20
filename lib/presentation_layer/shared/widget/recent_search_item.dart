import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

Widget recentSearch({
  required BuildContext context,
  required String title,
  required VoidCallback onTap,
}) {
  return Padding(
    padding: const EdgeInsets.symmetric(horizontal:24.0,),
    child: Row(
      children: [
        const Icon(
          Icons.watch_later_outlined,
          size: 30,
        ),
        SizedBox(
          width: 7.w,
        ),
        Expanded(
          child: Text(
            title,
            maxLines: 2,
            overflow: TextOverflow.ellipsis,
            style: Theme.of(context)
                .textTheme
                .subtitle1!
                .copyWith(fontSize: 16),
          ),
        ),
        IconButton(
          onPressed: onTap,
          splashRadius: 25,
          icon: const Icon(
            Icons.clear,
            size: 22,
          ),
        ),
      ],
    ),
  );
}
