import 'package:beauty_connect_guest/constants/global_variables.dart';
import 'package:easy_date_timeline/easy_date_timeline.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:sizer/sizer.dart';

import '../widgets/custom_widgets.dart';

class Availability extends StatefulWidget {
  const Availability({super.key});

  @override
  State<Availability> createState() => _AvailabilityState();
}

class _AvailabilityState extends State<Availability> {
  final EasyInfiniteDateTimelineController _controller =
  EasyInfiniteDateTimelineController();
  List<String> availableTime = [
    "10:00 AM - 10:20 AM",
    "10:20 AM - 10:40 AM",
    "11:00 AM - 11:20 AM",
    "10:00 AM - 10:20 AM",
    "10:20 AM - 10:40 AM",
    "11:00 AM - 11:20 AM",
    "10:00 AM - 10:20 AM",
    "10:20 AM - 10:40 AM",
    "11:00 AM - 11:20 AM",
    "10:00 AM - 10:20 AM",
    "10:20 AM - 10:40 AM",
    "11:00 AM - 11:20 AM",
    "10:00 AM - 10:20 AM",
    "10:20 AM - 10:40 AM",
    "11:00 AM - 11:20 AM",
  ];
  int selectedAvailTime = -1;
  List<String> barberImages = [
    "assets/images/barber1.png",
    "assets/images/barber2.png",
    "assets/images/barber3.png",
  ];
  List<String> barberName = [
    "Jane Cooper",
    "Robert Fox",
    "Michel",
  ];

  @override
  Widget build(BuildContext context) {
    var isPortrait = MediaQuery.of(context).orientation == Orientation.portrait;
    var containerWidth = isPortrait ? 31.w : 31.w;

    return Scaffold(
      appBar: AppBar(
        elevation: 1.5,
        bottomOpacity: 0.1,
        automaticallyImplyLeading: false,
        backgroundColor: Colors.white,
        shadowColor: Colors.black26,
        title: Image.asset("assets/images/app_logo.png", scale: 9,),
      ),
      body: Column(
        children: [
          EasyDateTimeLine(
            initialDate: DateTime.now(),
            onDateChange: (selectedDate) {
              //`selectedDate` the new date selected.
            },
            headerProps:  EasyHeaderProps(
              monthPickerType: MonthPickerType.switcher,
              dateFormatter: DateFormatter.monthOnly(),
            ),
            dayProps:  EasyDayProps(
              height: 60,
              width: 50,
              inactiveDayStyle: DayStyle(dayNumStyle: headingSmall, dayStrStyle: bodySmall, decoration: BoxDecoration(color: AppColors.textFieldColor.withOpacity(0.7), borderRadius: BorderRadius.circular(8))),
              disabledDayStyle: DayStyle(dayNumStyle: headingSmall, dayStrStyle: bodySmall, ),
              dayStructure: DayStructure.dayStrDayNum,
              activeDayStyle: DayStyle(
                dayNumStyle: headingSmall.copyWith(color: Colors.white),
                dayStrStyle: bodySmall.copyWith(color: Colors.white),
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.all(Radius.circular(8)),
                  gradient: LinearGradient(
                    begin: Alignment.topCenter,
                    end: Alignment.bottomCenter,
                    colors: [
                      AppColors.buttonColor,
                      AppColors.buttonColor
                    ],
                  ),
                ),
              ),
            ),
          ),
          SizedBox(
            height: 15,
          ),
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 16.0),
            child: Align(
                alignment: Alignment.centerLeft,
                child: Text(
                  "Barbers",
                  style: headingMedium,
                )),
          ),
          SizedBox(height: 10,),
          SizedBox(
            height: 50,
            child: ListView.builder(
              itemCount: barberImages.length,
                physics: BouncingScrollPhysics(),
                padding: EdgeInsets.only(left: 18),
                scrollDirection: Axis.horizontal,
                itemBuilder: (context, index){
              return Padding(
                padding: const EdgeInsets.only(right: 25.0),
                child: Row(
                  children: [
                    ClipRRect(
                        borderRadius: BorderRadius.circular(10),
                        child: Image.asset(barberImages[index], scale: 5,)),
                    SizedBox(width: 10,),
                    Text(barberName[index], style: headingSmall,),
                  ],
                ),
              );
            }),
          ),
          SizedBox(height: 15,),
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 16.0),
            child: Align(
                alignment: Alignment.centerLeft,
                child: Text(
                  "Today's Schedule",
                  style: headingMedium,
                )),
          ),
          SizedBox(height: 10,),

          Container(
            width: double.infinity,
            // margin: EdgeInsets.symmetric(horizontal: 18),
            child: Wrap(
              spacing: 5,
              alignment: (availableTime.length < 3) ? WrapAlignment.start : WrapAlignment.center,
              children: [
                for (int i = 0; i < availableTime.length; i++)
                  GestureDetector(
                    onTap: (){
                      setState(() {
                        selectedAvailTime = i;
                      });
                    },
                    child: Container(
                      padding: EdgeInsets.symmetric(horizontal: 15, vertical: 15),
                      margin: EdgeInsets.only(bottom: 15, right: 5),
                      width: containerWidth,
                      decoration: BoxDecoration(
                        color: Colors.white,
                        borderRadius: BorderRadius.circular(100),
                        border: Border.all(color: selectedAvailTime == i ? AppColors.buttonColor : Colors.black12),
                      ),
                      child: Center(child: Text(availableTime[i], style: bodyMedium.copyWith(fontSize: 18),)),
                    ),
                  ),
              ],
            ),
          ),

        ],
      ),
    );
  }
}
