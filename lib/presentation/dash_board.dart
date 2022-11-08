import 'package:flutter/material.dart';
import 'package:otp_provider/presentation/send_notice_sms.dart';
import 'package:otp_provider/presentation/select_phone_number.dart';
import 'package:otp_provider/presentation/sms_status.dart';

import 'package:otp_provider/theme/theme.dart';
import 'package:otp_provider/presentation/all_otp_status.dart';

import 'drawer.dart';

import 'package:animations/animations.dart';
import 'package:velocity_x/velocity_x.dart';

import 'package:flutter/services.dart';
import 'package:mobile_number/mobile_number.dart';
import 'package:mobile_number/sim_card.dart';
import 'package:otp_provider/theme/theme.dart';
import 'package:otp_provider/globals.dart' as globals;


class Dashboard extends StatefulWidget {
  const Dashboard({Key? key}) : super(key: key);

  @override
  State<Dashboard> createState() => _DashboardState();
}

class _DashboardState extends State<Dashboard> {

  String _mobileNumber = '';
  List<SimCard> _simCard = <SimCard>[];

  @override
  void initState() {
    super.initState();
    MobileNumber.listenPhonePermission((isPermissionGranted) {
      if (isPermissionGranted) {
        initMobileNumberState();
      } else {}
    });

    initMobileNumberState();
    globals.getManualNumFromPrefs();
  }

  // Platform messages are asynchronous, so we initialize in an async method.
  Future<void> initMobileNumberState() async {
    if (!await MobileNumber.hasPhonePermission) {
      await MobileNumber.requestPhonePermission;
      return;
    }
    // Platform messages may fail, so we use a try/catch PlatformException.
    try {
      _mobileNumber = (await MobileNumber.mobileNumber)!;
      _simCard = (await MobileNumber.getSimCards)!;
    } on PlatformException catch (e) {
      debugPrint("Failed to get mobile number because of '${e.message}'");
    }

    // If the widget was removed from the tree while the asynchronous platform
    // message was in flight, we want to discard the reply rather than calling
    // setState to update our non-existent appearance.
    if (!mounted) return;

    setState(() {
   globals.automaticallySim1=_mobileNumber;
//  globals.getManualNumFromPrefs();
    });
  }

  Widget fillCards() {
    List<Widget> widgets = _simCard
        .map((SimCard sim) => Text(
        'Sim Card Number: (${sim.countryPhonePrefix}) - ${sim.number}\nCarrier Name: ${sim.carrierName}\nCountry Iso: ${sim.countryIso}\nDisplay Name: ${sim.displayName}\nSim Slot Index: ${sim.slotIndex}\n\n'))
        .toList();


    //  globals.sim1=_mobileNumber;
    return Column(children: widgets);
  }

  List<Page> pageList = [
    Page(
      title: "SMS Status",
      icon: 'asset/check-list.png',
      page:
     AllOtpStatus(isRequest: false,isSent: false,),
       ),
    Page(
      title: "Send Notice SMS",
      icon: 'asset/comments.png',
      page:SendNoticeSms(),
     // page:AllOtpStatus(isRequest: true,isSent: false,),
    ),
    Page(
      title: "Send OTP SMS",
      icon: 'asset/send.png',
      page:AllOtpStatus(isRequest: false,isSent: true,),
    ),
    Page(
     // title: "Select Phone Number"
     title: "Phone Number",


      icon: 'asset/mobile-banking.png',
      page:const SelectPhoneNumberPage(),
     // page:AllOtpStatus(isRequest: false,isSent: true,),
    ),
    Page(
      title: "Buy Sms",
      icon: 'asset/buy.png',
     page:AllOtpStatus(isRequest: false,isSent: true,),
    ),
    Page(
      title: "Remaining Sms",
      icon: 'asset/countdown.png',
      // page: SmsAdvanced(),
     // page:AllOtpStatus(isRequest: false,isSent: true,),
    ),
  ];

  @override

  Widget build(BuildContext context) {



    //List<Page> pageList=[Page(title: "All Otp Satus",icon: 'asset/check-list.png',page: AllOtpStatus(context))];
    return SafeArea(
      child: Scaffold(
        //backgroundColor: Colors.white,
       backgroundColor: theme.primaryColor,
        body: Stack(
          children: <Widget>[dashBg, content],
        ),
      ),
    );
  }

  get dashBg => Column(
        children:  <Widget>[
          Expanded(
            child: Container(
              decoration: BoxDecoration(
                color: theme.primaryColor,
                // borderRadius: BorderRadius.only(
                //   bottomLeft: Radius.circular(30),
                //   bottomRight: Radius.circular(30),
                // ),
              ),
            ),
            flex: 2,
          ),
          Expanded(
            child: Container(
              decoration: BoxDecoration(
                color: Colors.white,
                borderRadius: BorderRadius.only(
                  topLeft: Radius.circular(25),
                  topRight: Radius.circular(25),
                ),
              ),
            ),
            flex: 5,
          ),
        ],
      );

  get content => Container(
        padding: EdgeInsets.symmetric(horizontal: 20),
        child: Column(
          children: <Widget>[
            header,
            grid,
          ],
        ),
      );

  get header => Column(
        children: [
          ListTile(
            contentPadding: EdgeInsets.only(left: 00, right: 0, top: 10),
            leading: Builder(
              builder: (BuildContext appBarContext) {
                return IconButton(
                    onPressed: () {
                      AppDrawer.of(appBarContext)!.toggle();
                    },
                    icon: Icon(
                      Icons.menu,
                      color: Colors.white,
                    ));
              },
            ),
            title: Center(
              child: Text(
                'Dashboard',
                style: TextStyle(
                    color: Colors.white,
                    fontSize: 20,
                    fontWeight: FontWeight.bold),
              ),
            ),
            subtitle: Center(
              child: Text(
                'Welcome To Our Otp Service',
                style: TextStyle(color: Colors.white),
              ),
            ),
            // trailing: CircleAvatar(
            //   backgroundImage: NetworkImage(
            //       'https://image.shutterstock.com/image-photo/head-shot-portrait-close-smiling-260nw-1714666150.jpg'
            //   ),
            // ),
          ),
          Container(
              child: VStack([
            'Main Menu'
                .text
                .white
                .xl
                .bold
                .make()
                .box
                .width(300)
                .height(50)
                .alignCenter
                .rounded
                .neumorphic(
                    color: theme.primaryColor,
                    elevation: 8,
                    curve: VxCurve.flat)
                .make(),
          ])

              // Container(
              //   height: 30,width: 100,
              //   decoration:nMbox,
              //   child:  Text(
              //   'Main Menu',
              //   style: TextStyle(
              //     color: Colors.white,
              //     fontWeight: FontWeight.bold,
              //     fontSize: 20,
              //   ),
              // ) ,
              // )

              ),
        ],
      );

  get grid => Expanded(
        child: Container(
          padding: EdgeInsets.only(left: 16, right: 16, bottom: 16, top: 00),
          child: GridView.builder(
            // crossAxisSpacing: 26,
            // mainAxisSpacing: 16,
            // crossAxisCount: 2,
            // childAspectRatio: 1.1,
            gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
              crossAxisCount: 2,
              crossAxisSpacing: 16,
              mainAxisSpacing: 16,
            ),
            itemCount: pageList.length,
            itemBuilder: ((context, index) {
              return Card(
                elevation: 7,
                shadowColor: theme.primaryColor,
                shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.only(
                        topLeft: Radius.circular(20),
                        bottomRight: Radius.circular(20)
                    )
                ),
                child: OpenContainer(
                    openShape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.only(
                            topLeft: Radius.circular(20),
                            bottomRight: Radius.circular(20))),
                    openBuilder: (BuildContext _, VoidCallback __) {
                      return pageList[index].page;
                    },

                    // AppDrawer(child: AppOtpPage()),

                    transitionType: ContainerTransitionType.fade,
                    transitionDuration: const Duration(milliseconds: 800),
                    closedBuilder:
                        (BuildContext _, VoidCallback openContainer) {
                      return GestureDetector(
                        onTap: openContainer,
                        child: Center(
                          child: Column(
                            //crossAxisAlignment: CrossAxisAlignment.center,
                            mainAxisAlignment: MainAxisAlignment.center,
                            // mainAxisSize: MainAxisSize.min,
                            children: <Widget>[
                              SizedBox(
                                height: 20,
                              ),
                              Expanded(
                                  child: Center(
                                      child: Image.asset(
                                          pageList[index].icon.toString()))),
                              Expanded(
                                  child: Center(
                                      child: Text(
                                          pageList[index].title.toString())))
                            ],
                          ),
                        ),
                      );
                    }),
              );
            }),
          ),
        ),
      );
}

class Page {
  String? title;
  String? icon;
  var page;

  Page({this.title, this.icon, this.page});
}






