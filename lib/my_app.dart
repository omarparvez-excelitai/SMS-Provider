import 'package:flutter/material.dart';
import 'package:otp_provider/presentation/dash_board.dart';
import 'package:otp_provider/presentation/drawer.dart';
import 'package:otp_provider/presentation/provider/controller.dart';
import 'package:provider/provider.dart' show ChangeNotifierProvider, MultiProvider;

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    //otpProvider(context);
    return MultiProvider(
      providers: [
        ChangeNotifierProvider<DashboardController>(
          create: (context) => DashboardController(),
        )
      ],
      child: MaterialApp(
          debugShowCheckedModeBanner: false,
          title: 'SMS Provider',
          theme: ThemeData(
            primarySwatch: Colors.blue,
          ),
          home: AppDrawer(
            child: Dashboard(),
          )

        // AllOtpStatus(),
      ),
    );
  }
}

