import 'dart:ui';

import 'package:beauty_connect_guest/widgets/text_form_fields.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:sizer/sizer.dart';
import 'package:zoom_tap_animation/zoom_tap_animation.dart';

import '../../constants/global_variables.dart';

///Custom Dialog Single Button

Future<void> showCustomDialog(
  BuildContext context,
  String image,
  String title,
  String desc,
  String buttonText,
  final Function onTap,
  Function? onTapClose,
) async {
  return showDialog<void>(
    context: context,
    barrierDismissible: false,
    builder: (BuildContext context) {
      return BackdropFilter(
        filter: ImageFilter.blur(
          sigmaX: 6,
          sigmaY: 6,
        ),
        child: Dialog(
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(20.0),
          ),
          backgroundColor: Colors.white,
          child: Column(
            mainAxisSize: MainAxisSize.min,
            children: [
              SizedBox(
                height: 10,
              ),
              Align(
                alignment: Alignment.topRight,
                child: InkWell(
                  onTap:(){
                    onTapClose != null ? onTapClose() : Get.back();},
                  child: Container(
                    height: 30,
                    width: 30,
                    margin: EdgeInsets.only(right: 10),
                    padding: EdgeInsets.all(0),
                    child: Center(
                      child: Image.asset(
                        "assets/images/popup/cancel_icon.png",
                      ),
                    ),
                  ),
                ),
              ),
              SizedBox(
                height: 20,
              ),
              Container(
                height: 90,
                child: image == ""
                    ? SizedBox.shrink()
                    : Image.asset(image, fit: BoxFit.fill),
              ),
              SizedBox(
                height: 10,
              ),
              Padding(
                padding: const EdgeInsets.symmetric(horizontal: 40.0),
                child: Text(
                  title,
                  style:
                      headingLarge.copyWith(color: Colors.black, fontSize: 22),
                  textAlign: TextAlign.center,
                ),
              ),
              Padding(
                padding:
                    const EdgeInsets.symmetric(horizontal: 26.0, vertical: 5),
                child: Text(
                  desc,
                  style: authSubHeading.copyWith(fontSize: 12, height: 1.5),
                  textAlign: TextAlign.center,
                ),
              ),
              const SizedBox(
                height: 10,
              ),
              Padding(
                padding:
                    const EdgeInsets.symmetric(horizontal: 22.0, vertical: 8),
                child: ZoomTapAnimation(
                    onTap: () {
                      Get.back();
                      onTap();
                    },
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
                      height: 56,
                      width: double.infinity,
                      decoration: BoxDecoration(
                        color: AppColors.buttonColor,
                        borderRadius: BorderRadius.circular(100),
                      ),
                      child: Center(
                        child: Text(buttonText,
                            style: headingSmall.copyWith(
                              color: Colors.white,
                            )),
                      ),
                    )),
              ),
              const SizedBox(
                height:10,
              ),
            ],
          ),
        ),
      );
    },
  );
}


///Custom Dialog double Button

Future<void> dialogDoubleButton(
    BuildContext context,
    String image,
    String title,
    String desc,
    String buttonText,
    String buttonText1,
    final Function onTap,
    final Function onTap1,
    Function? onTapClose,
    ) async {
  return showDialog<void>(
    context: context,
    barrierDismissible: false,
    builder: (BuildContext context) {
      return BackdropFilter(
        filter: ImageFilter.blur(
          sigmaX: 6,
          sigmaY: 6,
        ),
        child: Dialog(
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(20.0),
          ),
          backgroundColor: Colors.white,
          child: Column(
            mainAxisSize: MainAxisSize.min,
            children: [
              SizedBox(
                height: 10,
              ),
              Align(
                alignment: Alignment.topRight,
                child: InkWell(
                  onTap:(){
                    onTapClose != null ? onTapClose() : Get.back();},
                  child: Container(
                    height: 30,
                    width: 30,
                    margin: EdgeInsets.only(right: 10),
                    padding: EdgeInsets.all(0),
                    child: Center(
                      child: Image.asset(
                        "assets/images/popup/cancel_icon.png",
                      ),
                    ),
                  ),
                ),
              ),
              SizedBox(
                height: 20,
              ),
              Container(
                height: 90,
                child: image == ""
                    ? SizedBox.shrink()
                    : Image.asset(image, fit: BoxFit.fill),
              ),
              SizedBox(
                height: 10,
              ),
              Padding(
                padding: const EdgeInsets.symmetric(horizontal: 40.0),
                child: Text(
                  title,
                  style:
                  headingLarge.copyWith(color: Colors.black, fontSize: 22),
                  textAlign: TextAlign.center,
                ),
              ),
              Padding(
                padding:
                const EdgeInsets.symmetric(horizontal: 26.0, vertical: 5),
                child: Text(
                  desc,
                  style: authSubHeading.copyWith(fontSize: 12, height: 1.5),
                  textAlign: TextAlign.center,
                ),
              ),
              const SizedBox(
                height: 10,
              ),
              Padding(
                padding:
                const EdgeInsets.symmetric(horizontal: 22.0, vertical: 8),
                child: ZoomTapAnimation(
                    onTap: () {
                      Get.back();
                      onTap();
                    },
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
                      height: 56,
                      width: double.infinity,
                      decoration: BoxDecoration(
                        color: AppColors.buttonColor,
                        borderRadius: BorderRadius.circular(100),
                      ),
                      child: Center(
                        child: Text(buttonText,
                            style: headingSmall.copyWith(
                              color: Colors.white,
                            )),
                      ),
                    )),
              ),
              Padding(
                padding:
                const EdgeInsets.symmetric(horizontal: 22.0, vertical: 8),
                child: ZoomTapAnimation(
                    onTap: () {
                      Get.back();
                      onTap1();
                    },
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
                      height: 56,
                      width: double.infinity,
                      decoration: BoxDecoration(
                        color: Colors.white,
                        borderRadius: BorderRadius.circular(100),
                        border: Border.all(color: AppColors.buttonColor)
                      ),
                      child: Center(
                        child: Text(buttonText1,
                            style: headingSmall.copyWith(
                            )),
                      ),
                    )),
              ),
              const SizedBox(
                height:10,
              ),
            ],
          ),
        ),
      );
    },
  );
}

Future<void> addCharges(
    BuildContext context,
    String title,
    String desc,
    String buttonText,
    final Function onTap,
    ) async {
  return showDialog<void>(
    context: context,
    barrierDismissible: false,
    builder: (BuildContext context) {
      return BackdropFilter(
        filter: ImageFilter.blur(
          sigmaX: 6,
          sigmaY: 6,
        ),
        child: SizedBox(
          width: MediaQuery.of(context).size.width,
          child: Dialog(
            insetPadding: EdgeInsets.symmetric(horizontal: 20),
            shape: RoundedRectangleBorder(
              borderRadius: BorderRadius.circular(10.0),
            ),
            backgroundColor: Colors.white,
            child: Column(
              mainAxisSize: MainAxisSize.min,
              children: [
                SizedBox(
                  height: 10,
                ),
                Align(
                  alignment: Alignment.topRight,
                  child: InkWell(
                    onTap: () {
                      Get.back();
                    },
                    child: Container(
                      height: 30,
                      width: 30,
                      margin: EdgeInsets.only(right: 10),
                      child: Center(
                        child: Image.asset(
                          "assets/images/popup/cancel_icon.png",
                        ),
                      ),
                    ),
                  ),
                ),
                SizedBox(height: 10,),
                Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 40.0),
                  child: Text(
                    title,
                    style: headingLarge.copyWith(
                        color: Colors.black, fontSize: 22),
                    textAlign: TextAlign.center,
                  ),
                ),
                const SizedBox(
                  height: 15,
                ),
                Padding(
                  padding: EdgeInsets.symmetric(horizontal: 15),
                  child: Align(
                      alignment: Alignment.centerLeft,
                      child: Text("Haircut Charges", style: bodyNormal)),
                ),
                SizedBox(height: 10,),
                Padding(
                  padding: const EdgeInsets.only(left: 15.0, right: 15.0),
                  child: AuthTextField(
                    keyboardType: TextInputType.number,
                    hintText:
                    "\$00.00",
                  ),
                ),
                SizedBox(
                  height: 20,
                ),
                Padding(
                  padding:
                  const EdgeInsets.symmetric(horizontal: 22.0, vertical: 8),
                  child: ZoomTapAnimation(
                      onTap: () {
                        onTap();
                      },
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
                        height: 56,
                        width: double.infinity,
                        decoration: BoxDecoration(
                          color: AppColors.buttonColor,
                          borderRadius: BorderRadius.circular(100),
                        ),
                        child: Center(
                          child: Text(buttonText,
                              style: headingSmall.copyWith(
                                color: Colors.white,
                              )),
                        ),
                      )),
                ),
                const SizedBox(
                  height: 10,
                ),
              ],
            ),
          ),
        ),
      );
    },
  );
}


Future<void> addHours(
    BuildContext context,
    String title,
    String desc,
    String buttonText,
    final Function onTap,
    ) async {
  return showDialog<void>(
    context: context,
    barrierDismissible: false,
    builder: (BuildContext context) {
      return BackdropFilter(
        filter: ImageFilter.blur(
          sigmaX: 6,
          sigmaY: 6,
        ),
        child: SizedBox(
          width: MediaQuery.of(context).size.width,
          child: Dialog(
            insetPadding: EdgeInsets.symmetric(horizontal: 20),
            shape: RoundedRectangleBorder(
              borderRadius: BorderRadius.circular(10.0),
            ),
            backgroundColor: Colors.white,
            child: Column(
              mainAxisSize: MainAxisSize.min,
              children: [
                SizedBox(
                  height: 10,
                ),
                Align(
                  alignment: Alignment.topRight,
                  child: InkWell(
                    onTap: () {
                      Get.back();
                    },
                    child: Container(
                      height: 30,
                      width: 30,
                      margin: EdgeInsets.only(right: 10),
                      child: Center(
                        child: Image.asset(
                          "assets/images/popup/cancel_icon.png",
                        ),
                      ),
                    ),
                  ),
                ),
                SizedBox(height: 10,),
                Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 30.0),
                  child: Text(
                    title,
                    style: headingLarge.copyWith(
                        color: Colors.black, fontSize: 22),
                    textAlign: TextAlign.center,
                  ),
                ),
                const SizedBox(
                  height: 15,
                ),
                Padding(
                  padding: EdgeInsets.symmetric(horizontal: 15),
                  child: Align(
                      alignment: Alignment.centerLeft,
                      child: Text("From:", style: bodyNormal)),
                ),
                SizedBox(height: 10,),
                Padding(
                  padding: const EdgeInsets.only(left: 15.0, right: 15.0),
                  child: AuthTextField(
                    keyboardType: TextInputType.number,
                    hintText:
                    "00:00 AM/PM",
                  ),
                ),
                SizedBox(height: 10,),
                Padding(
                  padding: EdgeInsets.symmetric(horizontal: 15),
                  child: Align(
                      alignment: Alignment.centerLeft,
                      child: Text("To:", style: bodyNormal)),
                ),
                SizedBox(height: 10,),
                Padding(
                  padding: const EdgeInsets.only(left: 15.0, right: 15.0),
                  child: AuthTextField(
                    keyboardType: TextInputType.number,
                    hintText:
                    "00:00 AM/PM",
                  ),
                ),
                SizedBox(
                  height: 20,
                ),
                Padding(
                  padding:
                  const EdgeInsets.symmetric(horizontal: 22.0, vertical: 8),
                  child: ZoomTapAnimation(
                      onTap: () {
                        onTap();
                      },
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
                        height: 56,
                        width: double.infinity,
                        decoration: BoxDecoration(
                          color: AppColors.buttonColor,
                          borderRadius: BorderRadius.circular(100),
                        ),
                        child: Center(
                          child: Text(buttonText,
                              style: headingSmall.copyWith(
                                color: Colors.white,
                              )),
                        ),
                      )),
                ),
                const SizedBox(
                  height: 10,
                ),
              ],
            ),
          ),
        ),
      );
    },
  );
}