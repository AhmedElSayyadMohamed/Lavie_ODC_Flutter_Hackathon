import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

Widget recentSearch({
  required BuildContext context,
  required String title,
  required VoidCallback onTap,
  required VoidCallback onTapDelete,
}) {
  return Padding(
    padding: const EdgeInsets.symmetric(horizontal:24.0,),
    child: Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        InkWell(
          onTap: onTap,
          child: Row(
            children: [
              const Icon(
                Icons.watch_later_outlined,
                size: 30,
              ),
              const SizedBox(
                width: 7,
              ),
              Text(
                title,
                maxLines: 2,
                overflow: TextOverflow.ellipsis,
                style: Theme.of(context)
                    .textTheme
                    .subtitle1!
                    .copyWith(fontSize: 16),
              ),
            ],
          ),
        ),
        IconButton(
          onPressed: onTapDelete,
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
