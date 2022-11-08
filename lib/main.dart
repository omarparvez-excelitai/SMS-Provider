import 'package:flutter/material.dart';
import 'my_app.dart';


void main() {
  runApp(const MyApp());
}



///


// import 'package:flutter/material.dart';
//
// import 'package:sms_advanced/sms_advanced.dart';
//
// void main() {
//   runApp(const MyApp());
// }
//
// class MyApp extends StatefulWidget {
//   const MyApp({Key? key}) : super(key: key);
//
//   @override
//   State<MyApp> createState() => _MyAppState();
// }
//
// class _MyAppState extends State<MyApp> {
//   // final SmsQuery query = SmsQuery();
//   // List<SmsThread> threads = [];
//   //
//   // @override
//   // void initState() {
//   //   super.initState();
//   //   query.getAllThreads.then((value) {
//   //     threads = value;
//   //     setState(() {});
//   //   });
//   // }
//
//   // sendSms(){
//   //
//   //   SmsSender sender = new SmsSender();
//   //   String address = "01610157886";
//   //
//   //   sender.sendSms(new SmsMessage(address, 'Hello flutter world!'));
//   // }
//
//   sendSms(){
//
//     SmsSender sender =  SmsSender();
//     // String? address ="01797648000";
//     String? address ="01735756919";
//     String? body= 'Excel ';
//     //
//     // SimCardsProvider provider = new SimCardsProvider();
//     // List<SimCard> card = await provider.getSimCards();
//
//
//     SmsMessage message = SmsMessage(address,body);
//
//     // message.onStateChanged.listen((state) {
//     //   if (state == SmsMessageState.Delivered) {
//     //
//     //     print(state.name);
//     //
//     //   } else if (state == SmsMessageState.Fail) {
//     //
//     //     print(state.name);
//     //
//     //   }
//     // });
//
//     //
//     // sender.onSmsDelivered.listen(( message){
//     //   print('${message!.address} received your message.');
//     // });
//
//
//     //
//     // print("Sim slot is ========= ${card[1]}");
//     // print("Sim slot is ========= ${card[1]}");
//     // print("Sim slot is ========= ${card[1]}");
//     // print("Sim slot is ========= ${card[1]}");
//
//
//
//     //sender.sendSms(message,simCard:card[1] );
//
//    sender.sendSms(message);
//   }
//
//
//
//   @override
//   Widget build(BuildContext context) {
//     return MaterialApp(
//         theme: ThemeData(
//           primarySwatch: Colors.blue,
//         ),
//         home: Scaffold(
//             appBar: AppBar(
//               title: const Text("sms_advanced2"),
//             ),
//             body: Center(
//               child: ElevatedButton(
//                 onPressed: (){
//                   sendSms();
//                 },
//                 child: Text("sendSms"),
//               ),
//             )
//         ));
//   }
// }
