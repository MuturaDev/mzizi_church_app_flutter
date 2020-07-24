// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'portal_sync_myaccount_response_model.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

PortalSyncMyAccount _$PortalSyncMyAccountFromJson(Map<String, dynamic> json) {
  return PortalSyncMyAccount(
      json['id'] as int,
      json['BillingBalance'] as String,
      json['OrganizationID'] as String,
      json['PaybillNo'] as String,
      json['PortalAccount'] as String,
      json['Balance'] as String);
}

Map<String, dynamic> _$PortalSyncMyAccountToJson(
        PortalSyncMyAccount instance) =>
    <String, dynamic>{
      'id': instance.id,
      'BillingBalance': instance.BillingBalance,
      'OrganizationID': instance.OrganizationID,
      'PaybillNo': instance.PaybillNo,
      'PortalAccount': instance.PortalAccount,
      'Balance': instance.Balance
    };
