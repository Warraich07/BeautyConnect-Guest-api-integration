import 'package:beauty_connect_guest/constants/global_variables.dart';
import 'package:beauty_connect_guest/controllers/general_controller.dart';
import 'package:beauty_connect_guest/localization/languages/languages.dart';
import 'package:beauty_connect_guest/utils/custom_dialogbox.dart';
import 'package:beauty_connect_guest/views/ticket_details.dart';
import 'package:delayed_display/delayed_display.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:sizer/sizer.dart';

import '../constants/app_images.dart';
import '../constants/custom_validators.dart';
import '../controllers/guest_controller.dart';
import '../widgets/country_picker_widget.dart';
import '../widgets/custom_widgets.dart';
import '../widgets/text_form_fields.dart';

class CustomerDetails extends StatefulWidget {
  @override
  _CustomerDetailsState createState() => _CustomerDetailsState();
}

class _CustomerDetailsState extends State<CustomerDetails> {
  final TextEditingController nameController = TextEditingController();
  final TextEditingController emailController = TextEditingController();
  final TextEditingController descriptionController = TextEditingController();
  final TextEditingController phoneController = TextEditingController();
  final GuestController guestController = Get.find();
  final _formKey = GlobalKey<FormState>();
GeneralController generalController=Get.find();
  @override
  Widget build(BuildContext context) {
    var isPortrait = MediaQuery.of(context).orientation == Orientation.portrait;
    var containerWidth = isPortrait ? 100.w : 120.w;
    return Scaffold(
      resizeToAvoidBottomInset: false,
      appBar: AppBar(
        elevation: 1.5,
        bottomOpacity: 0.1,
        automaticallyImplyLeading: false,
        backgroundColor: AppColors.cardColor,
        shadowColor: Colors.black26,
        title: Align(
          alignment: Alignment.centerLeft,
          child: Image.asset(
            "assets/images/app_logo.png",
            scale: 16,
          ),
        ),
      ),
      body: GestureDetector(
        onTap: (){
          // FocusScope.of(context).unfocus();
          FocusManager.instance.primaryFocus?.unfocus();
        },
        child: Container(
          color: Colors.black,
          child: Padding(
            padding: const EdgeInsets.symmetric(horizontal: 16.0),
            child: Form(
              key: _formKey,
              child: Column(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                Column(
                  children: [
                    SizedBox(
                      height: 20,
                    ),
                    Align(
                      alignment: Alignment.centerLeft,
                      child: Text(
                        Languages.of(context)!.customerDetails,
                        style: headingLarge,
                      ),
                    ),
                    SizedBox(height: 20),
                    DelayedDisplay(
                      delay: Duration(milliseconds: 400),
                      slidingBeginOffset: Offset(0, -1),
                      child: Padding(
                        padding: const EdgeInsets.only(left: 15.0, right: 15.0),
                        child: AuthTextField(
                          controller: nameController,
                          keyboardType: TextInputType.name,
                          prefixIcon: AppImages.userIcon,
                          validator: (value) =>
                              CustomValidator.isEmptyUserName(value,context),
                          hintText: Languages.of(context)!.fullName,
                        ),
                      ),
                    ),
                    SizedBox(
                      height: 15,
                    ),
                    DelayedDisplay(
                      delay: Duration(milliseconds: 400),
                      slidingBeginOffset: Offset(0, -1),
                      child: Padding(
                        padding: const EdgeInsets.only(left: 15.0, right: 15.0),
                        child: AuthTextField(
                          keyboardType: TextInputType.emailAddress,
                          controller: emailController,
                          prefixIcon: AppImages.emailIcon,
                          validator: (value) => CustomValidator.email(value,context),
                          hintText: Languages.of(context)!.emailAddress,
                        ),
                      ),
                    ),
                    SizedBox(
                      height: 15,
                    ),
                    DelayedDisplay(
                      delay: Duration(milliseconds: 400),
                      slidingBeginOffset: Offset(0, -1),
                      child: CountryCodePicker(
                        phoneController: phoneController,
                      ),
                    ),
                  ],
                ),
                  // SizedBox(
                  //   height: 15,
                  // ),
                  // Container(
                  //   width: double.infinity,
                  //   margin: EdgeInsets.symmetric(horizontal: 16),
                  //   decoration: BoxDecoration(
                  //     borderRadius: BorderRadius.circular(12),
                  //     color: AppColors.textFieldColor.withOpacity(0.5),
                  //   ),
                  //   child: Center(
                  //     child: ConstrainedBox(
                  //       constraints:
                  //           BoxConstraints(minHeight: 180, maxHeight: 180),
                  //       child: TextFormField(
                  //         // validator: (value) =>
                  //         //     CustomValidator.description(value,context),
                  //         controller: descriptionController,
                  //         cursorColor: Colors.black,
                  //         style: headingSmall.copyWith(
                  //             fontSize: 15, overflow: TextOverflow.ellipsis),
                  //         maxLines: 10,
                  //         decoration: InputDecoration(
                  //           contentPadding: const EdgeInsets.symmetric(
                  //               horizontal: 20, vertical: 20),
                  //           border: InputBorder.none,
                  //           focusedBorder: InputBorder.none,
                  //           enabledBorder: InputBorder.none,
                  //           hintText: Languages.of(context)!.writeSomeThingAboutYou,
                  //           hintStyle: bodyMedium.copyWith(
                  //               color: Colors.black54, fontSize: 15),
                  //         ),
                  //       ),
                  //     ),
                  //   ),
                  // ),
                  // SizedBox(
                  //   height: 20,
                  // ),

                  Column(
                    children: [
                      Center(
                        child: SizedBox(
                          width: containerWidth,
                          child: Row(
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            children: [
                              Expanded(
                                  child: CustomButton(
                                    textClr: AppColors.scaffoldColor,

                                    onTap: () {
                                  Get.back();
                                },
                                buttonText: Languages.of(context)!.back,
                              )),
                              SizedBox(
                                width: isPortrait ? 20 : 100,
                              ),
                              Expanded(
                                  child: CustomButton(
                                    textClr: AppColors.scaffoldColor,

                                    onTap: () {
                                      print(guestController.barberId.value);
                                      print(phoneController.text);
                                  if (_formKey.currentState!.validate()) {
                                    if(phoneController.text.isEmpty){
                                      CustomDialog.showErrorDialog(description: Languages.of(context)!.pleaseEnterPhoneNumber,context: context);
                                    }else if(phoneController.text.length<6){
                                      CustomDialog.showErrorDialog(description: Languages.of(context)!.pleaseEnterPhoneNumber,context: context);
                                    }
                                    else{
                                      guestController.createGuestAppointment(
                                        nameController.text,
                                        emailController.text,
                                        generalController.number.toString(),context
                                      );
                                    }

                                  }
                                },
                                buttonText: Languages.of(context)!.next,
                              )),
                            ],
                          ),
                        ),
                      ),
                      SizedBox(
                        height: 30,
                      ),
                    ],
                  ),

                ],
              ),
            ),
          ),
        ),
      ),
    );
  }
}
