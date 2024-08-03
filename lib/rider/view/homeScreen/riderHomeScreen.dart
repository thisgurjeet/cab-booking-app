import 'package:flutter/material.dart';
import 'package:page_transition/page_transition.dart';
import 'package:sizer/sizer.dart';
import 'package:uber/constant/utils/colors.dart';
import 'package:uber/constant/utils/textStyles.dart';
import 'package:uber/rider/controller/services/rideRequestServices/rideRequestServices.dart';
import 'package:uber/rider/view/custom_painter.dart';
import 'package:uber/rider/view/selectPickupAndDropLocationScreen/selectPickupAndDropLocationScreen.dart';

class RiderHomeScreen extends StatefulWidget {
  const RiderHomeScreen({super.key});

  @override
  State<RiderHomeScreen> createState() => _RiderHomeScreenState();
}

class _RiderHomeScreenState extends State<RiderHomeScreen> {
  double currentCarbonFootprint = 0.0;
  double maxCarbonFootprint = 100.00;

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    RideRequestServices.getRideHistory(context);
  }

  List suggestions = [
    ['assets/images/suggestions/trip.png', 'Trip'],
    ['assets/images/suggestions/rentals.png', 'Rentals'],
    ['assets/images/suggestions/reserve.png', 'Reserve'],
    ['assets/images/suggestions/intercity.png', 'Intercity'],
  ];
  List moreWaysToUber = [
    [
      'assets/images/moreWaysUber/sendAPackage.png',
      'Send a package',
      'On-demand delivery across town'
    ],
    [
      'assets/images/moreWaysUber/premierTrips.png',
      'Premier trips',
      'Top-rated drivers, newer cars',
    ],
    [
      'assets/images/moreWaysUber/safetyToolKit.png',
      'Safety Toolkit',
      'On-trip help with safety issues'
    ],
  ];
  List planYourNextTrip = [
    [
      'assets/images/planNextTrip/travelIntercity.png',
      'Travel intercity',
      'Get to remote locations with ease',
    ],
    [
      'assets/images/planNextTrip/rentals.png',
      'Rentals',
      'Travel from 1 to 12 hours'
    ],
  ];
  List saveEveryDay = [
    [
      'assets/images/saveEveryDay/uberMotoTrips.png',
      'Uber Moto trips',
      'Affordable motorcycle pick-ups'
    ],
    [
      'assets/images/saveEveryDay/tryAGroupTrip.png',
      'Try a group trip',
      'Seamless trips, together'
    ],
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(
          'Cabify',
          style: AppTextStyles.heading20Bold,
        ),
      ),
      body: ListView(
        padding: EdgeInsets.symmetric(horizontal: 3.w, vertical: 2.h),
        physics: const BouncingScrollPhysics(),
        shrinkWrap: true,
        children: [
          //  Where To button
          InkWell(
            onTap: () {
              Navigator.push(
                context,
                PageTransition(
                  child: const PickupAndDropLocationScreen(),
                  type: PageTransitionType.rightToLeft,
                ),
              );
            },
            child: Container(
              padding: EdgeInsets.symmetric(
                horizontal: 3.w,
                vertical: 1.h,
              ),
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(
                  50.sp,
                ),
                color: Colors.green.shade200,
              ),
              child: Row(
                children: [
                  Icon(
                    Icons.search,
                    color: black87,
                    size: 4.h,
                  ),
                  SizedBox(
                    width: 5.w,
                  ),
                  Text(
                    'Where to?',
                    style: AppTextStyles.body14Bold,
                  ),
                ],
              ),
            ),
          ),
          SizedBox(
            height: 1.3.h,
          ), //   Previous Trip Records
          // FutureBuilder(future: ,builder: (context,snapshot){})
          ListView.builder(
              itemCount: 2,
              shrinkWrap: true,
              physics: const NeverScrollableScrollPhysics(),
              itemBuilder: (context, index) {
                return Container(
                  margin: EdgeInsets.symmetric(vertical: 0.5.h),
                  padding: EdgeInsets.symmetric(vertical: 0.5.h),
                  child: Row(
                    children: [
                      CircleAvatar(
                        backgroundColor: Colors.white,
                        radius: 3.h,
                        child: Icon(
                          size: 30,
                          Icons.location_on,
                          color: Colors.green.shade300,
                        ),
                      ),
                      SizedBox(
                        width: 3.w,
                      ),
                      Expanded(
                          child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Text(
                            'Main Address',
                            style: AppTextStyles.body14Bold,
                          ),
                          Text(
                            'Main Address Description',
                            style:
                                AppTextStyles.small10.copyWith(color: black38),
                          ),
                        ],
                      )),
                      SizedBox(
                        width: 3.w,
                      ),
                      Icon(
                        Icons.arrow_forward_ios,
                        color: greyShade3,
                        size: 15.sp,
                      )
                    ],
                  ),
                );
              }),

          //   Suggestions
          SizedBox(
            height: 2.h,
          ),

          //  Banner
          SizedBox(
            height: 2.h,
          ),

          // Custom painter for carbon emission
          // here i want a circular container of white color and a blue line at border which will tell the
          // amount of carbon footprint, my limit is 1000 kgs, the blue line will adjust dynamially itself
          // in the center of circle it will show the value of carbon footprint sum till now

          Center(
            child: CustomPaint(
              size: Size(40.w, 40.w), // Size of the circular container
              painter: CarbonFootprintPainter(
                  currentCarbonFootprint, maxCarbonFootprint),
            ),
          ),
          Column(
            children: [
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Text(
                    'Suggestions',
                    style: AppTextStyles.body14Bold,
                  ),
                  Text(
                    'See all',
                    style: AppTextStyles.small10.copyWith(color: black87),
                  ),
                ],
              ),
              SizedBox(
                height: 2.h,
              ),

              // an image for Extra rewards to earn for user
            ],
          ),

          SizedBox(
            height: 6.h,
          ),
          ExploreFeaturesHorizontalListView(
            title: 'Plan your next Trip',
            list: planYourNextTrip,
          ),
          SizedBox(
            height: 4.h,
          ),
          ExploreFeaturesHorizontalListView(
            title: 'Save Every day',
            list: saveEveryDay,
          ),
          SizedBox(
            height: 2.h,
          ),
        ],
      ),
    );
  }
}

class ExploreFeaturesHorizontalListView extends StatelessWidget {
  const ExploreFeaturesHorizontalListView(
      {super.key, required this.list, required this.title});

  final List list;
  final String title;

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(
          title,
          style: AppTextStyles.body14Bold,
        ),
        SizedBox(
          height: 1.h,
        ),
        SizedBox(
          height: 22.h,
          child: ListView.builder(
              physics: const BouncingScrollPhysics(),
              scrollDirection: Axis.horizontal,
              shrinkWrap: true,
              itemCount: list.length,
              itemBuilder: (context, index) {
                return Container(
                  margin: EdgeInsets.only(
                      left: index == 0 ? 0 : 1.5.w,
                      right: index == (list.length - 1) ? 0 : 1.5.w),
                  height: 18.h,
                  width: 65.w,
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Container(
                        height: 15.h,
                        width: 65.w,
                        decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(8.sp),
                          image: DecorationImage(
                              image: AssetImage(
                                list[index][0],
                              ),
                              fit: BoxFit.fill),
                        ),
                      ),
                      const Spacer(),
                      Row(
                        children: [
                          Text(
                            list[index][1],
                            style: AppTextStyles.small12Bold,
                          ),
                          SizedBox(
                            width: 3.w,
                          ),
                          Icon(
                            Icons.arrow_forward,
                            size: 2.h,
                            color: black87,
                          )
                        ],
                      ),
                      SizedBox(
                        height: 0.2.h,
                      ),
                      Text(
                        list[index][2],
                        style: AppTextStyles.small10.copyWith(color: black87),
                      ),
                    ],
                  ),
                );
              }),
        )
      ],
    );
  }
}
