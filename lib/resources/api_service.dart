import 'dart:convert';

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:http/http.dart' as http;
import 'package:otp_provider/globals.dart' as globals;
import 'package:otp_provider/model/response_model/otp_Initiated_model.dart';
import 'package:otp_provider/model/response_model/otp_processing_model.dart';
import 'package:otp_provider/presentation/provider/controller.dart';
import 'package:provider/provider.dart';

class DbService {
  /*.............................comment....................................
         getOtpRequestList is for getting otp requests List from server
  ...............................comment....................................*/

  Future<List<InitiatedData>?> getAllSmsRequestList(BuildContext context) async {

var statusCode;


    try{
      print( "installed from getAllSmsRequestList: ${globals.installedNumber}");
      print( "installed from getAllSmsRequestList: ${globals.installedNumber}");
      print( "installed from getAllSmsRequestList: ${globals.installedNumber}");
      final dashboardController =
      Provider.of<DashboardController>(context, listen: false);
      final response = await http.get(
          Uri(
            scheme: 'https',
            host: 'beta-dtba.btla.net',
            path: '/api/sms/otp/listAll',
              queryParameters: {
                "limit": "100",
                "installed": globals.installedNumber,

              }
          ),
          headers: {
            'Content-type': 'application/json',
            'instance-api-secrete': globals.instanceApiSecrete,
            'instance-name': globals.instanceName,
          });


      statusCode = response.statusCode;
      print("statusCode from getAllSmsRequestList: ${response.statusCode}");
      print("statusCode from getAllSmsRequestList: ${response.statusCode}");
      print("statusCode from getAllSmsRequestList: ${response.statusCode}");



      if (response.statusCode ==200) {
        // print("InitiatedData");



        final json = jsonDecode(response.body);
        print(json);
        OtpInitiatedModel otpInitiatedModel = OtpInitiatedModel.fromJson(json);
        dashboardController.loadOtpRequestList(otpInitiatedModel.data!);
        globals.mode = otpInitiatedModel.mode;
        return otpInitiatedModel.data;

        // ScaffoldMessenger.of(context).showSnackBar(
        //     SnackBar(content: Text("Status code : ${response.statusCode} Request Successful")));


      }
      if(response.statusCode !=200){
         Fluttertoast.showToast(
           msg: "All List - Status Code is: $statusCode",
         //  msg: "Error! Status Code is: 403",
        //   msg: "sms sending fail===",
           toastLength: Toast.LENGTH_SHORT,
           gravity: ToastGravity.CENTER,
           timeInSecForIosWeb: 3,
           backgroundColor: Colors.red[900],
          // backgroundColor: Colors.red[100],
          // backgroundColor: Colors.black,
           textColor: Colors.white,
           fontSize: 16.0,
         );
        ///


      }

    }catch(error){
      print("-------------Error from getOtpInitiatedList: $error");
      print("-------------Error from getOtpInitiatedList: $error");
    }

  //   final dashboardController =
  //       Provider.of<DashboardController>(context, listen: false);
  //
  //   final response = await http.get(
  //       Uri(
  //         scheme: 'https',
  //         host: 'beta-dtba.btla.net',
  //         path: '/api/sms/otp/listAll',
  //         queryParameters: {
  //           "limit": "40",
  //          // "installed": globals.installedNumber,
  //         },
  //       ),
  //       headers: {
  //         'Content-type': 'application/json',
  //         'instance-api-secrete': globals.instanceApiSecrete,
  //         'instance-name': globals.instanceName,
  //       });
  //
  //   print(response.statusCode);
  //   if (response.statusCode == 200) {
  //     // print("InitiatedData");
  //     final json = jsonDecode(response.body);
  //     print(json);
  //     OtpInitiatedModel otpInitiatedModel = OtpInitiatedModel.fromJson(json);
  //     dashboardController.loadOtpRequestList(otpInitiatedModel.data!);
  //     globals.mode = otpInitiatedModel.mode;
  //    return otpInitiatedModel.data;
  //
  //
  //   } else {
  //     throw Exception(
  //         'Failed to load ... status code:${response.statusCode}\n${response.body}');
  //   }


   }

  ///
  Future<List<InitiatedData>?> getOnlyTwoOtpInitiatedList(
      BuildContext context) async {
    var statusCode;
    try{
      print( "installed from getOnlyTwoOtpInitiatedList: ${globals.installedNumber}");
      print( "installed from getOnlyTwoOtpInitiatedList: ${globals.installedNumber}");
      final response = await http.get(
          Uri(
            scheme: 'https',
            host: 'beta-dtba.btla.net',
            path: '/api/sms/otp/list',
              queryParameters: {
                    "limit": "30",
                    "installed": globals.installedNumber,

                  },
          ),
          headers: {
            'Content-type': 'application/json',
            'instance-api-secrete': "${globals.instanceApiSecrete}",
            'instance-name': '${globals.instanceName}',
          });
      statusCode = response.statusCode;
      print("statusCode from getOnlyTwoOtpInitiatedList: ${response.statusCode}");
      print("statusCode from getOnlyTwoOtpInitiatedList: ${response.statusCode}");
      print("statusCode from getOnlyTwoOtpInitiatedList: ${response.statusCode}");


      if (response.statusCode == 200) {
        // print("InitiatedData");
        final json = jsonDecode(response.body);
        print(json);
        OtpInitiatedModel otpInitiatedModel = OtpInitiatedModel.fromJson(json);
        return otpInitiatedModel.data;
      }
      if(response.statusCode !=200){
        Fluttertoast.showToast(
          msg: "Initiated List - Status Code is: $statusCode",
         // msg: "Error! Status Code is: 403",
       //   msg: "sms sending fail===",
          toastLength: Toast.LENGTH_SHORT,
          gravity: ToastGravity.BOTTOM,

          timeInSecForIosWeb: 3,
          backgroundColor: Colors.red[900],
         // backgroundColor: Colors.black,
          textColor: Colors.white,
          fontSize: 16.0,
        );
        ///


      }

    }catch(error){
      print("-------------Error from getOnlyTwoOtpInitiatedList: $error");
      print("-------------Error from getOnlyTwoOtpInitiatedList: $error");

      // throw Exception(
      //           'Failed to load ... status code:${response.statusCode}\n${response.body}');
    }




  //   List<InitiatedData>? storeData;
  //   final response = await http.get(
  //       Uri(
  //         scheme: 'https',
  //         host: 'beta-dtba.btla.net',
  //         path: '/api/sms/otp/list',
  //         queryParameters: {
  //           "limit": "40",
  //       //    "installed": globals.installedNumber,
  //
  //         },
  //       ),
  //       headers: {
  //         'Content-type': 'application/json',
  //         'instance-api-secrete': "${globals.instanceApiSecrete}",
  //         'instance-name': '${globals.instanceName}',
  //       });
  //
  //   if (response.statusCode == 200) {
  //     // print("InitiatedData");
  //     final json = jsonDecode(response.body);
  //     print(json);
  //     OtpInitiatedModel otpInitiatedModel = OtpInitiatedModel.fromJson(json);
  // return otpInitiatedModel.data;
  //
  //
  //
  //
  //     for(int i=0; i<otpInitiatedModel.data!.length;i++){
  //       //
  //       // if (otpInitiatedModel.data![i].sendingNumber == globals.sim1 ||
  //       //     otpInitiatedModel.data![i].sendingNumber == globals.sim2) {
  //       //  storeData =otpInitiatedModel.data;
  //       // }
  //
  //       if (otpInitiatedModel.data![i].sendingNumber == globals.sim1 ||
  //           otpInitiatedModel.data![i].sendingNumber == globals.installedNumber) {
  //         storeData![i] =otpInitiatedModel.data![i];
  //       }
  //
  //
  //     }
  //     if(  storeData!=null){
  //       return   storeData;
  //     }
  //     //
  //     // else{
  //     //   return null;
  //     // }
  //
  //
  //
  //   }
  //   else {
  //
  //     throw Exception(
  //         'Failed to load ... status code:${response.statusCode}\n${response.body}');
  //  }


  }

  /// Earliar method
  // Future<List<InitiatedData>?> getOnlyTwoOtpInitiatedList(
  //     BuildContext context) async {
  //   final response = await http.get(
  //       Uri(
  //         scheme: 'https',
  //         host: 'beta-dtba.btla.net',
  //         path: '/api/sms/otp/list',
  //         queryParameters: {
  //           "limit": "10",
  //           "installed": globals.installedNumber,
  //         },
  //       ),
  //       headers: {
  //         'Content-type': 'application/json',
  //         'instance-api-secrete': "${globals.instanceApiSecrete}",
  //         'instance-name': '${globals.instanceName}',
  //       });
  //
  //   if (response.statusCode == 200) {
  //     // print("InitiatedData");
  //     final json = jsonDecode(response.body);
  //     print(json);
  //     OtpInitiatedModel otpInitiatedModel = OtpInitiatedModel.fromJson(json);
  //
  //
  //       return otpInitiatedModel.data;
  //
  //   } else {
  //     throw Exception(
  //         'Failed to load ... status code:${response.statusCode}\n${response.body}');
  //   }
  // }

  //https://beta-dtba.btla.net/api/sms/otp/unsend
  ///
  /*.............................comment....................................
   getOtpProcessingList is for getting otp processing status List from server
  ...............................comment....................................*/

  Future<List<ProcessingData>?> getOtpProcessingList(
      BuildContext context) async {
    final dashboardController =
        Provider.of<DashboardController>(context, listen: false);
    final response = await http.get(
        Uri(
          scheme: 'https',
          host: 'beta-dtba.btla.net',
          path: '/api/sms/otp/unsend',
          queryParameters: {
            "limit": "10000",
          //  "installed": globals.installedNumber,
          },
        ),
        headers: {
          'Content-type': 'application/json',
          'instance-api-secrete': "${globals.instanceApiSecrete}",
          'instance-name': '${globals.instanceName}',
        });
    //print in console
    print(response.statusCode);
    //print(response.body);
    //print in console
    if (response.statusCode == 200) {
      print("ProcessingData");
      final json = jsonDecode(response.body);
      OtpProcessingModel otpProcessingModel = OtpProcessingModel.fromJson(json);
      //dashboardController.loadOtpProcessingList(otpProcessingList.data!);
      print(otpProcessingModel.data!.length.toString() + "fgdfghdf");
      return otpProcessingModel.data;
      // ScaffoldMessenger.of(context).showSnackBar(
      //     SnackBar(content: Text("Status code : ${response.statusCode} Request Successful")));
    } else {
      throw Exception(
          'Failed to load ... status code:${response.statusCode}\n${response.body}');
    }
  }

  //https://beta-dtba.btla.net/api/sms/otp/unsend
  /*.............................comment....................................
sendOtpConfirmationToServer method is for sending confirmation to server for successful otp sent
  ...............................comment....................................*/

  sendOtpConfirmationToServer(String id) async {
    final response = await http.put(
        Uri(
          scheme: 'https',
          host: 'beta-dtba.btla.net',
          path: '/api/sms/otp/confirm',
          queryParameters: {
            "id": id,
          },
        ),
        headers: {
          'Content-type': 'application/json',
          'instance-api-secrete': "${globals.instanceApiSecrete}",
          'instance-name': '${globals.instanceName}',
        });

    //print status in console
    // print(response.statusCode);
    //

    if (response.statusCode == 201) {
      print("status change");
      final json = jsonDecode(response.body);
    } else {
      throw Exception(
          'Failed to load ... status code:${response.statusCode}\n${response.body}');
    }
  }

  ///   send Notice Sms  To Server

  sendNoticeSmsToServer({String? smsText, String? receivers}) async {
     print('$smsText   -----  ${receivers.toString()}');
    final response = await http.put(
        Uri(
          scheme: 'https',
          host: 'beta-dtba.btla.net',
          path: '/api/sms/otp/sendBulk',
          queryParameters: {
            "device_id": "33343536", // device id
            "device_name": "3322",//device_name
            "device_model": "33",// device_model
            "app_signature_id": "444555", // app_signature_id
            "sms_text": smsText,
            "receivers": receivers,// todo selected button value
            "member_id": "1444",// 0

            "membership_number": "K00223",//0
            "mobile_number": "01735756919",// 0

            "device_os": "Android",// device os
          },
        ),
        headers: {
          // 'Content-type': 'application/json',
          "INSTANCE-NAME": "${globals.instanceName}",
          "INSTANCE-API-SECRETE": "${globals.instanceApiSecrete}",
        });

    //print status in console
    print("Status code:${response.statusCode}");

    if (response.statusCode == 201) {
      print("SMS Successfully Sent");
      print("Response Body: ${response.body}");

      final json = jsonDecode(response.body);
    } else {
      throw Exception(
          'Failed to load ... status code:${response.statusCode}\n${response.body}');
    }
  }

  otpCheck(String appSignatureId, String otp) async {
    final response = await http.put(
        Uri(
          scheme: 'https',
          host: 'beta-dtba.btla.net',
          path: '/api/sms/otp/check',
          queryParameters: {
            "app_signature_id": appSignatureId,
            "otp": otp,
          },
        ),
        headers: {
          'Content-type': 'application/json',
          'instance-api-secrete': "${globals.instanceApiSecrete}",
          'instance-name': '${globals.instanceName}',
        });

    //print status in console
    // print(response.statusCode);
    //

    if (response.statusCode == 201) {
      print("status change");
      final json = jsonDecode(response.body);
    } else {
      throw Exception(
          'Failed to load ... status code:${response.statusCode}\n${response.body}');
    }
  }
}
