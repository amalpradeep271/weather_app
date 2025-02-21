import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:weather_app/core/configs/theme/app_colors.dart';
import 'package:weather_app/presentation/home/provider/home_provider.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({super.key});

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  @override
  void initState() {
    statrupCall();
    super.initState();
  }

  void statrupCall() {
    context.read<HomeProvider>().initialize(context);
  }

  @override
  Widget build(BuildContext context) {
    return Consumer<HomeProvider>(
      builder: (context, homeProvider, child) {
        return Scaffold(
          appBar: customAppBar(homeProvider: homeProvider),
          body: Container(
            decoration: BoxDecoration(
              gradient: LinearGradient(
                begin: Alignment.topCenter,
                end: Alignment.bottomCenter,
                colors: [AppColors.primaryPurple, AppColors.secondaryPurple],
              ),
            ),
          ),
        );
      },
    );
  }

  customAppBar({HomeProvider? homeProvider}) {
    MediaQueryData? mqData;

    return AppBar(
      backgroundColor: Colors.black12,
      flexibleSpace: Container(
        decoration: BoxDecoration(
          gradient: LinearGradient(
            colors: [Colors.orange.shade100, Colors.blue.shade100],
            begin: Alignment.centerLeft,
            end: Alignment.centerRight,
          ),
        ),
      ),
      title: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Row(
            children: [
              Image.asset("assets/map.png", height: 30),
              const SizedBox(width: 10),
              Text(
                homeProvider!.currentLocation,
                style: TextStyle(color: Colors.black54, fontSize: 18),
              ),
            ],
          ),
          const SizedBox(height: 4),

          /// here we show day status current we showing Good morning
          // Text(
          //   getGreeting(),
          //   style: myTextStyle28(fontColor: Colors.black),
          // ),
        ],
      ),
      toolbarHeight: mqData!.size.height * 0.1,

      // actions: [
      //   /// search button
      //   searchShow
      //       ? Padding(
      //         padding: const EdgeInsets.symmetric(
      //           vertical: 8.0,
      //           horizontal: 8.0,
      //         ),
      //         child: SizedBox(
      //           height: 50,
      //           width: 50,
      //           child: MyIconButton(
      //             buttonIcon: Icons.close_rounded,
      //             buttonColor: Colors.blue.shade200,
      //             iconSize: 35,
      //             onTap: () {
      //               setState(() {
      //                 searchShow = false;
      //                 locationController.clear();
      //                 _getCurrentLocation();
      //               });
      //             },
      //           ),
      //         ),
      //       )
      //       : Padding(
      //         padding: const EdgeInsets.symmetric(
      //           vertical: 8.0,
      //           horizontal: 8.0,
      //         ),
      //         child: SizedBox(
      //           height: 50,
      //           width: 50,
      //           child: MyIconButton(
      //             buttonIcon: Icons.search_outlined,
      //             buttonColor: Colors.blue.shade300,
      //             iconSize: 35,
      //             onTap: () {
      //               setState(() {
      //                 searchShow = true;
      //               });
      //             },
      //           ),
      //         ),
      //       ),
      // ],
    );
  }
}
