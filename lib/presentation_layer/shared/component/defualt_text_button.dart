import 'package:flutter/material.dart';
import 'package:lavie/presentation_layer/shared/resources/color_manager.dart';

class CustomTextButton extends StatelessWidget {
  final VoidCallback onTap;

  final String buttonLabel;
  const CustomTextButton({
    Key? key,
    required this.onTap,
    required this.buttonLabel,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return TextButton(
      onPressed: onTap,
      child: Text(
        buttonLabel,
        style: Theme.of(context).textTheme.bodyText1!.copyWith(
          color: ColorManager.primary,
        ),
      ),
    );
  }
}
