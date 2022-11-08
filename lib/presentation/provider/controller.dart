import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:otp_provider/model/response_model/otp_Initiated_model.dart';
import 'package:otp_provider/model/response_model/otp_processing_model.dart';
import 'package:otp_provider/model/request_model/user_model.dart';
import 'package:intl/intl.dart';

class DashboardController extends ChangeNotifier {
  List<OtpProvidermodel> Otprequestlist = [];
  List<InitiatedData>? otpAllStatusList=[];
  List<InitiatedData>? otpRequestList=[];
  List<ProcessingData>? otpProcessingList;
  List<InitiatedData> OtpSendlist = [];
  late String timeString;
  //  ScrollController scrollController = ScrollController();
  late var date;
  ScrollController scrollController = ScrollController();
  ScrollController scrollController2 = ScrollController();
  String _installed = "";
  String get installed => _installed;
  bool callApi=true;
//  bool get  callApi =>_callApi;
installedNumber(String installedNum){

  _installed = installedNum;

  notifyListeners();
}
 

  scrollToMaxExtent() {
    WidgetsBinding.instance.addPostFrameCallback((_) {
      scrollController.animateTo(
        scrollController.position.maxScrollExtent,
        duration: const Duration(milliseconds: 100),
        curve: Curves.easeIn,
      );
    });
    notifyListeners();
  }
// This is what you're looking for!

  scrollDown() {
    if (kDebugMode) {
      print('FFFFFFFFFF');
    }
    scrollController2.animateTo(
      scrollController2.position.maxScrollExtent,
      duration: Duration(microseconds: 300),
      curve: Curves.easeOut,
    );
    notifyListeners();
  }

  loadOtpRequestList(List<InitiatedData> otpRequestDataList) async {
    //final otpRequestDataList = await DbService().getOtpRequestList(context);
    otpAllStatusList = otpRequestDataList;
     OtpSendlist= otpAllStatusList!.where((element) => element.status=="SENT").toList();
      otpRequestList=otpAllStatusList!.where((element) => element.status=="INITIATED").toList();
    notifyListeners();
  }

  loadOtpProcessingList(List<ProcessingData> otpRequestDataList) async {
    //final otpRequestDataList = await DbService().getOtpRequestList(context);
    otpProcessingList = otpRequestDataList;
    //otpSendList=otpRequestList!.where((element) => element.status=="INITIATED").toList();
    notifyListeners();
  }

  otpRequest() {
    timeString = DateFormat('hh:mm:ss ').format(DateTime.now());
    date = DateFormat('dd/MMM/yyy').format(DateTime.now());
    OtpProvidermodel otpProvidermodel = OtpProvidermodel(
        serial: 1, menberID: 121, otpStatus: true, otpTime: timeString);
    Otprequestlist.add(otpProvidermodel);
    notifyListeners();
  }

//   otpSending() {
//     timeString = DateFormat('hh:mm:ss ').format(DateTime.now());
//     date = DateFormat('dd/MMM/yyy').format(DateTime.now());
//     OtpProvidermodel otpProvidermodel =
//         OtpProvidermodel(menberID: 321, otpStatus: true, otpTime: timeString);
//     OtpSendlist.add(otpProvidermodel);
//     notifyListeners();
//   }
 }
