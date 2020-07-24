// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'portal_recent_transaction_response.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

PortalRecentTransaction _$PortalRecentTransactionFromJson(
    Map<String, dynamic> json) {
  return PortalRecentTransaction(
      json['id'] as int,
      json['RefNo'] as String,
      json['TranType'] as String,
      json['TranDate'] as String,
      json['TranAmount'] as String,
      json['BalAmount'] as String,
      json['TransType'] as String);
}

Map<String, dynamic> _$PortalRecentTransactionToJson(
        PortalRecentTransaction instance) =>
    <String, dynamic>{
      'id': instance.id,
      'RefNo': instance.RefNo,
      'TranType': instance.TranType,
      'TranDate': instance.TranDate,
      'TranAmount': instance.TranAmount,
      'BalAmount': instance.BalAmount,
      'TransType': instance.TransType
    };
