// ignore_for_file: use_build_context_synchronously

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import 'package:uber/common/controller/services/firebasePushNotificatinServices/pushNotificationServices.dart';
import 'package:uber/common/controller/services/profileDataCRUDServices.dart';
import 'package:uber/common/model/profileDataModel.dart';
import 'package:uber/constant/constants.dart';

import 'package:uber/rider/controller/provider/bottomNavBarRiderProvider/bottomNavBarRiderProvider.dart';
import 'package:uber/rider/view/account/accountScreenRider.dart';
import 'package:uber/rider/view/acitivity/activityScreen.dart';
import 'package:uber/rider/view/homeScreen/homeScreenBuilder.dart';
import 'package:uber/rider/view/serviceScreen/serviceScreen.dart';

class BottomNavBarRider extends StatefulWidget {
  const BottomNavBarRider({super.key});

  @override
  State<BottomNavBarRider> createState() => _BottomNavBarRiderState();
}

class _BottomNavBarRiderState extends State<BottomNavBarRider> {
  int _currentIndex = 0;
  List<Widget> screens = [
    const RiderHomeScreeBuilder(),
    const ServiceScreenRider(),
    const ActivityScreenRider(),
    const AccountScreenRider(),
  ];

  @override
  void initState() {
    super.initState();
    _initializeProfileData();
  }

  Future<void> _initializeProfileData() async {
    ProfileDataModel profileData =
        await ProfileDataCRUDServices.getProfileDataFromRealTimeDatabase(
            auth.currentUser!.phoneNumber!);
    PushNotificationServices.initializeFirebaseMessagingForUsers(
        profileData, context);
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      // backgroundColor: Colors.green.shade300,
      body: IndexedStack(
        index: _currentIndex,
        children: screens,
      ),
      bottomNavigationBar: Consumer<BottomNavBarRiderProvider>(
        builder: (context, tabProvider, child) {
          return Container(
            height: 65,
            margin: const EdgeInsets.only(left: 10, right: 10, bottom: 10),
            decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(10),
            ),
            child: ClipRRect(
              borderRadius: BorderRadius.circular(10),
              child: BottomNavigationBar(
                type: BottomNavigationBarType.shifting,
                selectedItemColor: Colors.yellow,
                unselectedItemColor: Colors.yellow.shade100,
                backgroundColor: Colors.black,
                currentIndex: _currentIndex,
                onTap: (index) {
                  setState(() {
                    _currentIndex = index;
                    tabProvider.currentTab = index;
                  });
                },
                items: [
                  BottomNavigationBarItem(
                    icon: Icon(
                        _currentIndex == 0
                            ? CupertinoIcons.house_fill
                            : CupertinoIcons.house,
                        size: 20),
                    label: 'Home',
                    backgroundColor: const Color.fromARGB(255, 56, 56, 56),
                  ),
                  BottomNavigationBarItem(
                    icon: Icon(
                        _currentIndex == 1
                            ? CupertinoIcons.circle_grid_3x3_fill
                            : CupertinoIcons.circle_grid_3x3,
                        size: 20),
                    label: 'Services',
                    backgroundColor: const Color.fromARGB(255, 56, 56, 56),
                  ),
                  BottomNavigationBarItem(
                    icon: Icon(
                        _currentIndex == 2
                            ? CupertinoIcons.square_list_fill
                            : CupertinoIcons.square_list,
                        size: 20),
                    label: 'Activity',
                    backgroundColor: const Color.fromARGB(255, 56, 56, 56),
                  ),
                  BottomNavigationBarItem(
                    icon: Icon(
                        _currentIndex == 3
                            ? CupertinoIcons.person_fill
                            : CupertinoIcons.person,
                        size: 20),
                    label: 'Account',
                    backgroundColor: const Color.fromARGB(255, 56, 56, 56),
                  ),
                ],
              ),
            ),
          );
        },
      ),
    );
  }
}
