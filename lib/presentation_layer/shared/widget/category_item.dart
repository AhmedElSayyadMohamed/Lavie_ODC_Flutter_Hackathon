import 'package:flutter/material.dart';

Widget categoryItem({
  required BuildContext context,
  required int index,
  required GestureTapCallback? onTap,
}) {
  return ClipRRect(
    borderRadius: BorderRadius.circular(15),
    child: Material(
      child: InkWell(
        onTap: onTap,
        child: Ink(
          width: 100,
          height: 15,
          decoration: BoxDecoration(
            color: Theme.of(context).cardTheme.color,
            borderRadius: BorderRadius.circular(15),
            border: Border.all(
              width: 2,
              color: index == 0
                  ? Theme.of(context).primaryColor
                  : Theme.of(context).cardColor,
            ),
          ),
          child: Center(
            child: Text(
              "Planets",
              style: index == 0
                  ? Theme.of(context).textTheme.bodyText2!.copyWith(
                        color: Theme.of(context).primaryColor,
                      )
                  : Theme.of(context).textTheme.bodyText2,
            ),
          ),
        ),
      ),
    ),
  );
}
