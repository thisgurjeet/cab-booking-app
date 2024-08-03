// ignore_for_file: use_build_context_synchronously

import 'dart:developer';

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import 'package:uber/common/controller/services/firebasePushNotificatinServices/pushNotificationServices.dart';
import 'package:uber/common/controller/services/profileDataCRUDServices.dart';
import 'package:uber/common/model/profileDataModel.dart';
import 'package:uber/constant/constants.dart';
import 'package:uber/driver/controller/services/bottomNavBarRiderProvider.dart';
import 'package:uber/driver/view/accountScreenDriver/accountScreenRider.dart';
import 'package:uber/driver/view/activityScreenDriver/activityScreen.dart';
import 'package:uber/driver/view/homeScreenDriver/homeScreenBuilder.dart';

class BottomNavBarDriver extends StatefulWidget {
  const BottomNavBarDriver({super.key});

  @override
  State<BottomNavBarDriver> createState() => _BottomNavBarDriverState();
}

class _BottomNavBarDriverState extends State<BottomNavBarDriver> {
  int _currentIndex = 0;
  List<Widget> screens = [
    const DriverHomeScreeBuilder(),
    const ActivityScreenDriver(),
    const AccountScreenDriver(),
  ];

  @override
  void initState() {
    super.initState();
    WidgetsBinding.instance.addPostFrameCallback((_) async {
      ProfileDataModel profileData =
          await ProfileDataCRUDServices.getProfileDataFromRealTimeDatabase(
              auth.currentUser!.phoneNumber!);
      PushNotificationServices.initializeFirebaseMessagingForUsers(
          profileData, context);
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.green.shade400,
      body: IndexedStack(
        index: _currentIndex,
        children: screens,
      ),
      bottomNavigationBar: Consumer<BottomNavBarDriverProvider>(
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
                    tabProvider.updateTab(index);
                  });
                  log(index.toString());
                },
                items: [
                  BottomNavigationBarItem(
                    icon: Icon(_currentIndex == 0
                        ? CupertinoIcons.house_fill
                        : CupertinoIcons.house),
                    label: 'Home',
                  backgroundColor: const Color.fromARGB(255, 56, 56, 56),
                  ),
                  BottomNavigationBarItem(
                    icon: Icon(_currentIndex == 1
                        ? CupertinoIcons.square_list_fill
                        : CupertinoIcons.square_list),
                    label: 'Activity',
                   backgroundColor: const Color.fromARGB(255, 56, 56, 56),
                  ),
                  BottomNavigationBarItem(
                    icon: Icon(_currentIndex == 2
                        ? CupertinoIcons.person_fill
                        : CupertinoIcons.person),
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
