import 'package:chat_app_b/constants/fonts.dart';
import 'package:flutter/material.dart';

import '../constants/colors.dart';
import '../constants/sizes.dart';

class OutlineButton extends StatelessWidget {
  final String text;
  final void Function()? onPressed;

  const OutlineButton({
    super.key,
    required this.text,
    required this.onPressed,
  });

  @override
  Widget build(BuildContext context) {
    final size = MediaQuery.of(context).size;
    return SizedBox(
      width: size.width,
      child: TextButton(
        style: TextButton.styleFrom(
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(SizesApp.s20),
            side: BorderSide(
              width: SizesApp.s2,
              color: ColorsApp.colorBorderButtonAndText,
            ),
          ),
        ),
        onPressed: onPressed,
        child: Padding(
          padding: const EdgeInsets.all(SizesApp.s8),
          child: Text(
            text,
            style: FontsApp().fontBodyMedium,
          ),
        ),
      ),
    );
  }
}
