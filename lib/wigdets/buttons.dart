import 'package:chat_app_b/constants/fonts.dart';
import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';

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
            borderRadius: BorderRadius.circular(SizesApp.s8),
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

class BackgroundButton extends StatelessWidget {
  final String text;
  final void Function()? onPressed;
  final Color backgroundColor;
  final Widget? icon;
  final bool isHaveIcon;

  const BackgroundButton({
    super.key,
    required this.text,
    required this.onPressed,
    required this.backgroundColor,
    this.icon,
    required this.isHaveIcon,
  });

  @override
  Widget build(BuildContext context) {
    final size = MediaQuery.of(context).size;
    return SizedBox(
      width: size.width,
      child: TextButton(
        style: TextButton.styleFrom(
          backgroundColor: backgroundColor,
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(SizesApp.s8),
          ),
        ),
        onPressed: onPressed,
        child: Padding(
          padding: const EdgeInsets.all(SizesApp.s8),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              if (isHaveIcon) icon!,
              const SizedBox(
                width: SizesApp.s8,
              ),
              Text(
                text,
                style: FontsApp().fontBodyMedium.copyWith(
                      color: ColorsApp.colorTheme,
                    ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}

class IconWithButton extends StatelessWidget {
  final void Function()? onPressed;
  final Widget icon;

  const IconWithButton({
    super.key,
    required this.onPressed,
    required this.icon,
  });

  @override
  Widget build(BuildContext context) {
    return TextButton(
      style: TextButton.styleFrom(
        minimumSize: const Size(0, 0),
        tapTargetSize: MaterialTapTargetSize.shrinkWrap,
        padding: EdgeInsets.zero,
      ),
      onPressed: onPressed,
      child: Padding(
        padding: const EdgeInsets.all(SizesApp.s8),
        child: icon,
      ),
    );
  }
}
