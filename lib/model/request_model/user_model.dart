class OtpProvidermodel {
  int? menberID;
  bool? otpStatus;
  var otpTime;
  int? serial;
  OtpProvidermodel({this.menberID, this.otpStatus, this.otpTime,this.serial});

  OtpProvidermodel.fromJson(Map<String, dynamic> json) {
    menberID = json['menberID'];
    otpStatus = json['otpStatus'];
    otpTime = json['otpTime'];
    serial =json['serial'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['menberID'] = this.menberID;
    data['otpStatus'] = this.otpStatus;
    data['otpTime'] = this.otpTime;
     data['serial'] = this.serial;
    return data;
  }
}
