import 'package:dropdown_button2/dropdown_button2.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:sizer/sizer.dart';

import '../constants/global_variables.dart';
import '../controllers/general_controller.dart';
import '../controllers/localization_controller.dart';
import '../localization/languages/language_data.dart';
import '../localization/locale_constants.dart';


class LanguageOption extends StatefulWidget {
  const LanguageOption({super.key});

  @override
  State<LanguageOption> createState() => _LanguageOptionState();
}

class _LanguageOptionState extends State<LanguageOption> {
  @override
  void initState() {
    changeLanguage(
        context, LanguageData.languageList()[0].languageCode);
    LANG_CODE.value = 'en';

    super.initState();
  }
  String selectedServiceValue = "Select Language";

  var fromCountry = [
    'English',
    "Portuguese",
    "French"

  ];
  GeneralController generalController=Get.find();
  @override
  Widget build(BuildContext context) {
    return Center(
      child: Container(
        height: 60,
        width: 90.w,
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(30),
          border: Border.all(width: 5)

        ),
        child: DropdownButtonHideUnderline(
          child: DropdownButton2<String>(
            isExpanded: true,
            hint: Row(
              children: [
                const SizedBox(
                  width: 2,
                ),
                Expanded(
                  child: Text(
                    selectedServiceValue,
                    overflow: TextOverflow.ellipsis,
                    style:  const TextStyle(

                      fontSize: 15,
                      fontFamily: "monsMedium",
                      color: Colors.white54
                    ),
                  ),
                ),
              ],
            ),
            items: fromCountry
                .map((String item) => DropdownMenuItem<String>(
              value: item.toString(),
              child: Padding(
                padding: const EdgeInsets.only(
                     right: 10),
                child: Text(
                  item.toString(),
                  //  style: ,
                  overflow: TextOverflow.ellipsis,
                  style: const TextStyle(

                    fontSize: 15,
                    fontFamily: "monsMedium",
                    color: Colors.white54
                  ),
                ),
              ),
            ))
                .toList(),
            onChanged: (value) {
              setState(() {
                selectedServiceValue = value!;
                if(selectedServiceValue=="English"){
                  setState(() {
                    languageCount=0;
                    changeLanguage(
                        context, LanguageData.languageList()[0].languageCode);
                    LANG_CODE.value = 'en';
                    print(LANG_CODE.value);

                    generalController.updateLanguageCode('en');
                  });

                }
                else if(selectedServiceValue=="Portuguese"){
                  setState(() {
                    languageCount=1;
                    changeLanguage(
                        context, LanguageData.languageList()[2].languageCode);
                    LANG_CODE.value = 'pt';
                    print(LANG_CODE.value);

                    generalController.updateLanguageCode('pt');
                  });

                }
                else if(selectedServiceValue=="French"){

                  setState(() {
                    languageCount=2;
                    changeLanguage(
                        context, LanguageData.languageList()[1].languageCode);
                    LANG_CODE.value = 'fr';
                    print(LANG_CODE.value);
                    generalController.updateLanguageCode('fr');
                  });

                }
              });
            },
            buttonStyleData: ButtonStyleData(
              width: double.infinity,
              padding: const EdgeInsets.only(left: 20, right: 14),
              decoration: BoxDecoration(
                color: AppColors.textFieldColor,

                borderRadius: BorderRadius.circular(30),
              ),
              elevation: 0,
            ),
            iconStyleData: const IconStyleData(
              openMenuIcon: Icon(
                Icons.keyboard_arrow_up_rounded,
                size: 25,

              ),
              icon: Icon(
                Icons.keyboard_arrow_down_rounded,

              ),
              iconSize: 28,
            ),
            dropdownStyleData: DropdownStyleData(
              isOverButton: false,
              maxHeight: 300,
              decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(10),
                  color: AppColors.cardColor,
              ),
              offset: const Offset(0, 0),
              scrollbarTheme: ScrollbarThemeData(
                radius: const Radius.circular(40),
                thickness: MaterialStateProperty.all(6),
                thumbVisibility: MaterialStateProperty.all(true),
              ),
            ),
            menuItemStyleData: const MenuItemStyleData(
              height: 40,
              padding: EdgeInsets.only(left: 20, right: 14),
            ),
          ),
        ),
      ),
    );
  }
}
