import 'Data.dart';

class UserModel {
  UserModel({
      this.success, 
      this.message, 
      this.data, 
      this.totalCount, 
      this.pageNumber, 
      this.pageSize,});

  UserModel.fromJson(dynamic json) {
    success = json['success'];
    message = json['message'];
    if (json['data'] != null) {
      data = [];
      json['data'].forEach((v) {
        data?.add(Data.fromJson(v));
      });
    }
    totalCount = json['totalCount'];
    pageNumber = json['pageNumber'];
    pageSize = json['pageSize'];
  }
  bool? success;
  String? message;
  List<Data>? data;
  num? totalCount;
  num? pageNumber;
  num? pageSize;

  Map<String, dynamic> toJson() {
    final map = <String, dynamic>{};
    map['success'] = success;
    map['message'] = message;
    if (data != null) {
      map['data'] = data?.map((v) => v.toJson()).toList();
    }
    map['totalCount'] = totalCount;
    map['pageNumber'] = pageNumber;
    map['pageSize'] = pageSize;
    return map;
  }

}