import 'package:beauty_connect_guest/localization/languages/languages.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:get/get_core/src/get_main.dart';
import 'package:intl_phone_number_input/intl_phone_number_input.dart';
import 'package:beauty_connect_guest/constants/global_variables.dart';

import '../constants/custom_validators.dart';
import '../controllers/general_controller.dart';

class CountryCodePicker extends StatefulWidget {
  TextEditingController? phoneController;

  CountryCodePicker({super.key, this.phoneController});

  @override
  State<CountryCodePicker> createState() => _CountryCodePickerState();
}

class _CountryCodePickerState extends State<CountryCodePicker> {
  String _countryCode = '';
  String initialCountry = 'PT';
  PhoneNumber number = PhoneNumber(isoCode: 'PT');
  GeneralController generalController=Get.find();
  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 16.0),
      child: Stack(
        children: [
          Container(
            height: 60,
            padding: EdgeInsets.symmetric(horizontal: 18),
            decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(100),
              color: AppColors.textFieldColor.withOpacity(0.5),
              border: Border.all(color: AppColors.textFieldColor.withOpacity(0.0), width: 0.7),
            ),
            child: Theme(
              data: ThemeData(
                brightness: Brightness.dark,
                bottomSheetTheme: BottomSheetThemeData(
                  backgroundColor: Colors.black, // Set bottom sheet background to black
                  modalBackgroundColor: Colors.black, // Set modal background to black
                ),
              ),
              child: InternationalPhoneNumberInput(

                onInputChanged: (PhoneNumber number) {
                  print(number.phoneNumber);
                  generalController.updatePhoneNumber(number.phoneNumber.toString());
                  print(number.toString()+"got it");
                  if(widget.phoneController!=null){
                    if (widget.phoneController!.text.isNotEmpty &&
                        widget.phoneController!.text.startsWith('0')) {
                      print('_PHONECONTROLLER: ${widget.phoneController!.text}');
                      print('_PHONECONTROLLER: ${widget.phoneController!.text}');
                      widget.phoneController!.clear();
                      setState(() {});
                      return;
                    }
                  }

                  setState(() {
                    _countryCode = number.dialCode.toString();
                  });
                },
                onInputValidated: (bool value) {},
                selectorConfig: const SelectorConfig(
                  selectorType: PhoneInputSelectorType.BOTTOM_SHEET,
                  setSelectorButtonAsPrefixIcon: true,
                  showFlags: false, // Set this to false to hide the flag
                ),

                ignoreBlank: true,
                autoValidateMode: AutovalidateMode.disabled,
                selectorTextStyle: const TextStyle(color: AppColors.whiteColor54),
                hintText: Languages.of(context)!.enterMobileNumber,
                initialValue: number,
                inputDecoration: InputDecoration(
                    border: UnderlineInputBorder(
                        borderSide: BorderSide(color: Colors.transparent)),
                    focusedBorder: UnderlineInputBorder(
                        borderSide: BorderSide(color: Colors.transparent)),
                    enabledBorder: UnderlineInputBorder(
                        borderSide: BorderSide(color: Colors.transparent)),
                    hintText: Languages.of(context)!.enterMobileNumber,
                    hintStyle: headingSmall.copyWith(color: Color(0xff9f9f9f), fontFamily: "MediumText")),
                textStyle: headingSmall.copyWith(color: Colors.white),
                cursorColor: Colors.white,
                spaceBetweenSelectorAndTextField: 0,
                validator: (String? value) => CustomValidator.number(value,context),
                textFieldController: widget.phoneController,
                formatInput: true,
                keyboardType: const TextInputType.numberWithOptions(
                    signed: false, decimal: false),
                inputBorder: InputBorder.none,
                onSaved: (PhoneNumber number) {
                  print('On Saved: $number');
                },
              ),
            ),
          )
        ],
      ),
    );
  }
}

