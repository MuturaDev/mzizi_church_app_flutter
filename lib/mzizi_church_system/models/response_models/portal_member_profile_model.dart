class PortalMemberProfileModel {
  String StudentFullName;
  String InstituteName;
  String GroupName;
  String StudentPhoneNo;
  String Email;
  String RegistrationNumer;
  String SchoolName;
  String CourseCode;
  String LevelName;
  String Nationality;
  String NationalID;

  PortalMemberProfileModel(
      {this.StudentFullName,
      this.InstituteName,
      this.GroupName,
      this.StudentPhoneNo,
      this.Email,
      this.RegistrationNumer,
      this.SchoolName,
      this.CourseCode,
      this.LevelName,
      this.Nationality,
      this.NationalID});

  PortalMemberProfileModel.fromJson(Map<String, dynamic> json) {
    StudentFullName = json['StudentFullName'];
    InstituteName = json['InstituteName'];
    GroupName = json['GroupName'];
    StudentPhoneNo = json['StudentPhoneNo'];
    Email = json['Email'];
    RegistrationNumer = json['RegistrationNumer'];
    SchoolName = json['SchoolName'];
    CourseCode = json['CourseCode'];
    LevelName = json['LevelName'];
    Nationality = json['Nationality'];
    NationalID = json['NationalID'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['StudentFullName'] = this.StudentFullName;
    data['InstituteName'] = this.InstituteName;
    data['GroupName'] = this.GroupName;
    data['StudentPhoneNo'] = this.StudentPhoneNo;
    data['Email'] = this.Email;
    data['RegistrationNumer'] = this.RegistrationNumer;
    data['SchoolName'] = this.SchoolName;
    data['CourseCode'] = this.CourseCode;
    data['LevelName'] = this.LevelName;
    data['Nationality'] = this.Nationality;
    data['NationalID'] = this.NationalID;
    return data;
  }
}
