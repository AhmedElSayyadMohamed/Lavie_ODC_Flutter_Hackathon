import 'package:flutter/material.dart';
import 'package:lavie/presentation_layer/shared/component/default_button.dart';
import 'package:lavie/presentation_layer/shared/resources/assets_manger.dart';

Widget signInWithFaceBookOrGoogle({
  required BuildContext context,
  required VoidCallback loginWithGoogle,
  required VoidCallback loginWithFacebook,
}) {
  return Column(
    children: [
      const SizedBox(
        height: 20,
      ),
      Row(
        children: [
          Expanded(
            child: Divider(
              thickness: 1,
              color: Theme.of(context).dividerColor,
            ),
          ),
          Padding(
            padding: const EdgeInsets.all(8.0),
            child: Text(
              "or Continue with",
              style: Theme.of(context).textTheme.subtitle1,
            ),
          ),
          Expanded(
            child: Divider(
              thickness: 1,
              color: Theme.of(context).dividerColor,
            ),
          ),
        ],
      ),
      Row(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          DefaultButton(
            onTap: loginWithGoogle,
            width: 60,
            borderRadius: 15,
            addLogo: true,
            islabeled: false,
            buttonColor: Theme.of(context).backgroundColor.withOpacity(0.9),
            logoImage: AssetsManager.googleLogo,
          ),
          DefaultButton(
            onTap: loginWithFacebook,
            width: 60,
            borderRadius: 15,
            addLogo: true,
            islabeled:false,
            buttonColor: Theme.of(context).backgroundColor.withOpacity(0.9),
            logoImage: AssetsManager.facebookLogo,
          ),
        ],
      ),
    ],
  );
}
