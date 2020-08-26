
class PortalMemberProfileModel {
  String studentFullName;
  String instituteName;
  String groupName;
  String studentPhoneNo;
  String email;

  PortalMemberProfileModel(
      {this.studentFullName,
      this.instituteName,
      this.groupName,
      this.studentPhoneNo,
      this.email});

  PortalMemberProfileModel.fromJson(Map<String, dynamic> json) {
    studentFullName = json['StudentFullName'];
    instituteName = json['InstituteName'];
    groupName = json['GroupName'];
    studentPhoneNo = json['StudentPhoneNo'];
    email = json['Email'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['StudentFullName'] = this.studentFullName;
    data['InstituteName'] = this.instituteName;
    data['GroupName'] = this.groupName;
    data['StudentPhoneNo'] = this.studentPhoneNo;
    data['Email'] = this.email;
    return data;
  }
}
