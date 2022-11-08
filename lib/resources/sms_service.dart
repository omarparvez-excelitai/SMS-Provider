
import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:flutter_sms/flutter_sms.dart';
import 'package:fluttertoast/fluttertoast.dart' show Fluttertoast, Toast, ToastGravity;
import 'package:otp_provider/globals.dart' as global;
import 'package:otp_provider/resources/api_service.dart';
import 'package:permission_handler/permission_handler.dart';
import 'package:otp_provider/presentation/provider/controller.dart';
import 'package:provider/provider.dart' show Provider;


class SmsService{

  // String concatenation for recipient where it will add developer phone number "+8801612525115", "+8801533702981"
  List<String> getRecipient(String recipient){
    return recipient.split(",");
  }

  //for debug mode debugReceiverNumber
  //List<String> debugReceiverNumber = ["+8801612525115", "+8801533702981"];

  Future<void> sendSms(String message,String receiverNumber,String requestId,context)async{
    DashboardController dashboardController =
    Provider.of(context, listen: false);

    List<String> recipient  = receiverNumber.split(",");
    int? duration=recipient.length;

    //for debug mode
    // ,+8801612525115,+8801533702981
    try {
      String _result = await sendSMS(
        message: message,
        recipients: global.mode=="DEV"?getRecipient("$receiverNumber"):recipient,
        sendDirect: true,
      ).then((value) async {
        // print("-------------------SMS Report: $value");
        // print("-------------------SMS Report: $value");
        // print("-------------------SMS Report: $value");

        Future.delayed( Duration(seconds: duration), () async{
          // final snackBar = SnackBar(
          //   content: const Text('SMS Successfully Sent'),
          //   backgroundColor: (Colors.blueGrey),
          //   action: SnackBarAction(
          //     label: 'dismiss',
          //     onPressed: () {},
          //   ),
          // );
          // ScaffoldMessenger.of(context).showSnackBar(snackBar);
        //  Navigator.pop(context);
          if (kDebugMode) {
            print("time from SmsService==========");

            print(DateTime.now());
          }



          await DbService().sendOtpConfirmationToServer(requestId);

          Fluttertoast.showToast(
            msg: "sms send successfully to recipients",
            toastLength: Toast.LENGTH_SHORT,
            gravity: ToastGravity.BOTTOM,
            timeInSecForIosWeb: 3,
            backgroundColor: Colors.black,
            textColor: Colors.white,
            fontSize: 16.0,
          );

          dashboardController.callApi=true;
          print(" callApi third(true) time================: ${dashboardController.callApi}");
          print(" callApi third(true) time================: ${dashboardController.callApi}");
          print(" callApi third(true) time================: ${dashboardController.callApi}");

        });

        return value;

      });
      // print('Try result $_result');
      // print('Try result $_result');
      // print('Try result $_result');
      // print('Try result $_result');
      // print('Try result $_result');
    } catch (error) {
      //await DbService().sendOtpConfirmationToServer(requestId);
      print(" callApi fourth(true) time================: ${dashboardController.callApi}");
      print(" callApi fourth(true) time================: ${dashboardController.callApi}");
      print(" callApi fourth(true) time================: ${dashboardController.callApi}");
      dashboardController.callApi=true;
      Fluttertoast.showToast(
        msg: "sms sending fail",
        toastLength: Toast.LENGTH_SHORT,
        gravity: ToastGravity.BOTTOM,
        timeInSecForIosWeb: 3,
        backgroundColor: Colors.black,
        textColor: Colors.white,
        fontSize: 16.0,
      );
    }
  }

  // Future<void> sendSms(String message,String receiverNumber,String requestId)async{
  //
  //   List<String> recipient  = receiverNumber.split(",");

  //
  //   //for debug mode
  //  // ,+8801612525115,+8801533702981
  //   try {
  //     String _result = await sendSMS(
  //       message: message,
  //       recipients: global.mode=="DEV"?getRecipient("$receiverNumber"):recipient,
  //       sendDirect: true,
  //     ).then((value) async {
  //       // print("-------------------SMS Report: $value");
  //       // print("-------------------SMS Report: $value");
  //       // print("-------------------SMS Report: $value");
  //
  //
  //       await DbService().sendOtpConfirmationToServer(requestId);
  //       Fluttertoast.showToast(
  //         msg: "sms send successfully to recipients",
  //         toastLength: Toast.LENGTH_SHORT,
  //         gravity: ToastGravity.BOTTOM,
  //         timeInSecForIosWeb: 3,
  //         backgroundColor: Colors.black,
  //         textColor: Colors.white,
  //         fontSize: 16.0,
  //       );
  //        return value;
  //
  //     });
  //     // print('Try result $_result');
  //     // print('Try result $_result');
  //     // print('Try result $_result');
  //     // print('Try result $_result');
  //     // print('Try result $_result');
  //   } catch (error) {
  //     //await DbService().sendOtpConfirmationToServer(requestId);
  //     Fluttertoast.showToast(
  //       msg: "sms sending fail",
  //       toastLength: Toast.LENGTH_SHORT,
  //       gravity: ToastGravity.BOTTOM,
  //       timeInSecForIosWeb: 3,
  //       backgroundColor: Colors.black,
  //       textColor: Colors.white,
  //       fontSize: 16.0,
  //     );
  //   }
  // }


  /*
  *
  *
  * Checking User Permission using this requestSmsPermission methode
  *
  *
  */


  Future requestSmsPermission(BuildContext context,String text,String receiverNumber,String requestId)async{

    PermissionStatus sendSmsPermissionStatus = await Permission.sms.request();
    /*
    * if permission granted send sendSms function will call with sms text, recipient number and otp reauest id
    */
    if (sendSmsPermissionStatus == PermissionStatus.granted) {
      await sendSms(text,receiverNumber,requestId,context);
    }
    /*
    * if permission denied
    */
    if (sendSmsPermissionStatus == PermissionStatus.denied) {

      ScaffoldMessenger.of(context).showSnackBar(
          const SnackBar(content: Text("This permission is recommended"))
      );
    }
    /*
    * if permission permanentlyDenied
    */
    if (sendSmsPermissionStatus == PermissionStatus.permanentlyDenied) {
      ScaffoldMessenger.of(context).showSnackBar(
          const SnackBar(content: Text("This permission is recommended")));
    }
  }
}