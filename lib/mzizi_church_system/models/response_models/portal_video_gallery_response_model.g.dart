// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'portal_video_gallery_response_model.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

PortalVideoGalleryResponseModel _$PortalVideoGalleryResponseModelFromJson(
    Map<String, dynamic> json) {
  return PortalVideoGalleryResponseModel(
      json['Name'] as String,
      json['Body'] as String,
      json['VideoLink'] as String,
      json['DueDate'] as String);
}

Map<String, dynamic> _$PortalVideoGalleryResponseModelToJson(
        PortalVideoGalleryResponseModel instance) =>
    <String, dynamic>{
      'Name': instance.Name,
      'Body': instance.Body,
      'VideoLink': instance.VideoLink,
      'DueDate': instance.DueDate
    };
