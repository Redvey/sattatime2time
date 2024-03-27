import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:livesattabazar/consts/app_drawer.dart';
import 'package:livesattabazar/consts/colors.dart';
import 'package:livesattabazar/consts/strings.dart';
import 'package:livesattabazar/screens/home_page/components/app_icon.dart';
import 'package:livesattabazar/screens/home_page/components/ceo_cards.dart';
import 'package:livesattabazar/screens/home_page/components/contact_buttons.dart';
import 'package:livesattabazar/screens/home_page/components/score_card.dart';
import 'package:livesattabazar/server/firebase_api.dart';
import 'package:simple_icons/simple_icons.dart';

import 'components/card_container.dart';
import 'components/category_boxes.dart';
import 'components/data_table.dart';
import 'components/page_view.dart';

class HomePage extends StatefulWidget {
  const HomePage({
    super.key,
  });

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  String selectedMonth = 'January';
  String selectedYear = '2022';

  @override
  void initState() {
    // TODO: implement initState

    super.initState();

    notif();


  }

  void notif() async{
    await Future.delayed(const Duration(seconds: 1));
    await Firebase.initializeApp();
    await FirebaseApi().initNotifications();
    // initPushNotifications();
    // OneSignal.initialize("11f90df3-faae-4731-96c7-51f30457e9af");
    // OneSignal.Notifications.requestPermission(true);
    // OneSignal.User.pushSubscription.addObserver((stateChanges) {
    //   print("OneDevice ID");
    //   debugPrint("deviceId = ${OneSignal.User.pushSubscription.id}");
    // });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        centerTitle: true,
        backgroundColor: primaryColor,
        title: SizedBox(
          height: 100.sp,
          width: 100.sp,
          child: Image.asset(AppText.titleLogo),
        ), // Replace with your app's title
        leading: Builder(
          builder: (context) => IconButton(
            icon: const Icon(Icons.menu), // Hamburger menu icon
            onPressed: () => Scaffold.of(context).openDrawer(),
          ),
        ),
      ),
      body: SingleChildScrollView(
        child: Column(
          children: [
             SizedBox(
              height: 20.sp,
            ),
             Padding(
              padding: EdgeInsets.symmetric(horizontal: 24.sp),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  CategoryBoxes(
                    title: AppText.categoryA,
                  ),
                  CategoryBoxes(
                    title: AppText.categoryA,
                  ),
                  CategoryBoxes(
                    title: AppText.categoryA,
                  ),
                ],
              ),
            ),
             SizedBox(
              height: 20.sp,
            ),
            const AppIcon(),
             SizedBox(
              height: 20.sp,
            ),
             CardContainer(
              height: 40.sp,
              color: Colors.black,
              child: Center(
                child: Text(
                  AppText.bannerTop,
                  style: TextStyle(color: Colors.white),
                ),
              ),
            ),
             CardContainer(
                height: 60.sp,
                color: Colors.red,
                child: Center(
                  child: Text(
                    AppText.bannerBetween,
                    style: TextStyle(fontWeight: FontWeight.w700, fontSize: 24.sp),
                  ),
                )),
             CardContainer(
              height: 180.sp,
              color: primaryColor,
              child: Padding(
                padding: EdgeInsets.all(8.sp),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.center,
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Text(AppText.ceoA),
                    Align(
                      alignment: Alignment.center,
                      child: Text(AppText.lorem),
                    ),
                    SizedBox(
                      height: 20.sp,
                    ),
                    Padding(
                      padding: EdgeInsets.symmetric(horizontal: 48.sp),
                      child: ContactButtons(
                        icon1: SimpleIcons.whatsapp,
                        icon2: Icons.call,
                      ),
                    )
                  ],
                ),
              ),
            ),
            const CeoCards(),
            const CeoCards(),
             SizedBox(
              height: 20.sp,
            ),
            //PageViews
            const SizedBox(
                width: double.infinity, height: 400, child: PageViewPages()),
            const SizedBox(
              height: 20,
            ),
            const CardContainer(
                height: 400,
                color: primaryLight,
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    ScoreCard(
                      time: 5,
                      me: 30,
                      against: 40,
                      gameName: AppText.disawer,
                    ),
                    ScoreCard(
                      time: 5,
                      me: 30,
                      against: 40,
                      gameName: AppText.gali,
                    ),
                    ScoreCard(
                      time: 5,
                      me: 30,
                      against: 40,
                      gameName: AppText.goaNight,
                    ),
                  ],
                )),
            Container(
              height: 400,
              width: double.infinity,
              decoration: const BoxDecoration(
                  color: primaryLightest,
                  image: DecorationImage(
                      image: AssetImage(AppText.titleLogo), fit: BoxFit.fill)),
            ),
            const CeoCards(),
            const CeoCards(),
            const CardContainer(
              height: 400,
              color: primaryLight,
              child: Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Column(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      ScoreCard(
                        time: 5,
                        me: 30,
                        against: 40,
                        gameName: AppText.disawer,
                      ),
                      ScoreCard(
                        time: 5,
                        me: 30,
                        against: 40,
                        gameName: AppText.gali,
                      ),
                      ScoreCard(
                        time: 5,
                        me: 30,
                        against: 40,
                        gameName: AppText.goaNight,
                      ),
                    ],
                  ),
                  Column(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      ScoreCard(
                        time: 5,
                        me: 30,
                        against: 40,
                        gameName: AppText.disawer,
                      ),
                      ScoreCard(
                        time: 5,
                        me: 30,
                        against: 40,
                        gameName: AppText.gali,
                      ),
                      ScoreCard(
                        time: 5,
                        me: 30,
                        against: 40,
                        gameName: AppText.goaNight,
                      ),
                    ],
                  )
                ],
              ),
            ),
            Container(
              height: 400,
              width: double.infinity,
              decoration: const BoxDecoration(
                  color: primaryLightest,
                  image: DecorationImage(
                      image: AssetImage(AppText.titleLogo), fit: BoxFit.fill)),
            ),

            const SizedBox(
              height: 20,
            ),
            // Search Field
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 24),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  // Month Selector
                  Expanded(
                    child: Container(
                      decoration: BoxDecoration(
                        color: primaryLight,
                        borderRadius: BorderRadius.circular(12),
                      ),
                      child: Padding(
                        padding: const EdgeInsets.all(2.0),
                        child: DropdownButton<String>(
                          value: selectedMonth,
                          // Use a variable to store the selected month
                          onChanged: (String? newValue) {
                            // Handle dropdown value change
                            setState(() {
                              selectedMonth =
                                  newValue!; // Update the selected month
                            });
                          },
                          items: <String>[
                            'January',
                            'February',
                            'March',
                            'April',
                            'May',
                            'June',
                            'July',
                            'August',
                            'September',
                            'October',
                            'November',
                            'December'
                          ].map<DropdownMenuItem<String>>((String value) {
                            return DropdownMenuItem<String>(
                              value: value,
                              child: Padding(
                                padding: const EdgeInsets.all(8.0),
                                child: Text(value),
                              ),
                            );
                          }).toList(),
                        ),
                      ),
                    ),
                  ),
                  const SizedBox(width: 20),
                  // Add spacing between the two dropdowns
                  // Year Selector
                  Expanded(
                    child: Container(
                      decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(12),
                          color: primaryLight),
                      child: Padding(
                        padding: const EdgeInsets.all(2.0),
                        child: DropdownButton<String>(
                          value: selectedYear,
                          // Use a variable to store the selected year
                          onChanged: (String? newValue) {
                            // Handle dropdown value change
                            setState(() {
                              selectedYear =
                                  newValue!; // Update the selected year
                            });
                          },
                          items: <String>[
                            '2022',
                            '2023',
                            '2024',
                            // Add more years as needed
                          ].map<DropdownMenuItem<String>>((String value) {
                            return DropdownMenuItem<String>(
                              value: value,
                              child: Padding(
                                padding: const EdgeInsets.all(8.0),
                                child: Text(value),
                              ),
                            );
                          }).toList(),
                        ),
                      ),
                    ),
                  ),
                ],
              ),
            ),
            const SizedBox(
              height: 20,
            ),

            //LeaderBoard
            const Padding(
              padding: EdgeInsets.symmetric(horizontal: 12),
              child: DataTableExample(),
            ),
            const SizedBox(
              height: 10,
            ),
            const Padding(
              padding: EdgeInsets.symmetric(horizontal: 12),
              child: DataTableExample(),
            ),
            const SizedBox(
              height: 10,
            ),
            const Padding(
              padding: EdgeInsets.symmetric(horizontal: 12),
              child: DataTableExample(),
            ),
            const SizedBox(
              height: 20,
            ),
            const SizedBox(
                width: double.infinity, height: 400, child: PageViewPages()),
            SizedBox(height: 20,)
          ],
        ),
      ),
      drawer: const AppDrawer(),
    );
  }
}
