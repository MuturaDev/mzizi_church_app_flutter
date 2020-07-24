
import 'package:floor/floor.dart';
import 'package:flutter/material.dart';
import 'package:json_annotation/json_annotation.dart';

part 'portal_fee_transaction_response_model.g.dart';

@entity
@JsonSerializable()
class PortalDetailedTransaction{

   @PrimaryKey(autoGenerate: true)
   int id; 
   String RefNo;
   String TranAmount;
   String BalAmount;
   String CurrentAmount;
   String TranType;
   String TransType;
   String DatePosted;

  PortalDetailedTransaction(
    this.id,
    this.RefNo,
    this.TranAmount,
    this.BalAmount,
    this.CurrentAmount,
    this.TranType,
    this.TransType,
    this.DatePosted,
  );

    factory PortalDetailedTransaction.fromJson(Map<String, dynamic> json) => _$PortalDetailedTransactionFromJson(json);

    Map<String, dynamic> toJson() => _$PortalDetailedTransactionToJson(this);
  

  @override
  String toString() {
    return 'PortalDetailedTransaction{ RefNo: $RefNo, TranAmount: $TranAmount, BalAmount: $BalAmount, CurrentAmount: $CurrentAmount, TranType: $TranType, TransType: $TransType, DatePosted: $DatePosted';
  }

  

}