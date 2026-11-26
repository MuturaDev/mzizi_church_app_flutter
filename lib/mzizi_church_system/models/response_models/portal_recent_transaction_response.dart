

import 'package:json_annotation/json_annotation.dart';

part 'portal_recent_transaction_response.g.dart';
@JsonSerializable()
class PortalRecentTransaction {
  int? id;
  String? RefNo;
  String? TranType;
  String? TranDate;
  String? TranAmount;
  String? BalAmount;
  String? TransType;

  PortalRecentTransaction(
    this.id,
    this.RefNo,
    this.TranType,
    this.TranDate,
    this.TranAmount,
    this.BalAmount,
    this.TransType,
  );

  
  factory PortalRecentTransaction.fromJson(Map<String,dynamic> json) => _$PortalRecentTransactionFromJson(json);

  Map<String, dynamic> toJson() => _$PortalRecentTransactionToJson(this);
  

  @override
  String toString() {
    return 'PortalRecentTransaction(id: $id, RefNo: $RefNo, TranType: $TranType, TranDate: $TranDate, TranAmount: $TranAmount, BalAmount: $BalAmount, TransType: $TransType)';
  }
}
