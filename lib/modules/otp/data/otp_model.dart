import 'dart:convert';
OtpModel otpModelFromJson(String str) => OtpModel.fromJson(json.decode(str));
String otpModelToJson(OtpModel data) => json.encode(data.toJson());
class OtpModel {
  OtpModel({
      this.status, 
      this.activationCode, 
      this.message,});

  OtpModel.fromJson(dynamic json) {
    status = json['status'];
    activationCode = json['activation_code'];
    message = json['message'];
  }
  int? status;
  int? activationCode;
  String? message;

  Map<String, dynamic> toJson() {
    final map = <String, dynamic>{};
    map['status'] = status;
    map['activation_code'] = activationCode;
    map['message'] = message;
    return map;
  }

}