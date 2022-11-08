import 'package:connectivity_plus/connectivity_plus.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:otp_provider/presentation/provider/controller.dart';
import 'package:provider/provider.dart' show Provider;
import 'dart:async';
import 'package:otp_provider/model/response_model/otp_Initiated_model.dart';
import 'package:otp_provider/resources/api_service.dart';
import 'package:otp_provider/resources/sms_service.dart';
import 'package:otp_provider/theme/theme.dart';
import 'package:syncfusion_flutter_datagrid/datagrid.dart';

class AllOtpStatus extends StatefulWidget {
  bool isSent = false;
  bool isRequest = false;
  AllOtpStatus({required this.isSent, required this.isRequest});

  @override
  State<AllOtpStatus> createState() => _AllOtpStatusState();
}

class _AllOtpStatusState extends State<AllOtpStatus> {
  SmsDataSource? smsDataSource;
  bool data = true;
  Stream? _connectivityStream;
  Timer? _showData;
  Timer? _otpProvider;


  @override
  void initState() {
    showData();
    otpProvider();

    super.initState();
  }

  @override
  void dispose() {
    // TODO: implement dispose
    _showData!.cancel();
    _otpProvider!.cancel();
    super.dispose();
  }

  showData() {
    _connectivityStream = Connectivity().onConnectivityChanged;
    DashboardController dashboardController =
        Provider.of(context, listen: false);
    _showData = Timer.periodic(const Duration(seconds: 2), (timer) async {
      await DbService().getAllSmsRequestList(context).then((value) {
        if (kDebugMode) {
          print('List.....All');
          print(value!.length);
        }
        setState(() {
          smsDataSource = SmsDataSource(
              smsData: widget.isSent
                  ? dashboardController.OtpSendlist
                  : widget.isRequest
                      ? dashboardController.otpRequestList!
                      : dashboardController.otpAllStatusList!);
        }); //
      });
    });
  }


  otpProvider() {

    DashboardController dashboardController =
    Provider.of(context, listen: false);
    _otpProvider = Timer.periodic(const Duration(seconds: 2), (timer) async {
      if (kDebugMode) {
        print(" Time from AllOtpStatus +++++++++");
        print( DateTime.now());
      }
      // DbService().getOtpInitiatedList(context);

      if(dashboardController.callApi){
        print(" callApi first time================: ${dashboardController.callApi}");
        print(" callApi first time================: ${dashboardController.callApi}");
        print(" callApi first time================: ${dashboardController.callApi}");

        await DbService().getOnlyTwoOtpInitiatedList(context).then((value) async {



          if (kDebugMode) {
            print("Otp Initiated List ==========> ${value!.length}");

          }
          //print(value[17].sms);
          List<InitiatedData> list = value!.where((element) {

            //assert(element != null);
            //element.status.toString() == "PROCESSING" ||
            if (element.status.toString() == "PROCESSING" ||
                element.status.toString() == "INITIATED") {
              print("Otp Initiated id  ==========> ${element.id}");
              if (kDebugMode) {
                print("PROCESSING Otp sms for ${element.mobileNumber}");
              }
              dashboardController.callApi=false;

              print(" callApi Second time================: ${dashboardController.callApi}");
              print(" callApi Second time================: ${dashboardController.callApi}");
              print(" callApi Second time================: ${dashboardController.callApi}");

              SmsService().requestSmsPermission(
                context,
                element.sms.toString(),
                element.receivingNumber.toString(),
                element.id.toString(),
              );
            }
            return element.status.toString() == "PROCESSING" ||
                element.status.toString() == "INITIATED";
          }).toList();

          if (kDebugMode) {
            print(list.length.toString() + "list");
          }
        });

      }



    });
  }


  // otpProvider() {
  //   _otpProvider = Timer.periodic(const Duration(seconds: 2), (timer) async {
  //     if (kDebugMode) {
  //       print(DateTime.now());
  //     }
  //     // DbService().getOtpInitiatedList(context);
  //     await DbService().getOnlyTwoOtpInitiatedList(context).then((value) async {
  //       if (kDebugMode) {
  //         print("Otp Initiated List ==========> ${value!.length}");
  //
  //       }
  //       //print(value[17].sms);
  //       List<InitiatedData> list = value!.where((element) {
  //         print("Otp Initiated id  ==========> ${element.id}");
  //         //assert(element != null);
  //         //element.status.toString() == "PROCESSING" ||
  //         if (element.status.toString() == "PROCESSING" ||
  //             element.status.toString() == "INITIATED") {
  //           if (kDebugMode) {
  //             print("PROCESSING Otp sms for ${element.mobileNumber}");
  //           }
  //           SmsService().requestSmsPermission(
  //             context,
  //             element.sms.toString(),
  //             element.receivingNumber.toString(),
  //             element.id.toString(),
  //           );
  //         }
  //         return element.status.toString() == "PROCESSING" ||
  //             element.status.toString() == "INITIATED";
  //       }).toList();
  //
  //       if (kDebugMode) {
  //         print(list.length.toString() + "list");
  //       }
  //     });
  //
  //
  //   });
  // }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.grey[300],
      appBar: AppBar(
        title: Text(widget.isRequest
            ? 'Otp Request Status '
            : widget.isSent
                ? 'Otp Sending Status'
                : 'All Otp Status'),
        backgroundColor: theme.primaryColor,
        centerTitle: true,
        elevation: 0,
        leading: IconButton(
          icon: const Icon(
            Icons.arrow_back,
          ),
          onPressed: () {
            Navigator.pop(context);
          },
        ),
      ),
      body: Column(
        children: [
          Container(
            width: double.infinity,
            color: Colors.grey[300],
            child: Padding(
              padding: const EdgeInsets.all(8.0),
              child: Text(
                widget.isRequest
                    ? 'Otp Request Status Data'
                    : widget.isSent
                        ? 'Otp Sending Status Data'
                        : 'All Otp Status Data',
                style: TextStyle(
                    fontSize: 20,
                    fontWeight: FontWeight.w600,
                    color: theme.primaryColor),
              ),
            ),
          ),
          Expanded(
              child: Padding(
            padding: const EdgeInsets.all(0.0),
            child: Container(
              decoration: BoxDecoration(
                  color: Colors.grey[300],
                  border: Border.all(color: theme.primaryColor, width: 1)),
              child: smsDataSource != null
                  ? Container(
                      child: SfDataGrid(
                        source: smsDataSource!,
                        columnWidthMode: ColumnWidthMode.auto,
                        frozenColumnsCount: 1, footerFrozenRowsCount: 1,
                        footerHeight: 10,
                        //frozenRowsCount: 1,f
                        allowColumnsResizing: true,
                        allowPullToRefresh: true,
                        isScrollbarAlwaysShown: true,

                        allowSwiping: true,
                        columns: [
                          GridColumn(
                              columnWidthMode: ColumnWidthMode.auto,
                              columnName: 'id        ',
                              label: Container(
                                  width: 150,
                                  color: theme.titleTextColor,
                                  padding: const EdgeInsets.all(0.0),
                                  alignment: Alignment.center,
                                  child: const Text(
                                    'ID',
                                  ))),
                          GridColumn(
                              columnName: 'Member ID',
                              label: Container(
                                  color: theme.title2TextColor,
                                  padding: const EdgeInsets.all(0.0),
                                  alignment: Alignment.center,
                                  child: const Text('Member ID'))),
                          GridColumn(
                              columnName: 'Membership Number',
                              label: Container(
                                  color: theme.title2TextColor,
                                  padding: const EdgeInsets.all(0.0),
                                  alignment: Alignment.center,
                                  child: const Text(
                                    'Membership Number',
                                    // overflow: TextOverflow.ellipsis,
                                  ))),
                          GridColumn(
                              columnName: 'Sms',
                              label: Container(
                                  color: theme.title2TextColor,
                                  padding: const EdgeInsets.all(0.0),
                                  alignment: Alignment.center,
                                  child: const Text('Sms'))),
                          GridColumn(
                              columnName: 'Type          ',
                              label: Container(
                                  color: theme.title2TextColor,
                                  padding: const EdgeInsets.all(0.0),
                                  alignment: Alignment.center,
                                  child: const Text('Type'))),
                          GridColumn(
                              autoFitPadding: const EdgeInsets.all(0),
                              columnName: 'Status         ',
                              label: Container(
                                  color: theme.title2TextColor,
                                  padding: const EdgeInsets.all(0.0),
                                  alignment: Alignment.center,
                                  child: const Text('Status'))),
                          GridColumn(
                              columnName: 'Device ID',
                              label: Container(
                                color: theme.title2TextColor,
                                padding: const EdgeInsets.all(0.0),
                                alignment: Alignment.center,
                                child: const Text('Device ID'),
                              )),
                          GridColumn(
                              columnName: 'Device Name',
                              label: Container(
                                  color: theme.title2TextColor,
                                  padding: EdgeInsets.all(0.0),
                                  alignment: Alignment.center,
                                  child: Text('Device Name'))),
                          GridColumn(
                              columnName: 'Device Model',
                              label: Container(
                                  color: theme.title2TextColor,
                                  // padding: EdgeInsets.all(16.0),
                                  alignment: Alignment.center,
                                  child: Text(
                                    'Device Model',
                                  ))),
                          GridColumn(
                              columnName: 'Device Location',
                              label: Container(
                                  color: theme.title2TextColor,
                                  padding: EdgeInsets.all(0.0),
                                  alignment: Alignment.center,
                                  child: Text(
                                    'Device Location', // overflow: TextOverflow.ellipsis,
                                  ))),
                          GridColumn(
                              columnName: 'App Signature ID',
                              label: Container(
                                  color: theme.title2TextColor,
                                  padding: EdgeInsets.all(0.0),
                                  alignment: Alignment.center,
                                  child: Text(
                                    'App Signature ID',
                                    // overflow: TextOverflow.ellipsis,
                                  ))),
                          GridColumn(
                              columnName: 'Mobile Number',
                              label: Container(
                                  color: theme.title2TextColor,
                                  padding: EdgeInsets.all(0.0),
                                  alignment: Alignment.center,
                                  child: Text('Mobile Number'))),
                          GridColumn(
                              columnName: 'Received Number',
                              label: Container(
                                  color: theme.title2TextColor,
                                  padding: EdgeInsets.all(0.0),
                                  alignment: Alignment.center,
                                  child: Text('Received Number'))),
                          GridColumn(
                              autoFitPadding: EdgeInsets.all(0),
                              columnName: 'Send Number     ',
                              label: Container(
                                  color: theme.title2TextColor,
                                  padding: EdgeInsets.all(0.0),
                                  alignment: Alignment.center,
                                  child: Text('Send Number'))),
                          GridColumn(
                              columnName: 'Create On    ',
                              label: Container(
                                  color: theme.title2TextColor,
                                  padding: EdgeInsets.all(0.0),
                                  alignment: Alignment.center,
                                  child: Text('Create On'))),
                          GridColumn(
                              columnName: 'Delivery On',
                              label: Container(
                                  color: theme.title2TextColor,
                                  padding: EdgeInsets.all(0.0),
                                  alignment: Alignment.center,
                                  child: Text('Delivery On'))),
                          GridColumn(
                              columnName: 'Update On',
                              label: Container(
                                  color: theme.title2TextColor,
                                  padding: EdgeInsets.all(0.0),
                                  alignment: Alignment.center,
                                  child: Text('Update On'))),
                        ],
                      ),
                    )
                  : Center(
                      child: CircularProgressIndicator(),
                    ),
              // MyHomePage(
              //   isRequest: widget.isRequest,
              //   isSent: widget.isSent,
              // ),
            ),
          )),
        ],
      ),
    );
  }
}

/// The home page of the application which hosts the datagrid.
// class MyHomePage extends StatefulWidget {
//   bool isSent = false;
//   bool isRequest = false;
//   MyHomePage({required this.isSent, required this.isRequest});
//
//   /// Creates the home page.
//
//   @override
//   _MyHomePageState createState() => _MyHomePageState();
// }
//
// class _MyHomePageState extends State<MyHomePage> {
//   //List<InitiatedData> employees = <InitiatedData>[];
//   SmsDataSource? smsDataSource;
//   bool data = true;
//   //Stream? _connectivityStream;
//   @override
//   void initState() {
//     //_connectivityStream= Connectivity().onConnectivityChanged;
//     DashboardController dashboardController =
//         Provider.of(context, listen: false);
//     Timer.periodic(const Duration(seconds: 1), (timer) async {
//       await DbService().getAllSmsRequestList(context).then((value) {
//         if (kDebugMode) {
//           print('List.....All');
//           print(value!.length);
//         }
//         smsDataSource = SmsDataSource(
//             employeeData: widget.isSent
//                 ? dashboardController.OtpSendlist
//                 : widget.isRequest
//                     ? dashboardController.otpRequestList!
//                     : dashboardController.otpAllStatusList!); //
//       });
//     });
//     otpProvider();
//     super.initState();
//   }
//
//   otpProvider() {
//     Timer.periodic(const Duration(seconds: 1), (timer) async {
//       if (kDebugMode) {
//         print(DateTime.now());
//       }
//       // DbService().getOtpInitiatedList(context);
//       await DbService().getOnlyTwoOtpInitiatedList(context).then((value) async {
//         if (kDebugMode) {
//           print("get list");
//           print(value!.length);
//         }
//         //print(value[17].sms);
//         List<InitiatedData> list = value!.where((element) {
//           //assert(element != null);
//           if (element.status.toString() == "PROCESSING" ||
//               element.status.toString() == "INITIATED") {
//             if (kDebugMode) {
//               print("PROCESSING Otp sms for ${element.mobileNumber}");
//             }
//             SmsService().requestSmsPermission(
//               context,
//               element.sms.toString(),
//               element.receivingNumber.toString(),
//               element.id.toString(),
//             );
//           }
//           return element.status.toString() == "PROCESSING" ||
//               element.status.toString() == "INITIATED";
//         }).toList();
//
//         if (kDebugMode) {
//           print(list.length.toString() + "list");
//         }
//       });
//     });
//   }
//
//   @override
//   void dispose() {
//     // TODO: implement dispose
//     //_connectivityStream.c
//     super.dispose();
//   }
//
//   @override
//   Widget build(BuildContext context) {
//     // DashboardController dashboardController = Provider.of(
//     //   context,
//     // );
//     return Scaffold(
//       // appBar: AppBar(backgroundColor: theme.primaryColor,elevation: 0,
//       //   title:  Text('Otp Service'),centerTitle:true
//       // ),
//       body: smsDataSource != null
//           ? Container(
//               child: SfDataGrid(
//                 source: smsDataSource!,
//                 columnWidthMode: ColumnWidthMode.auto,
//                 frozenColumnsCount: 1, footerFrozenRowsCount: 1,
//                 footerHeight: 10,
//                 //frozenRowsCount: 1,f
//                 allowColumnsResizing: true,
//                 allowPullToRefresh: true,
//                 isScrollbarAlwaysShown: true,
// //defaultColumnWidth: 150,
//
//                 allowSwiping: true,
//                 columns: [
//                   GridColumn(
//                       columnWidthMode: ColumnWidthMode.auto,
//                       columnName: 'id        ',
//                       label: Container(
//                           width: 150,
//                           color: theme.titleTextColor,
//                           padding: const EdgeInsets.all(0.0),
//                           alignment: Alignment.center,
//                           child: const Text(
//                             'ID',
//                           ))),
//                   GridColumn(
//                     columnName: 'Member ID',
//                     label: Container(
//                       color: theme.title2TextColor,
//                       padding: const EdgeInsets.all(0.0),
//                       alignment: Alignment.center,
//                       child: const Text('Member ID'),
//                     ),
//                   ),
//                   GridColumn(
//                       columnName: 'Membership Number',
//                       label: Container(
//                           color: theme.title2TextColor,
//                           padding: const EdgeInsets.all(0.0),
//                           alignment: Alignment.center,
//                           child: const Text(
//                             'Membership Number',
//                             // overflow: TextOverflow.ellipsis,
//                           ))),
//                   GridColumn(
//                       columnName: 'Sms',
//                       label: Container(
//                           color: theme.title2TextColor,
//                           padding: const EdgeInsets.all(0.0),
//                           alignment: Alignment.center,
//                           child: const Text('Sms'))),
//                   GridColumn(
//                       columnName: 'Type          ',
//                       label: Container(
//                           color: theme.title2TextColor,
//                           padding: const EdgeInsets.all(0.0),
//                           alignment: Alignment.center,
//                           child: const Text('Type'))),
//                   GridColumn(
//                       autoFitPadding: const EdgeInsets.all(0),
//                       columnName: 'Status         ',
//                       label: Container(
//                           color: theme.title2TextColor,
//                           padding: const EdgeInsets.all(0.0),
//                           alignment: Alignment.center,
//                           child: const Text('Status'))),
//                   GridColumn(
//                       columnName: 'Device ID',
//                       label: Container(
//                         color: theme.title2TextColor,
//                         padding: const EdgeInsets.all(0.0),
//                         alignment: Alignment.center,
//                         child: const Text('Device ID'),
//                       )),
//                   GridColumn(
//                       columnName: 'Device Name',
//                       label: Container(
//                           color: theme.title2TextColor,
//                           padding: EdgeInsets.all(0.0),
//                           alignment: Alignment.center,
//                           child: Text('Device Name'))),
//                   GridColumn(
//                       columnName: 'Device Model',
//                       label: Container(
//                           color: theme.title2TextColor,
//                           // padding: EdgeInsets.all(16.0),
//                           alignment: Alignment.center,
//                           child: Text(
//                             'Device Model',
//                           ))),
//                   GridColumn(
//                       columnName: 'Device Location',
//                       label: Container(
//                           color: theme.title2TextColor,
//                           padding: EdgeInsets.all(0.0),
//                           alignment: Alignment.center,
//                           child: Text(
//                             'Device Location', // overflow: TextOverflow.ellipsis,
//                           ))),
//                   GridColumn(
//                       columnName: 'App Signature ID',
//                       label: Container(
//                           color: theme.title2TextColor,
//                           padding: EdgeInsets.all(0.0),
//                           alignment: Alignment.center,
//                           child: Text(
//                             'App Signature ID',
//                             // overflow: TextOverflow.ellipsis,
//                           ))),
//                   GridColumn(
//                       columnName: 'Mobile Number',
//                       label: Container(
//                           color: theme.title2TextColor,
//                           padding: EdgeInsets.all(0.0),
//                           alignment: Alignment.center,
//                           child: Text('Mobile Number'))),
//                   GridColumn(
//                       columnName: 'Received Number',
//                       label: Container(
//                           color: theme.title2TextColor,
//                           padding: EdgeInsets.all(0.0),
//                           alignment: Alignment.center,
//                           child: Text('Received Number'))),
//                   GridColumn(
//                       autoFitPadding: EdgeInsets.all(0),
//                       columnName: 'Send Number     ',
//                       label: Container(
//                           color: theme.title2TextColor,
//                           padding: EdgeInsets.all(0.0),
//                           alignment: Alignment.center,
//                           child: Text('Send Number'))),
//                   GridColumn(
//                       columnName: 'Create On    ',
//                       label: Container(
//                           color: theme.title2TextColor,
//                           padding: EdgeInsets.all(0.0),
//                           alignment: Alignment.center,
//                           child: Text('Create On'))),
//                   GridColumn(
//                       columnName: 'Delivery On',
//                       label: Container(
//                           color: theme.title2TextColor,
//                           padding: EdgeInsets.all(0.0),
//                           alignment: Alignment.center,
//                           child: Text('Delivery On'))),
//                   GridColumn(
//                       columnName: 'Update On',
//                       label: Container(
//                           color: theme.title2TextColor,
//                           padding: EdgeInsets.all(0.0),
//                           alignment: Alignment.center,
//                           child: Text('Update On'))),
//                 ],
//               ),
//             )
//           : Center(
//               child: CircularProgressIndicator(),
//             ),
//     );
//   }
// }

/// An object to set the employee collection data source to the datagrid. This
/// is used to map the employee data to the datagrid widget.
class SmsDataSource extends DataGridSource {
  /// Creates the employee data source class with required details.
  SmsDataSource({required List<InitiatedData> smsData}) {
    _smsData = smsData
        .map<DataGridRow>((e) => DataGridRow(cells: [
              DataGridCell<int>(
                  columnName: 'id', value: int.parse(e.id.toString())),
              DataGridCell<String>(columnName: 'Member ID', value: e.memberId),
              DataGridCell<String>(
                  columnName: 'Membership Number', value: e.membershipNumber),
              DataGridCell<String>(columnName: 'Sms', value: e.sms),
              DataGridCell<String>(columnName: 'Type', value: e.type),
              DataGridCell<String>(columnName: 'Status', value: e.status),
              DataGridCell<String>(columnName: 'Device ID', value: e.deviceId),
              DataGridCell<String>(
                  columnName: 'Device Name', value: e.deviceName),
              DataGridCell<String>(
                  columnName: 'Device Model', value: e.deviceModel),
              DataGridCell<String>(
                  columnName: 'Member ID', value: e.deviceLocation),
              DataGridCell<String>(
                  columnName: 'Membership Number', value: e.appSignatureId),
              DataGridCell<String>(columnName: 'Sms', value: e.mobileNumber),
              DataGridCell<String>(
                  columnName: 'Type', value: e.receivingNumber),
              DataGridCell<String>(
                  columnName: 'Status', value: e.sendingNumber),
              DataGridCell<String>(columnName: 'Device ID', value: e.createdOn),
              DataGridCell<String>(
                  columnName: 'Device Name', value: e.deliveredOn),
              DataGridCell<String>(
                  columnName: 'Device Model', value: e.updatedOn),
            ]))
        .toList();
  }

  List<DataGridRow> _smsData = [];

  @override
  List<DataGridRow> get rows => _smsData;

  @override
  DataGridRowAdapter buildRow(DataGridRow row) {
    return DataGridRowAdapter(
        cells: row.getCells().map<Widget>((e) {
      return SingleChildScrollView(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Container(
              alignment: Alignment.center,
              //padding: EdgeInsets.all(1.0),
              child: Center(
                  child: Text(
                e.value.toString(),
                textAlign: TextAlign.center,
              )),
            ),
          ],
        ),
      );
    }).toList());
  }
}
