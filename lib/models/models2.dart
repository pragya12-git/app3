class Logindetails {
  int? success;
  Message? message;

  Logindetails({this.success, this.message});

  Logindetails.fromJson(Map<String, dynamic> json) {
    success = json['success'];
    message =
        json['message'] != null ? new Message.fromJson(json['message']) : null;
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['success'] = this.success;
    if (this.message != null) {
      data['message'] = this.message!.toJson();
    }
    return data;
  }
}

class Message {
  String? id;
  String? name;
  String? address;
  String? fullName;
  String? token;
  String? email;
  String? mobileNumber;
  int? roleId;
  String? roleName;

  Message(
      {this.id,
      this.name,
      this.address,
      this.fullName,
      this.token,
      this.email,
      this.mobileNumber,
      this.roleId,
      this.roleName});

  Message.fromJson(Map<String, dynamic> json) {
    id = json['Id'];
    name = json['Name'];
    address = json['Address'];
    fullName = json['FullName'];
    token = json['Token'];
    email = json['Email'];
    mobileNumber = json['MobileNumber'];
    roleId = json['RoleId'];
    roleName = json['RoleName'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['Id'] = this.id;
    data['Name'] = this.name;
    data['Address'] = this.address;
    data['FullName'] = this.fullName;
    data['Token'] = this.token;
    data['Email'] = this.email;
    data['MobileNumber'] = this.mobileNumber;
    data['RoleId'] = this.roleId;
    data['RoleName'] = this.roleName;
    return data;
  }
}
