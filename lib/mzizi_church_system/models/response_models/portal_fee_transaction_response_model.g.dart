// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'portal_fee_transaction_response_model.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

PortalDetailedTransaction _$PortalDetailedTransactionFromJson(
    Map<String, dynamic> json) {
  return PortalDetailedTransaction(
      json['id'] as int,
      json['RefNo'] as String,
      json['TranAmount'] as String,
      json['BalAmount'] as String,
      json['CurrentAmount'] as String,
      json['TranType'] as String,
      json['TransType'] as String,
      json['DatePosted'] as String);
}

Map<String, dynamic> _$PortalDetailedTransactionToJson(
        PortalDetailedTransaction instance) =>
    <String, dynamic>{
      'id': instance.id,
      'RefNo': instance.RefNo,
      'TranAmount': instance.TranAmount,
      'BalAmount': instance.BalAmount,
      'CurrentAmount': instance.CurrentAmount,
      'TranType': instance.TranType,
      'TransType': instance.TransType,
      'DatePosted': instance.DatePosted
    };
