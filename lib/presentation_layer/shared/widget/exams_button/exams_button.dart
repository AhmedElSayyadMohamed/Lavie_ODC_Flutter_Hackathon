import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class ExamsButton extends StatelessWidget{

  final VoidCallback onTap;
  const ExamsButton({Key? key,required this.onTap}) : super(key: key);
  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 15.0, vertical: 5),
      child: SizedBox(
        height: 35.0.h,
        width: 35.0.w,
        child: FittedBox(
          child: FloatingActionButton(
            onPressed: onTap,
            mini: true,
            backgroundColor: Theme.of(context).primaryColor,
            child:const Icon(
              Icons.question_mark_outlined,
            ),
          ),
        ),
      ),
    );
  }
}