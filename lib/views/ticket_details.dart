import 'package:beauty_connect_guest/constants/global_variables.dart';
import 'package:flutter/material.dart';
import 'package:qr_flutter/qr_flutter.dart';
import 'package:sizer/sizer.dart';


class TicketDetails extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    var isPortrait = MediaQuery.of(context).orientation == Orientation.portrait;
    return Scaffold(
      appBar: AppBar(
        elevation: 1.5,
        bottomOpacity: 0.1,
        automaticallyImplyLeading: false,
        backgroundColor: Colors.white,
        shadowColor: Colors.black26,
        title: Image.asset("assets/images/app_logo.png", scale: 9,),
      ),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(
              'Eticket Details',
              style: TextStyle(fontSize: 24, fontWeight: FontWeight.bold),
            ),
            SizedBox(height: 20),
            Container(
              padding: EdgeInsets.all(16),
              decoration: BoxDecoration(
                color: Colors.white,
                borderRadius: BorderRadius.circular(8),
                boxShadow: [
                  BoxShadow(
                    color: Colors.grey.withOpacity(0.5),
                    spreadRadius: 5,
                    blurRadius: 7,
                    offset: Offset(0, 3),
                  ),
                ],
              ),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(
                        'Customer: John Doe',
                        style: headingSmall,
                      ),
                      SizedBox(height: 4),
                      Text('Service: Haircut & Shave', style: bodyMedium,),
                      Text('Barber: Alex', style: bodyMedium,),
                      Text('Position: 3', style: bodyMedium,),
                      Text('Estimated Wait Time: 20 mins', style: bodyMedium,),
                      SizedBox(height: 16),
                      Text(
                        'Salon',
                        style: headingSmall,
                      ),
                      Text('Address: 123 Barber Street, Cityville', style: bodyMedium,),
                      Text('Contact: (123) 456-7890', style: bodyMedium,),
                      SizedBox(height: 16),
                    ],
                  ),
                  Align(
                    alignment: Alignment.centerRight,
                    child: QrImageView(
                      data: 'https://example.com/eticket/1234567890',
                      version: QrVersions.auto,
                      size: 15.h,
                    ),
                  ),
                ],
              ),
            ),
            SizedBox(height: 20),
            Container(
              padding: EdgeInsets.all(16),
              decoration: BoxDecoration(
                color: Colors.white,
                borderRadius: BorderRadius.circular(8),
                boxShadow: [
                  BoxShadow(
                    color: Colors.grey.withOpacity(0.5),
                    spreadRadius: 5,
                    blurRadius: 7,
                    offset: Offset(0, 3),
                  ),
                ],
              ),
              child: Column(
                children: [
                  Text(
                    'Ticket 67',
                    style: headingLarge,
                  ),
                  SizedBox(height: 8),
                  Text(
                    'Horaire de passage estimé',
                    style: headingSmall.copyWith(color: AppColors.buttonColor),
                  ),
                  SizedBox(height: 8),
                  Text(
                    '15:43',
                    style: headingLarge.copyWith(fontSize: 48, color: Colors.blueAccent),
                  ),
                  SizedBox(height: 8),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Text(
                        'Coupe Homme',
                        style: headingSmall,
                      ),
                      Text(
                        'Oussama',
                        style: headingSmall,
                      ),
                    ],
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}
