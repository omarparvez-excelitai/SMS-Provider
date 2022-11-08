import 'package:flutter/material.dart';
import 'package:otp_provider/globals.dart' as globals;
import 'package:otp_provider/presentation/provider/controller.dart';
import 'package:otp_provider/theme/theme.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:provider/provider.dart' show Provider;

class SelectPhoneNumberPage extends StatefulWidget {
  const SelectPhoneNumberPage({Key? key}) : super(key: key);

  @override
  State<SelectPhoneNumberPage> createState() => _SelectPhoneNumberPageState();
}

class _SelectPhoneNumberPageState extends State<SelectPhoneNumberPage> {

  TextEditingController installedNumberController = TextEditingController();
  TextEditingController sim1NumberController = TextEditingController();
  TextEditingController sim2NumberController = TextEditingController();

  setManualNumToPrefs() async {
    DashboardController dashboardController =
        Provider.of(context, listen: false);
    SharedPreferences prefs = await SharedPreferences.getInstance();

    prefs.setString(
        'installedNumber', installedNumberController.text.toString());

    prefs.setString('manuallySim1', sim1NumberController.text.toString());

    prefs.setString('manuallySim2', sim2NumberController.text.toString());

    globals.installedNumber = prefs.getString('installedNumber').toString();
    // dashboardController.installedNumber( prefs.getString('installedNumber').toString());

    globals.manuallySim1 = prefs.getString('manuallySim1').toString();

    globals.manuallySim2 = prefs.getString('manuallySim2').toString();
  }

  initManualNumberPrefs() async {
    SharedPreferences prefs = await SharedPreferences.getInstance();
    installedNumberController.text =
        prefs.getString('installedNumber').toString();

   // sim1NumberController.text =    globals.automaticallySim1!.isEmpty?prefs.getString('manuallySim1').toString():globals.automaticallySim1!;
  sim1NumberController.text =    (globals.automaticallySim1!.isEmpty?prefs.getString('manuallySim1').toString():globals.automaticallySim1)!;
    //sim1NumberController.text = prefs.getString('manuallySim1').toString();

    sim2NumberController.text = prefs.getString('manuallySim2').toString();
  }
  bool isEdit = true;
  bool editButtonStatus = true;

  final _formKey1 = GlobalKey<FormState>();

  @override
  initState() {
  initManualNumberPrefs();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Phone Number'),
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
      body: SingleChildScrollView(
        child: Container(
          margin: EdgeInsets.only(top: 20,right: 20,left: 20,bottom: 20),
          padding: EdgeInsets.only(top: 10,bottom: 10),
          decoration: BoxDecoration(
            border: Border.all(color:   Color(0xFF1B5E20), width: 2.0),
            borderRadius: BorderRadius.circular(20.0),
          ),
          child: Form(
            key: _formKey1,
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                // IconButton(onPressed: (){
                //   setState((){
                //     editButtonStatus=true;
                //   });
                // }, icon: Icon(Icons.edit)),
                Container(
                  margin: EdgeInsets.all(15),
                  child: TextFormField(
                    readOnly: editButtonStatus ? true : false,
                    keyboardType: TextInputType.number,
                    maxLength: 11,

                    controller: installedNumberController,
                    style: const TextStyle(
                      fontSize: 16,
                      color: Colors.black,
                      //color: Colors.grey,
                      fontWeight: FontWeight.normal,
                    ),

                    validator: (value) {
                      if (value == null || value.isEmpty || value.length < 11) {
                        return 'Enter a valid Mobile Number';
                      } else {
                        return null;
                      }
                    },
                    decoration: InputDecoration(
                      prefixText: "+88 ",
                      focusColor: Colors.white,
                      prefixIcon: const Icon(
                        Icons.phone,
                        color: Color(0xFF1B5E20),
                        //color: Colors.grey,
                      ),
                      border: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(10.0),
                      ),
                      focusedBorder: OutlineInputBorder(
                        borderSide: const BorderSide(
                            color: Color(0xFF1B5E20), width: 1.0),
                        borderRadius: BorderRadius.circular(10.0),
                      ),
                      fillColor: Colors.grey,
                      labelText: 'Installed Number',
                      labelStyle: const TextStyle(
                        color: Colors.grey,
                        fontSize: 16,
                        fontFamily: "verdana_regular",
                        fontWeight: FontWeight.w400,
                      ),
                    ),
                    // onSaved: (value) {
                    //   numberController.text = value as String;
                    // },
                  ),
                ),

                Container(
                  margin: EdgeInsets.all(15),
                  child: TextFormField(
                    readOnly: editButtonStatus ? true : false,
                    keyboardType: TextInputType.number,
                    maxLength: 11,

                    controller: sim1NumberController,
                    style: const TextStyle(
                      fontSize: 16,
                      color: Colors.black,
                      //color: Colors.grey,
                      fontWeight: FontWeight.normal,
                    ),

                    validator: (value) {
                      if (value == null || value.isEmpty || value.length < 11) {
                        return 'Enter a valid Mobile Number';
                      } else {
                        return null;
                      }
                    },
                    decoration: InputDecoration(
                      prefixText: "+88 ",
                      focusColor: Colors.white,
                      prefixIcon: const Icon(
                        Icons.phone,
                        color: Color(0xFF1B5E20),
                      ),
                      border: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(10.0),
                      ),
                      focusedBorder: OutlineInputBorder(
                        borderSide: const BorderSide(
                            color: Color(0xFF1B5E20), width: 1.0),
                        borderRadius: BorderRadius.circular(10.0),
                      ),
                      fillColor: Colors.grey,
                      labelText: 'SIM1',
                      labelStyle: const TextStyle(
                        color: Colors.grey,
                        fontSize: 16,
                        fontFamily: "verdana_regular",
                        fontWeight: FontWeight.w400,
                      ),
                    ),
                    // onSaved: (value) {
                    //   numberController.text = value as String;
                    // },
                  ),
                ),

                Container(
                  margin: EdgeInsets.all(15),
                  child: TextFormField(
                    readOnly: editButtonStatus ? true : false,
                    //  readOnly: editButtonStatus?false:true,
                    keyboardType: TextInputType.number,
                    maxLength: 11,

                    controller: sim2NumberController,
                    style: const TextStyle(
                      fontSize: 16,
                      color: Colors.black,
                      //color: Colors.grey,
                      fontWeight: FontWeight.normal,
                    ),

                    validator: (value) {
                      if (value == null || value.isEmpty || value.length < 11) {
                        return 'Enter a valid Mobile Number';
                      } else {
                        return null;
                      }
                    },
                    decoration: InputDecoration(
                      prefixText: "+88 ",
                      focusColor: Colors.white,
                      prefixIcon: const Icon(
                        Icons.phone,
                        color: Color(0xFF1B5E20),
                      ),
                      border: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(10.0),
                      ),
                      focusedBorder: OutlineInputBorder(
                        borderSide: const BorderSide(
                            color: Color(0xFF1B5E20), width: 1.0),
                        borderRadius: BorderRadius.circular(10.0),
                      ),
                      fillColor: Colors.grey,
                      labelText: 'SIM2',
                      labelStyle: const TextStyle(
                        color: Colors.grey,
                        fontSize: 16,
                        fontFamily: "verdana_regular",
                        fontWeight: FontWeight.w400,
                      ),
                    ),
                    // onSaved: (value) {
                    //   numberController.text = value as String;
                    // },
                  ),
                ),
                // Divider(
                //   height: 20.0,
                // ),
                SizedBox(
                  width: 150,
                  child: isEdit
                      ? ElevatedButton(
                          child: Text(
                            "Update Number",
                          ),
                          style: ElevatedButton.styleFrom(
                            primary: theme.primaryColor,
                            textStyle: const TextStyle(
                                color: Colors.white,
                                fontSize: 16,
                                fontStyle: FontStyle.normal),
                          ),
                          onPressed: () {
                            setState(() {
                              editButtonStatus = false;
                              isEdit = !isEdit;
                              //  editButtonStatus=!editButtonStatus;
                              //    editButtonStatus=true;
                            });
                          },
                        )
                      : ElevatedButton(
                          child: Text(
                            'Submit',
                          ),
                          style: ElevatedButton.styleFrom(
                            primary: theme.primaryColor,
                            textStyle: const TextStyle(
                                color: Colors.white,
                                fontSize: 16,
                                fontStyle: FontStyle.normal),
                          ),
                          onPressed: () {
                            if (_formKey1.currentState!.validate()) {
                              setManualNumToPrefs();

                              Future.delayed(const Duration(seconds: 1), () {
                                // final snackBar = SnackBar(
                                //   content: const Text('SMS Successfully Sent'),
                                //   backgroundColor: (Colors.blueGrey),
                                //   action: SnackBarAction(
                                //     label: 'dismiss',
                                //     onPressed: () {},
                                //   ),
                                // );
                                // ScaffoldMessenger.of(context).showSnackBar(snackBar);
                                Navigator.pop(context);
                              });
                            }
                          },
                        ),
                ),

                // Row(
                //   mainAxisAlignment: MainAxisAlignment.spaceAround,
                //  children: [
                //
                //    ElevatedButton(
                //      child: Text(
                //        'Edit',
                //      ),
                //      style: ElevatedButton.styleFrom(
                //        primary: theme.primaryColor,
                //        textStyle: const TextStyle(
                //            color: Colors.white,
                //            fontSize: 16,
                //            fontStyle: FontStyle.normal),
                //      ),
                //      onPressed: () {
                //        setState((){
                //          editButtonStatus=false;
                //        //  editButtonStatus=!editButtonStatus;
                //      //    editButtonStatus=true;
                //        });
                //      },
                //    ),
                //    ElevatedButton(
                //      child: Text(
                //        'Submit',
                //      ),
                //      style: ElevatedButton.styleFrom(
                //        primary: theme.primaryColor,
                //        textStyle: const TextStyle(
                //            color: Colors.white,
                //            fontSize: 16,
                //            fontStyle: FontStyle.normal),
                //      ),
                //      onPressed: () {
                //        if (_formKey1.currentState!.validate()) {
                //          setManualNumToPrefs();
                //          setState((){
                //            editButtonStatus=true;
                //            //editButtonStatus=false;
                //          });
                //          Future.delayed(const Duration(seconds: 2), () {
                //            // final snackBar = SnackBar(
                //            //   content: const Text('SMS Successfully Sent'),
                //            //   backgroundColor: (Colors.blueGrey),
                //            //   action: SnackBarAction(
                //            //     label: 'dismiss',
                //            //     onPressed: () {},
                //            //   ),
                //            // );
                //            // ScaffoldMessenger.of(context).showSnackBar(snackBar);
                //            Navigator.pop(context);
                //          });
                //        }
                //      },
                //    ),
                //  ],
                // ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
