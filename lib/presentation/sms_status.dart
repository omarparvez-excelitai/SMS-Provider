// import 'package:flutter/material.dart';
// import 'package:sms_advanced/sms_advanced.dart';
//
// onBackgroundMessage(SmsMessage message) {
//   debugPrint("onBackgroundMessage called");
// }
// class SmsAdvanced extends StatefulWidget {
//   const SmsAdvanced({Key? key}) : super(key: key);
//
//   @override
//   State<SmsAdvanced> createState() => _SmsAdvancedState();
// }
//
// class _SmsAdvancedState extends State<SmsAdvanced> {
//   String? status=" ";
//
//   // String? address ="01766609988";
//   String? address ="01735756919";
//   String? body= 'Hello Sms_Advanced';
//
//   // final SmsQuery query = SmsQuery();
//   // List<SmsThread> threads = [];
//   //
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
//   ///
//   // SimCardsProvider provider = new SimCardsProvider();
//   // List<SimCard> card = await provider.getSimCards();
//   //
//
//   ///
//   ///  //
//   //     // sender.onSmsDelivered.listen(( message){
//   //     //   print('${message!.address} received your message.');
//   //     // });
//   //
//   //
//   //     //
//   //     // print("Sim slot is ========= ${card[1]}");
//   //     // print("Sim slot is ========= ${card[1]}");
//   //     // print("Sim slot is ========= ${card[1]}");
//   //     // print("Sim slot is ========= ${card[1]}");
//   //
//   //
//   //
//   //   //  sender.sendSms(message,simCard:card[1] );
//
//   // sendSms(){
//   //
//   //   SmsSender sender = new SmsSender();
//   //   String address = "01610157886";
//   //
//   //   sender.sendSms(new SmsMessage(address, 'Hello flutter world!'));
//   // }
//   ///
//   sendSms()async{
//
//     SmsSender sender =  SmsSender();
//
//     SmsMessage message = SmsMessage(address,body);
//     message.onStateChanged.listen((state) {
//       if (state == SmsMessageState.Fail) {
//         setState((){
//           status=state.name;
//
//         });
//
//
//         print(state.name);
//
//       } else if (state == SmsMessageState.Sent) {
//         setState((){
//           status=state.name;
//
//         });
//
//         print(state.name);
//
//       }
//       else if (state == SmsMessageState.Delivered) {
//         setState((){
//           status=state.name;
//
//         });
//
//         print(state.name);
//
//       }
//       else{
//         print(state.name);
//
//       }
//     });
//
//     //  SmsMessage message = SmsMessage(address,body);
//
//     sender.sendSms(message);
//   }
//
//
//   @override
//   Widget build(BuildContext context) {
//     return Scaffold(
//         appBar: AppBar(
//           title: const Text("sms_advanced Package"),
//         ),
//         body: Center(
//           child: Column(
//             children: [
//               ElevatedButton(
//                 onPressed: (){
//                   sendSms();
//                 },
//                 child: const Text("sendSms"),
//               ),
//               const SizedBox(height: 20,),
//
//
//               Text("Address : $address"),
//               const SizedBox(height: 20,),
//               Text("SMS Text: $body"),
//               const SizedBox(height: 20,),
//               Text("SMS Status is: $status"),
//             ],
//           ),
//         )
//     );
//   }
// }
//
