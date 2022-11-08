import 'package:flutter/material.dart';
import 'package:otp_provider/globals.dart' as globals;
import 'package:otp_provider/theme/theme.dart';
// import 'package:telephony/telephony.dart';
import '../resources/api_service.dart';

enum SmsReceiversEnum {
  exMember,
  voters,
  allMember,
  defaulter
}

class SendNoticeSms extends StatefulWidget {
  const SendNoticeSms({Key? key}) : super(key: key);

  @override
  State<SendNoticeSms> createState() => _SendNoticeSmsState();
}

class _SendNoticeSmsState extends State<SendNoticeSms> {
 // final Telephony telephony = Telephony.instance;

  final _formKey = GlobalKey<FormState>();
  final TextEditingController _phoneController = TextEditingController();
  final TextEditingController _msgController = TextEditingController();

  SmsReceiversEnum SmsReceivers = SmsReceiversEnum.exMember;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Send Notice SMS '),
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
      body: Padding(
        padding: EdgeInsets.all(8.0),
        child: Form(
          key: _formKey,
          child: SingleChildScrollView(
            child: Column(
              children: [
                Container(
                  margin: EdgeInsets.all(10.0),
                  child: TextFormField(
                    maxLines: 5,
                    maxLength: 150,
                    keyboardType: TextInputType.name,
                    controller: _msgController,
                    style: const TextStyle(
                      fontSize: 16,
                      color: Colors.black,
                      //color: Colors.grey,
                      fontWeight: FontWeight.normal,
                    ),
                    validator: (value) {
                      if (value == null || value.isEmpty) {
                        return 'Enter SMS text';
                      } else {
                        return null;
                      }
                    },
                    decoration: InputDecoration(
                      focusColor: Colors.white,

                      prefixIcon: const Icon(
                        Icons.sms_outlined,
                        size: 35,
                        color: Color(0xFF1B5E20),
                        //color: Colors.grey,
                      ),

                      // errorText: "Error",

                      border: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(10.0),
                      ),

                      focusedBorder: OutlineInputBorder(
                        borderSide: const BorderSide(
                            color: Color(0xFF1B5E20), width: 1.0),
                        borderRadius: BorderRadius.circular(10.0),
                      ),
                      fillColor: Colors.yellowAccent,

                      // hintText: " Enter SMS",
                      //
                      // hintStyle: const TextStyle(
                      //
                      //   color: Colors.grey,
                      //   fontSize: 16,
                      //   fontFamily: "verdana_regular",
                      //   fontWeight: FontWeight.w400,
                      // ),

                      labelText: 'Enter SMS',

                      labelStyle: const TextStyle(
                        color: Colors.grey,
                        fontSize: 16,
                        fontFamily: "verdana_regular",
                        fontWeight: FontWeight.w400,
                      ),
                    ),
                  ),
                ),
                Divider(
                  height: 20.0,
                ),
                RadioListTile<SmsReceiversEnum?>(
                  value: SmsReceiversEnum.exMember,
                  groupValue: SmsReceivers,
                  title: Text("Executive Members"),
                  onChanged: (SmsReceiversEnum? value) {
                    setState(() {
                      SmsReceivers = value!;
                    });
                  },
                  activeColor: Color(0xFF1B5E20),
                ),
                Divider(
                  height: 20.0,
                ),
                RadioListTile<SmsReceiversEnum>(
                  value: SmsReceiversEnum.voters,
                  groupValue: SmsReceivers,
                  title: Text(SmsReceiversEnum.voters.name),
                  onChanged: (SmsReceiversEnum? value) {
                    setState(() {
                      SmsReceivers = value!;
                    });
                  },
                  activeColor: Color(0xFF1B5E20),
                ),

                Divider(
                  height: 20.0,
                ),
                RadioListTile<SmsReceiversEnum>(
                  value: SmsReceiversEnum.allMember,
                  groupValue: SmsReceivers,
                  title: Text("All Members"),
                  onChanged: (SmsReceiversEnum? value) {
                    setState(() {
                      SmsReceivers = value!;
                    });
                  },
                  activeColor: Color(0xFF1B5E20),
                ),
                Divider(
                  height: 20.0,
                ),

                RadioListTile<SmsReceiversEnum>(
                  value: SmsReceiversEnum.defaulter,
                  groupValue: SmsReceivers,
                  title: Text("Defaulter"),
                  onChanged: (SmsReceiversEnum? value) {
                    setState(() {
                      SmsReceivers = value!;
                    });
                  },
                  activeColor: Color(0xFF1B5E20),
                ),
                Divider(
                  height: 20.0,
                ),
                ElevatedButton(
                  child: Text(
                    'Send SMS',
                  ),
                  style: ElevatedButton.styleFrom(
                    primary: theme.primaryColor,
                    textStyle: const TextStyle(
                        color: Colors.white,
                        fontSize: 16,
                        fontStyle: FontStyle.normal),
                  ),
                  onPressed: () {
                    if (_formKey.currentState!.validate()) {
                      /// Sending Notice SMS
                      DbService().sendNoticeSmsToServer(
                        smsText: _msgController.text.toString(),
                        receivers: SmsReceivers.name.toString(),
                      );

                      // print(
                      //   '${_msgController.text.toString()}   -----  ${SmsRecevers!.name.toString()}',
                      // );
                      // _sendSMS();
                      //   smsService.sendSms(message, receiverNumber, '101');

                      Future.delayed(const Duration(seconds: 2), () {
                        final snackBar = SnackBar(
                          content: const Text('SMS Successfully Sent'),
                          backgroundColor: (Colors.blueGrey),
                          action: SnackBarAction(
                            label: 'dismiss',
                            onPressed: () {},
                          ),
                        );
                        ScaffoldMessenger.of(context).showSnackBar(snackBar);
                        Navigator.pop(context);
                      });
                    }
                  },
                ),

                // ElevatedButton(onPressed: () => _getSMS(), child: const Text('Read SMS')),
              ],
            ),
          ),
        ),
      ),
    );
  }

  // _sendSMS() async {
  //   telephony.sendSms(to: _phoneController.text, message: _msgController.text);
  //
  //   // int _sms = 0;
  //   // while (_sms < int.parse(_valueSms.text)) {
  //   //   telephony.sendSms(to: _phoneController.text, message: _msgController.text);
  //   //   _sms ++;
  // }
}

// _getSMS() async {
//   List<SmsMessage> _messages = await telephony.getInboxSms(
//       columns: [SmsColumn.ADDRESS, SmsColumn.BODY],
//       filter: SmsFilter.where(SmsColumn.ADDRESS).equals(_phoneController.text)
//   );
//
//   for(var msg in _messages) {
//     print(msg.body);
//   }
// }
