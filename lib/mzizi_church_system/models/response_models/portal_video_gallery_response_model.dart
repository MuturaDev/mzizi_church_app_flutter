
import 'package:json_annotation/json_annotation.dart';

part 'portal_video_gallery_response_model.g.dart';

@JsonSerializable()
class PortalVideoGalleryResponseModel {
  String Name;
  String Body;
  String VideoLink;
  String DueDate;

  PortalVideoGalleryResponseModel(
    this.Name,
    this.Body,
    this.VideoLink,
    this.DueDate,
  );

  factory PortalVideoGalleryResponseModel.fromJson(Map<String,dynamic> json) => _$PortalVideoGalleryResponseModelFromJson(json);

  Map<String,dynamic> toJson() =>  _$PortalVideoGalleryResponseModelToJson(this);


  @override
  String toString() {
    return 'PortalVideoGalleryResponseModel(Name: $Name, Body: $Body, VideoLink: $VideoLink, DueDate: $DueDate)';
  }
}
