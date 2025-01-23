import 'package:flutter/material.dart';
import 'package:zoom_tap_animation/zoom_tap_animation.dart';

import '../../constants/global_variables.dart';

class CustomFilledButton extends StatefulWidget {
  final double? width;
  final double? height;
  final String? buttonText;
  final Function()? onTap;
  final Color? buttonClr;
  final Color? textClr;
  final Color? borderClr;
  const CustomFilledButton({
    super.key,
    this.buttonText,
    this.width,
    this.height,
    required this.onTap,
    this.buttonClr,
    this.textClr,
    this.borderClr,
  });

  @override
  State<CustomFilledButton> createState() => _CustomFilledButtonState();
}

class _CustomFilledButtonState extends State<CustomFilledButton> {
  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 8),
      child: ZoomTapAnimation(
        onTap: widget.onTap,
        onLongTap: () {},
        enableLongTapRepeatEvent: false,
        longTapRepeatDuration: const Duration(milliseconds: 100),
        begin: 1.0,
        end: 0.93,
        beginDuration: const Duration(milliseconds: 20),
        endDuration: const Duration(milliseconds: 120),
        beginCurve: Curves.decelerate,
        endCurve: Curves.fastOutSlowIn,
        child: Container(
            padding: const EdgeInsets.symmetric(horizontal: 6),
            width: widget.width??double.infinity,
            height: widget.height??60,
            decoration: BoxDecoration(
                color:widget.buttonClr?? AppColors.buttonColor,
                // gradient: LinearGradient(
                //     colors: [
                //       AppColors.linearButtonColor1,
                //       AppColors.linearButtonColor2,
                // ], begin: Alignment.topCenter, end: Alignment.bottomCenter),
                borderRadius: BorderRadius.circular(12),
                border: Border.all(color: widget.borderClr??AppColors.buttonColor)),
            child: Center(
              child: Text(widget.buttonText.toString(),
                  style: TextStyle(
                    fontSize: 21,
                    color:widget.textClr?? Colors.white,
                    fontFamily: "MontserratSemiBold",
                   // fontWeight: FontWeight.w600,
                  ),
              ),
            )),
      ),
    );
  }
}
