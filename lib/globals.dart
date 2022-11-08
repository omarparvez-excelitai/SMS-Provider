
library otp_provider.globals;

import 'package:shared_preferences/shared_preferences.dart';


String instanceName = "Excel-IT-AI824298";
String? installedNumber = " ";
//String installedNumber = '01797648000';
String? automaticallySim1 = "";
//String sim1 = '01797648000';
String? automaticallySim2 = "";
String? manuallySim1 = " ";
String? sim1 = " ";
String? manuallySim2  = " ";
//String sim2 = '01735756919';

String instanceApiSecrete = "0w08sgk4wo040ws4ssg0ow8408c4cs08o44w0w08";
String? mode;



getManualNumFromPrefs() async {
  SharedPreferences prefs = await SharedPreferences.getInstance();


 installedNumber = prefs.getString('installedNumber').toString();
//  globals.installedNumber = prefs.getString('installedNumber').toString();


  manuallySim1 = prefs.getString('manuallySim1').toString();
 // globals.manuallySim1 = prefs.getString('manuallySim1').toString();

 manuallySim2 = prefs.getString('manuallySim2').toString();
  //globals.manuallySim2 = prefs.getString('manuallySim2').toString();

  // print('----- globals.installedNumber------: ' +
  //     installedNumber.toString());
  // print('----- globals.manuallySim1------: ' +
  //    manuallySim1.toString());
  // print('----- globals.manuallySim2------: ' +
  //    manuallySim2.toString());
}


///
// customTextField(
//     BuildContext context, {
//       value,
//       message,
//       text,
//       hintText,
//       initialText,
//       type,
//       prefixIcon,
//       visibility,
//       obsecureText,
//       maxLength,
//       autoFillHints,
//       readOnly,
//       maxLines,
//     }) {
//   return Container(
//     //decoration
//
//     height:60 ,
//
//     decoration: BoxDecoration(
//       border: Border.all(),
//
//       // color: const Color(0xfff6f6f6),
//       color: Colors.white,
//       borderRadius: BorderRadius.circular(15.0),
//
//       // boxShadow: const [
//       //   BoxShadow(
//       //     color: Colors.black12,
//       //     offset: Offset(1, 1),
//       //     blurRadius: 10,
//       //   ),
//       //   BoxShadow(
//       //     color: Colors.transparent,
//       //     offset: Offset(-1, -1),
//       //     blurRadius: 10,
//       //   )
//       // ]
//
//     ),
//     child: Padding(
//       padding: EdgeInsets.all(5),
//
//       // padding: const EdgeInsets.only(left: 5.0,right: 5),
//       child: TextFormField(
//
//         controller: value ?? null,
//         validator: (v) {
//           if (v!.isEmpty) {
//             return message != null ? 'Please Enter $message' : null;
//           } else {
//             return null;
//           }
//         },
//         obscureText: obsecureText ?? false,
//         style: const TextStyle(fontSize: 16),
//         keyboardType: type ,
//         textAlignVertical: TextAlignVertical.center,
//         maxLength: maxLength ,
//         maxLines: maxLines ?? 1,
//         autofillHints: [autoFillHints],
//         readOnly: readOnly ?? false,
//         decoration: InputDecoration(
//             counter: const Offstage(),
//             hintText: hintText,
//             border: InputBorder.none,
//             filled: true,
//             isCollapsed: true,
//             enabledBorder: InputBorder.none,
//             focusedBorder: InputBorder.none,
//             fillColor: Colors.white,
//             prefixIcon: prefixIcon != null
//                 ? Icon(
//               // color: Colors.white70,
//               prefixIcon,
//               size: 25,
//             )
//                 : null,
//             suffixIcon: visibility,
//             hintStyle: const TextStyle(fontSize: 16,fontWeight:FontWeight.w600 )),
//       ),
//     ),);
//
//
//}
