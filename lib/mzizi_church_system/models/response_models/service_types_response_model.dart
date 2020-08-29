class ServiceTypesModel {
  String ID;
  String Name;

  ServiceTypesModel({this.ID, this.Name});

  ServiceTypesModel.fromJson(Map<String, dynamic> json) {
    ID = json['ID'];
    Name = json['Name'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['ID'] = this.ID;
    data['Name'] = this.Name;
    return data;
  }
}
