import 'package:beauty_connect_guest/constants/global_variables.dart';
import 'package:beauty_connect_guest/controllers/guest_controller.dart';
import 'package:beauty_connect_guest/models/services_model.dart';
import 'package:beauty_connect_guest/views/barber_selection.dart';
import 'package:beauty_connect_guest/widgets/custom_widgets.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:sizer/sizer.dart';

import '../controllers/general_controller.dart';
import '../localization/languages/languages.dart';
import '../utils/custom_dialogbox.dart';

class ServiceSelection extends StatefulWidget {
  @override
  _ServiceSelectionState createState() => _ServiceSelectionState();
}

class _ServiceSelectionState extends State<ServiceSelection> {
  // Updated to keep track of selected services
  final GuestController guestController=Get.find();
@override
  void initState() {
    // TODO: implement initState
    super.initState();
    // guestController.selectedServices.clear();
    guestController.getUserServices(context);
  }
  GeneralController generalController=Get.find();

  @override
  Widget build(BuildContext context) {
    var isPortrait = MediaQuery.of(context).orientation == Orientation.portrait;
    var containerWidth = isPortrait ? 100.w : 120.w;
    return Scaffold(
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
      body: Obx(
          ()=> Padding(
          padding: const EdgeInsets.symmetric(horizontal: 16.0),
          child: guestController.isLoading.value?Center(child: CircularProgressIndicator(

            color: AppColors.buttonColor,
          )):
          Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              SizedBox(height: 20),
              Text(
                Languages.of(context)!.serviceSelection,
                style: headingLarge,
              ),
              SizedBox(height: 20),
              Container(
                height: MediaQuery.of(context).size.height*.65,
                child: ScrollbarTheme(
                  data: ScrollbarThemeData(
                    trackColor: WidgetStateProperty.all(Colors.white54),
                    thumbColor: WidgetStateProperty.all(AppColors.cardColor)
                  ),
                  child: Scrollbar(
                  
                    thumbVisibility: true,           // Make the scrollbar thumb visible
                    radius: Radius.circular(8),      // Rounded scrollbar for a modern look
                    thickness: 6,                    // Adjust thickness as needed
                    trackVisibility: true,           // Shows a track for the scrollbar
                    interactive: true,
                    child: ListView.builder(
                      padding: EdgeInsets.only(right: 15),
                      itemCount: guestController.serviceList.length,
                      itemBuilder: (context,index)=>
                          ServiceOption(
                            title:generalController.languageCode=='en'? guestController.serviceList[index].name:generalController.languageCode=='pt'?guestController.serviceList[index].portugueseName:guestController.serviceList[index].frenchName,
                            description:"\$ " +guestController.serviceList[index].price.toString(),
                            isSelected: guestController.selectedServices.contains(guestController.serviceList[index]),
                            onTap: () => _toggleSelection(guestController.serviceList[index]),
                          ),
                    ),
                  ),
                ),
              ),
              // ServiceOption(
              //   title: 'Haircut',
              //   description: 'Professional hair cutting service',
              //   isSelected: selectedServices.contains('Haircut'),
              //   onTap: () => _toggleSelection('Haircut'),
              // ),

              Spacer(),
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
                        ),
                      ),
                      SizedBox(width: isPortrait ? 20 : 100),
                      Expanded(
                        child: CustomButton(
                          textClr: AppColors.scaffoldColor,
                          onTap: () {
                            if(guestController.selectedServices.isEmpty){
                              // CustomDialog.showErrorDialog(description: "Please Select the Service");
                              CustomDialog.showErrorDialog(description: Languages.of(context)!.pleaseSelectServices,context: context);
                            }else{
                              Get.to(() => BarberSelection(),
                                  transition: Transition.rightToLeft);
                            }

                          },
                          buttonText: Languages.of(context)!.next,
                        ),
                      ),
                    ],
                  ),
                ),
              ),
              SizedBox(height: 30),
            ],
          ),
        ),
      ),
    );
  }

  void _toggleSelection(ServicesModel service) {
    setState(() {

      if (guestController.selectedServices.contains(service)) {

        guestController.selectedServices.remove(service);
      } else {
        guestController.selectedServices.add(service);
      }
    });
  }
}

class ServiceOption extends StatelessWidget {
  final String title;
  final String description;
  final bool isSelected;
  final VoidCallback onTap;

  ServiceOption({
    required this.title,
    required this.description,
    required this.isSelected,
    required this.onTap,
  });

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: onTap,
      child: Container(
        margin: EdgeInsets.symmetric(vertical: 8),
        padding: EdgeInsets.all(16),
        decoration: BoxDecoration(
          color: AppColors.cardColor,
          borderRadius: BorderRadius.circular(8),
          boxShadow: [
            BoxShadow(
                color: Colors.black12, spreadRadius: 1, blurRadius: 3)
          ],
          border: Border.all(
              color: isSelected ? AppColors.buttonColor : Colors.transparent),
        ),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Container(
              width: 60.w,
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Tooltip(
                    message: title,
                    child: Text(
                      title,
                      style: TextStyle(
                        fontSize: 18,
                        fontWeight: FontWeight.bold,
                        color: AppColors.whiteColor
                      ),
                      overflow: TextOverflow.ellipsis,
                      maxLines: 2,
                      // Adjust maxLines as needed
                    ),
                  ),

                ],
              ),
            ),
            Row(
              children: [
                Text(description,style: TextStyle(color: AppColors.whiteColor54),),
                SizedBox(width: 10,),
                Container(
                  decoration: BoxDecoration(
                      color: AppColors.cardColor,
                      border: Border.all(color: isSelected ? AppColors.buttonColor:AppColors.buttonColor),
                      shape: BoxShape.circle
                  ),
                  child: Icon(Icons.circle, color: isSelected ? AppColors.buttonColor:Colors.transparent, size: 20,),
                ),
              ],
            )
          ],
        ),
      ),
    );
  }
}
