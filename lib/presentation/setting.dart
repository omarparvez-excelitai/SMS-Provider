
import 'package:flutter/material.dart';
import 'package:otp_provider/presentation/provider/controller.dart';
import 'package:otp_provider/theme/theme.dart';
import 'package:otp_provider/globals.dart' as globals;
import 'package:provider/provider.dart' show Provider;
import 'package:shared_preferences/shared_preferences.dart';

class Setting extends StatefulWidget {
  const Setting({Key? key}) : super(key: key);


  @override
  State<Setting> createState() => _SettingState();
}

class _SettingState extends State<Setting> {


  ///
  // setManualNumToPrefs() async {
  //
  //   DashboardController dashboardController =
  //   Provider.of(context, listen: false);
  //   SharedPreferences prefs = await SharedPreferences.getInstance();
  //
  //
  //
  //   globals.installedNumber = prefs.getString('installedNumber').toString();
  //   // dashboardController.installedNumber( prefs.getString('installedNumber').toString());
  //
  //
  //   globals.manuallySim1 = prefs.getString('manuallySim1').toString();
  //
  //   globals.manuallySim2 = prefs.getString('manuallySim2').toString();
  //
  //
  // }
  ///
 //  @override
 //  initState() {
 //    super.initState();
 //
 //  //globals.getManualNumFromPrefs();
 // //    setManualNumToPrefs();
 //  }

  @override
  Widget build(BuildContext context) {
    // DashboardController dashboardController =
    // Provider.of(context, listen: false);
  // setManualNumToPrefs();
    return Scaffold(
      appBar: AppBar(
        title: const Text(
          'Setting',
        ),
        centerTitle: true,
        backgroundColor: theme.primaryColor.withOpacity(.8),
        // leading: Builder(
        //
        //   builder: (BuildContext appBarContext) {
        //     return IconButton(
        //         onPressed: () {
        //           AppDrawer.of(appBarContext)!.toggle();
        //         },
        //         icon: const Icon(Icons.menu));
        //   },
        // ),
        leading: IconButton(
          icon: const Icon(
            Icons.arrow_back,
          ),
          onPressed: () {
            Navigator.pop(context);
          },
        ),
      ),
      body:

      //  Center(
      //   child: Column(
      //
      //     children: <Widget>[
      //       Text('Running on: $_mobileNumber\n'),
      //       fillCards()
      //     ],
      //   ),
      // ),

      Center(
        child: Column(
          children: [
            SizedBox(
              height: 100,
            ),


            Text(
             // 'Installed Number: ${dashboardController.installed.toString()}',
              'Installed Number: ${globals.installedNumber}',
              style: TextStyle(
                  fontSize: 20,
                  fontWeight: FontWeight.bold,
                  color: theme.titleTextColor),
            ),
            SizedBox(
              height: 20,
            ),
            Text(
                'SIM1 :  ${globals.automaticallySim1!.isEmpty ? globals.manuallySim1! : globals.automaticallySim1}',
                style: TextStyle(
                    fontSize: 20,
                    fontWeight: FontWeight.bold,
                    color: theme.titleTextColor)),
            SizedBox(
              height: 20,
            ),
            Text(
              'SIM2 :  ${globals.automaticallySim2!.isEmpty ? globals.manuallySim2! : globals.automaticallySim2}',
              style: TextStyle(
                  fontSize: 20,
                  fontWeight: FontWeight.bold,
                  color: theme.titleTextColor),
            ),
          ],
        ),
      ),
    );
  }
}
