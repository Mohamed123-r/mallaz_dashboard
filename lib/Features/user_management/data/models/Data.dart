class Data {
  Data({
      this.id, 
      this.userName, 
      this.email, 
      this.phoneNumber, 
      this.isBlocked,});

  Data.fromJson(dynamic json) {
    id = json['id'];
    userName = json['userName'];
    email = json['email'];
    phoneNumber = json['phoneNumber'];
    isBlocked = json['isBlocked'];
  }
  String? id;
  String? userName;
  String? email;
  String? phoneNumber;
  bool? isBlocked;

  Map<String, dynamic> toJson() {
    final map = <String, dynamic>{};
    map['id'] = id;
    map['userName'] = userName;
    map['email'] = email;
    map['phoneNumber'] = phoneNumber;
    map['isBlocked'] = isBlocked;
    return map;
  }

}