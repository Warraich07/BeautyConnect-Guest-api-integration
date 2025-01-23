import 'dart:convert';

import 'package:beauty_connect_guest/localization/languages/languages.dart';
import 'package:beauty_connect_guest/models/barbers_model.dart';
import 'package:beauty_connect_guest/models/services_model.dart';
import 'package:beauty_connect_guest/views/ticket_web_view.dart';
import 'package:flutter/cupertino.dart';
import 'package:get/get.dart';
import 'package:get/get_state_manager/src/simple/get_controllers.dart';
import 'package:intl/intl.dart';

import '../api_services/api_exceptions.dart';
import '../api_services/data_api.dart';
import '../utils/custom_dialogbox.dart';
import '../views/ticket_details.dart';
import 'base_controller.dart';

class GuestController extends GetxController{
  RxBool isLoading =false.obs;
  RxString accessToken = "".obs;
  Rxn<int> barberId = Rxn<int>();
  RxList<ServicesModel> serviceList = <ServicesModel>[].obs;
  RxList<ServicesModel> selectedServices = <ServicesModel>[].obs;
  RxList<BarbersModel> availableBarbers=<BarbersModel>[].obs;
  final BaseController _baseController = BaseController.instance;
  RxString ticketUrl=''.obs;
  Future getUserServices(BuildContext context) async {
    isLoading.value=true;
    var response = await DataApiService.instance
        .get(
      'get-services-for-guest',
    )
        .catchError((error) {
      if (error is BadRequestException) {
        var apiError = json.decode(error.message!);
        CustomDialog.showErrorDialog(description: apiError["reason"],context: context);
      } else {}
    });
    isLoading.value=false;
    if (response == null) return;

    print(response);
    var result = json.decode(response);
    if (result['success']) {
      serviceList.value = List<ServicesModel>.from(
          result['data'].map((x) => ServicesModel.fromJson(x)));
      print("serviceList.length.toString()");

    } else {
      // List<dynamic> errorMessages = result['message'];
      // String errorMessage = errorMessages.join('\n');
      CustomDialog.showErrorDialog(description: result['message'],context: context);
    }
  }
  Future getAvailableBarbers(BuildContext context) async {
    Future.microtask(()async{
      isLoading.value=true;
      var response = await DataApiService.instance
          .post(
          'get-babers-for-guest?service_ids=${selectedServices.map((e){
            return e.id.toString();
          }
          ).toList().join(",")}',{}
      )
          .catchError((error) {
        if (error is BadRequestException) {
          var apiError = json.decode(error.message!);
          CustomDialog.showErrorDialog(description: apiError["reason"],context: context);
        } else {}
      });
      isLoading.value=false;
      if (response == null) return;

      print(response);
      var result = json.decode(response);
      if (result['success']) {
        availableBarbers.value = List<BarbersModel>.from(
            result['data'].map((x) => BarbersModel.fromJson(x)));


      } else {
        if(result['message']=="Validation failed"){
          CustomDialog.showErrorDialog(description: "Please Select the Service",context: context);
        }
        // List<dynamic> errorMessages = result['message'];
        // String errorMessage = errorMessages.join('\n');
        // CustomDialog.showErrorDialog(description: result['message']);
      }
    });
  }
  Future createGuestAppointment(String userName,String email,String phoneNumber,BuildContext context) async {
    Future.microtask(()async{
      Map<String,String> body={
        'services': selectedServices.map((e){
          return e.id.toString();
        }
        ).toList().join(","),
        // 'date': DateFormat('yyyy-MM-dd').format(DateTime.now()),
        'username': userName,
        'email': email,
        'phone': phoneNumber.removeAllWhitespace.replaceAll('-', ''),
        'description': '',
        if(barberId.value!=null)
        'barber_id':barberId.toString()
      };
      print(body);
      // _baseController.showLoading('Adding Customer');
      _baseController.showLoading(Languages.of(context)!.addingCustomer);
      var response = await DataApiService.instance
          .post('create-guest-booking',body).catchError((error) {
        if (error is BadRequestException) {
          var apiError = json.decode(error.message!);
          CustomDialog.showErrorDialog(description: apiError["reason"],context: context);
        } else {}
      });
      _baseController.hideLoading();
      if (response == null) return;

      print(response);
      var result = json.decode(response);
      if (result['success']) {
        selectedServices.clear();
        ticketUrl.value=result['e_ticket_url'];
        Get.to(()=> TicketWebView(), transition: Transition.rightToLeft);
        // availableBarbers.value = List<BarbersModel>.from(
        //     result['data'].map((x) => BarbersModel.fromJson(x)));

      } else {
        // List<dynamic> errorMessages = result['message'];
        // String errorMessage = errorMessages.join('\n');
        CustomDialog.showErrorDialog(description: result['message'],context: context);
      }
    });
  }
}