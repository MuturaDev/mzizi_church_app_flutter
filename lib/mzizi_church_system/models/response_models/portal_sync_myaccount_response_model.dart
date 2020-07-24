import 'package:floor/floor.dart';
import 'package:json_annotation/json_annotation.dart';

part 'portal_sync_myaccount_response_model.g.dart';

@entity
@JsonSerializable()
class PortalSyncMyAccount {
  @PrimaryKey(autoGenerate: true)
  int id;
  String BillingBalance;
  String OrganizationID;
  String PaybillNo;
  String PortalAccount;
  String Balance;

  PortalSyncMyAccount(
    this.id,
    this.BillingBalance,
    this.OrganizationID,
    this.PaybillNo,
    this.PortalAccount,
    this.Balance,
  );

  factory PortalSyncMyAccount.fromJson(Map<String, dynamic> json) =>
      _$PortalSyncMyAccountFromJson(json);

  Map<String, dynamic> toJson() => _$PortalSyncMyAccountToJson(this);

  @override
  String toString() {
    return 'PortalSyncMyAccount id: $id, BillingBalance: $BillingBalance, OrganizationID: $OrganizationID, PaybillNo: $PaybillNo, PortalAccount: $PortalAccount, Balance: $Balance';
  }
}
