import 'package:json_annotation/json_annotation.dart';


@JsonSerializable()
class ReportIncident {
  String id;
  String typeofincident;
  String description;


  ReportIncident({
    required this.id,
    required this.typeofincident,
    required this.description,
  });



  static ReportIncident fromJson(Map<String, dynamic> json)=> ReportIncident(
    id: json['id'],
    typeofincident: json['typeofincident'],
    description: json['description'],
  );
  Map<String, dynamic> toJSON() => {
    'id':id,
    'typeofincident':typeofincident,
    'description': description,
  };

}