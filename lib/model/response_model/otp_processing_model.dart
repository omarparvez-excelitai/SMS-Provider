import 'dart:convert';
/// status : true
/// affected_rows : 18
/// ids : ["1","2","3","4","5","6","7","8","9","10","11","12","13","14","15","16","17","18"]
/// data : [{"id":"1","sms":"55555","type":"OTP","device_id":"1111","device_name":"222","device_model":"333","device_location":"","app_signature_id":"444","status":"PROCESSING","member_id":"1444","membership_number":"K00223","mobile_number":"01712-221192","receiving_number":"01766609988, 01716411616","sending_number":"01797648000","created_on":"2022-08-31 13:14:21","delivered_on":"2022-08-31 13:14:21","updated_on":"2022-09-03 06:09:50"},{"id":"2","sms":"55555","type":"OTP","device_id":"1111","device_name":"222","device_model":"333","device_location":"","app_signature_id":"444","status":"PROCESSING","member_id":"1444","membership_number":"K00223","mobile_number":"01712-221192","receiving_number":"01766609988, 01716411616","sending_number":"01797648000","created_on":"2022-09-01 08:11:56","delivered_on":"2022-09-01 08:11:56","updated_on":"2022-09-03 06:09:50"},{"id":"3","sms":"55555","type":"OTP","device_id":"1111","device_name":"222","device_model":"333","device_location":"","app_signature_id":"444","status":"PROCESSING","member_id":"1444","membership_number":"K00223","mobile_number":"01712-221192","receiving_number":"01766609988, 01716411616","sending_number":"01797648000","created_on":"2022-09-01 08:12:01","delivered_on":"2022-09-01 08:12:01","updated_on":"2022-09-03 06:09:50"},{"id":"4","sms":"55555","type":"OTP","device_id":"1111","device_name":"222","device_model":"333","device_location":"","app_signature_id":"444","status":"PROCESSING","member_id":"1444","membership_number":"K00223","mobile_number":"01712-221192","receiving_number":"01766609988, 01716411616","sending_number":"01797648000","created_on":"2022-09-01 08:12:59","delivered_on":"2022-09-01 08:12:59","updated_on":"2022-09-03 06:09:50"},{"id":"5","sms":"55555","type":"OTP","device_id":"1111","device_name":"222","device_model":"333","device_location":"","app_signature_id":"444","status":"PROCESSING","member_id":"12321","membership_number":"K00223","mobile_number":"01712-221192","receiving_number":"01766609988, 01716411616","sending_number":"01797648000","created_on":"2022-09-01 08:15:43","delivered_on":"2022-09-01 08:15:43","updated_on":"2022-09-03 06:09:50"},{"id":"6","sms":"55555","type":"OTP","device_id":"1111","device_name":"222","device_model":"333","device_location":"","app_signature_id":"444","status":"SENT","member_id":"12321","membership_number":"K00223","mobile_number":"01712-221192","receiving_number":"01766609988, 01716411616","sending_number":"01797648000","created_on":"2022-09-01 08:16:50","delivered_on":"2022-09-01 08:16:50","updated_on":"2022-09-03 06:09:45"},{"id":"7","sms":"55555","type":"OTP","device_id":"1111","device_name":"222","device_model":"333","device_location":"","app_signature_id":"444","status":"PROCESSING","member_id":"12321","membership_number":"K00223","mobile_number":"01712-221192","receiving_number":"01766609988, 01716411616","sending_number":"01797648000","created_on":"2022-09-01 08:19:44","delivered_on":"2022-09-01 08:19:44","updated_on":"2022-09-03 06:09:50"},{"id":"8","sms":"55555","type":"OTP","device_id":"1111","device_name":"222","device_model":"333","device_location":"","app_signature_id":"444","status":"PROCESSING","member_id":"12321","membership_number":"K00223","mobile_number":"01712-221192","receiving_number":"01766609988, 01716411616","sending_number":"01797648000","created_on":"2022-09-01 09:51:32","delivered_on":"2022-09-01 09:51:32","updated_on":"2022-09-03 06:09:50"},{"id":"9","sms":"55555","type":"OTP","device_id":"1111","device_name":"222","device_model":"333","device_location":"","app_signature_id":"444","status":"PROCESSING","member_id":"12321","membership_number":"K00223","mobile_number":"01712-221192","receiving_number":"01766609988, 01716411616","sending_number":"01797648000","created_on":"2022-09-01 12:19:27","delivered_on":"2022-09-01 12:19:27","updated_on":"2022-09-03 06:09:50"},{"id":"10","sms":"55555","type":"OTP","device_id":"1111","device_name":"222","device_model":"333","device_location":"","app_signature_id":"444","status":"PROCESSING","member_id":"12321","membership_number":"K00223","mobile_number":"01712-221192","receiving_number":"01766609988, 01716411616","sending_number":"01797648000","created_on":"2022-09-01 12:20:41","delivered_on":"2022-09-01 12:20:41","updated_on":"2022-09-03 06:09:50"},{"id":"11","sms":"Your OTP code is 6898 XsKchAtTe4z","type":"OTP","device_id":"RP1A.200720.012","device_name":"a12s","device_model":"SM-A127F","device_location":"","app_signature_id":"XsKchAtTe4z","status":"PROCESSING","member_id":"0","membership_number":"K00223","mobile_number":"01712-221192","receiving_number":"01766609988, 01716411616","sending_number":"01797648000","created_on":"2022-09-01 12:45:42","delivered_on":"2022-09-01 12:45:42","updated_on":"2022-09-03 06:09:50"},{"id":"12","sms":"Your OTP code is 5325 XsKchAtTe4z","type":"OTP","device_id":"RP1A.200720.012","device_name":"a12s","device_model":"SM-A127F","device_location":"","app_signature_id":"XsKchAtTe4z","status":"PROCESSING","member_id":"0","membership_number":"K00223","mobile_number":"01712-221192","receiving_number":"01766609988, 01716411616","sending_number":"01797648000","created_on":"2022-09-01 12:51:44","delivered_on":"2022-09-01 12:51:44","updated_on":"2022-09-03 06:09:50"},{"id":"13","sms":"Your OTP code is 9390 XsKchAtTe4z","type":"OTP","device_id":"RP1A.200720.012","device_name":"a12s","device_model":"SM-A127F","device_location":"","app_signature_id":"XsKchAtTe4z","status":"PROCESSING","member_id":"0","membership_number":"K00223","mobile_number":"01712-221192","receiving_number":"01766609988, 01716411616","sending_number":"01797648000","created_on":"2022-09-01 13:13:37","delivered_on":"2022-09-01 13:13:37","updated_on":"2022-09-03 06:09:50"},{"id":"14","sms":"Your OTP code is 8569 XsKchAtTe4z","type":"OTP","device_id":"RP1A.200720.012","device_name":"a12s","device_model":"SM-A127F","device_location":"","app_signature_id":"XsKchAtTe4z","status":"PROCESSING","member_id":"0","membership_number":"K00223","mobile_number":"01712-221192","receiving_number":"01766609988, 01716411616","sending_number":"01797648000","created_on":"2022-09-01 13:29:54","delivered_on":"2022-09-01 13:29:54","updated_on":"2022-09-03 06:09:50"},{"id":"15","sms":"Your OTP code is 9513 XsKchAtTe4z","type":"OTP","device_id":"RP1A.200720.012","device_name":"a12s","device_model":"SM-A127F","device_location":"","app_signature_id":"XsKchAtTe4z","status":"PROCESSING","member_id":"0","membership_number":"K00223","mobile_number":"01712-221192","receiving_number":"01766609988, 01716411616","sending_number":"01797648000","created_on":"2022-09-01 13:31:25","delivered_on":"2022-09-01 13:31:25","updated_on":"2022-09-03 06:09:50"},{"id":"16","sms":"Your OTP code is 7790 XsKchAtTe4z","type":"OTP","device_id":"RP1A.200720.012","device_name":"a12s","device_model":"SM-A127F","device_location":"","app_signature_id":"XsKchAtTe4z","status":"PROCESSING","member_id":"0","membership_number":"K00223","mobile_number":"01712-221192","receiving_number":"01766609988, 01716411616","sending_number":"01797648000","created_on":"2022-09-01 14:42:40","delivered_on":"2022-09-01 14:42:40","updated_on":"2022-09-03 06:09:50"},{"id":"17","sms":"Your OTP code is 4415 XsKchAtTe4z","type":"OTP","device_id":"RP1A.200720.012","device_name":"a12s","device_model":"SM-A127F","device_location":"","app_signature_id":"XsKchAtTe4z","status":"PROCESSING","member_id":"0","membership_number":"K00223","mobile_number":"01712-221192","receiving_number":"01766609988, 01716411616","sending_number":"01797648000","created_on":"2022-09-01 14:42:43","delivered_on":"2022-09-01 14:42:43","updated_on":"2022-09-03 06:09:50"},{"id":"18","sms":"Your OTP code is 7139 XsKchAtTe4z","type":"OTP","device_id":"RP1A.200720.012","device_name":"a12s","device_model":"SM-A127F","device_location":"","app_signature_id":"XsKchAtTe4z","status":"PROCESSING","member_id":"0","membership_number":"K00223","mobile_number":"01712-221192","receiving_number":"01766609988, 01716411616","sending_number":"01797648000","created_on":"2022-09-01 14:45:55","delivered_on":"2022-09-01 14:45:55","updated_on":"2022-09-03 06:09:50"}]

OtpProcessingModel otpProcessingModelFromJson(String str) => OtpProcessingModel.fromJson(json.decode(str));
String otpProcessingModelToJson(OtpProcessingModel data) => json.encode(data.toJson());
class OtpProcessingModel {
  OtpProcessingModel({
      bool? status, 
      int? affectedRows, 
      List<String>? ids, 
      List<ProcessingData>? data,
    String? mode,}){
    _status = status;
    _affectedRows = affectedRows;
    _ids = ids;
    _data = data;
    _mode = mode;
}

  OtpProcessingModel.fromJson(dynamic json) {
    _status = json['status'];
    _affectedRows = json['affected_rows'];
    _ids = json['ids'] != null ? json['ids'].cast<String>() : [];
    if (json['data'] != null) {
      _data = [];
      json['data'].forEach((v) {
        _data?.add(ProcessingData.fromJson(v));
      });
    }
    _mode = json['mode'];
  }
  bool? _status;
  int? _affectedRows;
  List<String>? _ids;
  List<ProcessingData>? _data;
  String? _mode;

  String? get mode => _mode;

  bool? get status => _status;
  int? get affectedRows => _affectedRows;
  List<String>? get ids => _ids;
  List<ProcessingData>? get data => _data;

  Map<String, dynamic> toJson() {
    final map = <String, dynamic>{};
    map['status'] = _status;
    map['affected_rows'] = _affectedRows;
    map['ids'] = _ids;
    if (_data != null) {
      map['data'] = _data?.map((v) => v.toJson()).toList();
    }
    return map;
  }

}

/// id : "1"
/// sms : "55555"
/// type : "OTP"
/// device_id : "1111"
/// device_name : "222"
/// device_model : "333"
/// device_location : ""
/// app_signature_id : "444"
/// status : "PROCESSING"
/// member_id : "1444"
/// membership_number : "K00223"
/// mobile_number : "01712-221192"
/// receiving_number : "01766609988, 01716411616"
/// sending_number : "01797648000"
/// created_on : "2022-08-31 13:14:21"
/// delivered_on : "2022-08-31 13:14:21"
/// updated_on : "2022-09-03 06:09:50"

ProcessingData dataFromJson(String str) => ProcessingData.fromJson(json.decode(str));
String dataToJson(ProcessingData data) => json.encode(data.toJson());
class ProcessingData {
  ProcessingData({
      String? id, 
      String? sms, 
      String? type, 
      String? deviceId, 
      String? deviceName, 
      String? deviceModel, 
      String? deviceLocation, 
      String? appSignatureId, 
      String? status, 
      String? memberId, 
      String? membershipNumber, 
      String? mobileNumber, 
      String? receivingNumber, 
      String? sendingNumber, 
      String? createdOn, 
      String? deliveredOn, 
      String? updatedOn,}){
    _id = id;
    _sms = sms;
    _type = type;
    _deviceId = deviceId;
    _deviceName = deviceName;
    _deviceModel = deviceModel;
    _deviceLocation = deviceLocation;
    _appSignatureId = appSignatureId;
    _status = status;
    _memberId = memberId;
    _membershipNumber = membershipNumber;
    _mobileNumber = mobileNumber;
    _receivingNumber = receivingNumber;
    _sendingNumber = sendingNumber;
    _createdOn = createdOn;
    _deliveredOn = deliveredOn;
    _updatedOn = updatedOn;
}

  ProcessingData.fromJson(dynamic json) {
    _id = json['id'];
    _sms = json['sms'];
    _type = json['type'];
    _deviceId = json['device_id'];
    _deviceName = json['device_name'];
    _deviceModel = json['device_model'];
    _deviceLocation = json['device_location'];
    _appSignatureId = json['app_signature_id'];
    _status = json['status'];
    _memberId = json['member_id'];
    _membershipNumber = json['membership_number'];
    _mobileNumber = json['mobile_number'];
    _receivingNumber = json['receiving_number'];
    _sendingNumber = json['sending_number'];
    _createdOn = json['created_on'];
    _deliveredOn = json['delivered_on'];
    _updatedOn = json['updated_on'];
  }
  String? _id;
  String? _sms;
  String? _type;
  String? _deviceId;
  String? _deviceName;
  String? _deviceModel;
  String? _deviceLocation;
  String? _appSignatureId;
  String? _status;
  String? _memberId;
  String? _membershipNumber;
  String? _mobileNumber;
  String? _receivingNumber;
  String? _sendingNumber;
  String? _createdOn;
  String? _deliveredOn;
  String? _updatedOn;

  String? get id => _id;
  String? get sms => _sms;
  String? get type => _type;
  String? get deviceId => _deviceId;
  String? get deviceName => _deviceName;
  String? get deviceModel => _deviceModel;
  String? get deviceLocation => _deviceLocation;
  String? get appSignatureId => _appSignatureId;
  String? get status => _status;
  String? get memberId => _memberId;
  String? get membershipNumber => _membershipNumber;
  String? get mobileNumber => _mobileNumber;
  String? get receivingNumber => _receivingNumber;
  String? get sendingNumber => _sendingNumber;
  String? get createdOn => _createdOn;
  String? get deliveredOn => _deliveredOn;
  String? get updatedOn => _updatedOn;

  Map<String, dynamic> toJson() {
    final map = <String, dynamic>{};
    map['id'] = _id;
    map['sms'] = _sms;
    map['type'] = _type;
    map['device_id'] = _deviceId;
    map['device_name'] = _deviceName;
    map['device_model'] = _deviceModel;
    map['device_location'] = _deviceLocation;
    map['app_signature_id'] = _appSignatureId;
    map['status'] = _status;
    map['member_id'] = _memberId;
    map['membership_number'] = _membershipNumber;
    map['mobile_number'] = _mobileNumber;
    map['receiving_number'] = _receivingNumber;
    map['sending_number'] = _sendingNumber;
    map['created_on'] = _createdOn;
    map['delivered_on'] = _deliveredOn;
    map['updated_on'] = _updatedOn;
    return map;
  }

}