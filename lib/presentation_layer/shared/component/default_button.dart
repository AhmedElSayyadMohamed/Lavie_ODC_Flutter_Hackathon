import 'package:flutter/material.dart';
import 'package:lavie/presentation_layer/shared/resources/color_manager.dart';

class DefaultButton extends StatelessWidget {
  final double width;
  final double height;
  final VoidCallback onTap;
  final double borderRadius;
  final Color buttonColor;
  final Color borderColor;
  final String buttonLabel;
  final bool addLogo;
  final String logoImage;
  bool islabeled;
   DefaultButton({
    Key? key,
    this.width = double.infinity,
    this.height = 55,
    required this.onTap,
    this.islabeled =true,
    this.borderRadius = 0,
    this.buttonColor = Colors.blue,
    this.borderColor = Colors.white,
   this.buttonLabel ="",
    this.addLogo = false,
    this.logoImage = "",
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      width: width,
      height: height,
      decoration: BoxDecoration(
        color: buttonColor,
        borderRadius: BorderRadiusDirectional.circular(borderRadius),
        border: Border.all(width: 1, color: borderColor),
      ),
      clipBehavior: Clip.antiAliasWithSaveLayer,
      child: MaterialButton(
        padding: EdgeInsets.zero,
        onPressed: onTap,
        child: addLogo
            ? Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Image.asset(
                    logoImage,
                    width: 25,
                    height: 25,
                  ),
                 islabeled? Text(
                    buttonLabel,
                    style: Theme.of(context).textTheme.button,
                  ):const SizedBox(),
                ],
              )
            : Text(
                buttonLabel,
                style: Theme.of(context).textTheme.bodyText1!.copyWith(
                      color: ColorManager.white,
                    ),
              ),
      ),
    );
  }
}
