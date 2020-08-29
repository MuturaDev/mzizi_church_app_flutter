// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'make_a_pledge_request_model.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

PortalMakeAPledge _$PortalMakeAPledgeFromJson(Map<String, dynamic> json) {
  return PortalMakeAPledge(
      json['StudentID'] as String,
      json['FeeName'] as String,
      json['Amount'] as String,
      json['TermID'] as String,
      json['YearFor'] as String,
      json['DrCr'] as String,
      json['PostQb'] as String,
      json['CustomFeeRemarks'] as String,
      json['ChurchCode'] as String);
}

Map<String, dynamic> _$PortalMakeAPledgeToJson(PortalMakeAPledge instance) =>
    <String, dynamic>{
      'StudentID': instance.StudentID,
      'FeeName': instance.FeeName,
      'Amount': instance.Amount,
      'TermID': instance.TermID,
      'YearFor': instance.YearFor,
      'DrCr': instance.DrCr,
      'PostQb': instance.PostQb,
      'CustomFeeRemarks': instance.CustomFeeRemarks,
      'ChurchCode': instance.ChurchCode
    };
