import 'package:floor/floor.dart';
import 'package:json_annotation/json_annotation.dart';

part 'make_a_pledge_request_model.g.dart';

@JsonSerializable()
class PortalMakeAPledge {
  String StudentID;
  String FeeName;
  String Amount;
  String TermID;
  String YearFor;
  String DrCr;
  //String StaffID;
  String PostQb;
  String CustomFeeRemarks;
  String ChurchCode;

  PortalMakeAPledge(
    this.StudentID,
    this.FeeName,
    this.Amount,
    this.TermID,
    this.YearFor,
    this.DrCr,
    //this.StaffID,
    this.PostQb,
    this.CustomFeeRemarks,
    this.ChurchCode,
  );

  factory PortalMakeAPledge.fromJson(Map<String,dynamic> json) => _$PortalMakeAPledgeFromJson(json);

  Map<String,dynamic> toJson() => _$PortalMakeAPledgeToJson(this);

  @override
  String toString() {
    return 'PortalMakeAPledge(StudentID: $StudentID, FeeName: $FeeName, Amount: $Amount, TermID: $TermID, YearFor: $YearFor, DrCr: $DrCr, PostQb: $PostQb, CustomFeeRemarks: $CustomFeeRemarks, ChurchCode: $ChurchCode)';
  }
}
