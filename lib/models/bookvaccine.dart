import 'package:json_annotation/json_annotation.dart';


@JsonSerializable()
class BookVaccine {
  String id;
  String vaccine;
  DateTime date;


  BookVaccine({
    required this.id,
    required this.vaccine,
    required this.date,
  });



  static BookVaccine fromJson(Map<String, dynamic> json)=> BookVaccine(
    id: json['id'],
    vaccine: json['vaccine'],
    date: json['date'],

  );
  Map<String, dynamic> toJSON() => {
    'id':id,
    'vaccine': vaccine,
    'date': date,
  };

}