class PortalGlobalSettingResponse {
  String GlobalSettingValue;
  String GlobalSettingName;

  PortalGlobalSettingResponse(
      {this.GlobalSettingValue, this.GlobalSettingName});

  PortalGlobalSettingResponse.fromJson(Map<String, dynamic> json) {
    GlobalSettingValue = json['GlobalSettingValue'];
    GlobalSettingName = json['GlobalSettingName'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['GlobalSettingValue'] = this.GlobalSettingValue;
    data['GlobalSettingName'] = this.GlobalSettingName;
    return data;
  }
}
