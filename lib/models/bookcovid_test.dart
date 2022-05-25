import 'package:json_annotation/json_annotation.dart';


@JsonSerializable()
class BookTest {
  String id;
  String covidTest;
  DateTime date;


  BookTest({
    required this.id,
    required this.covidTest,
    required this.date,
  });



  static BookTest fromJson(Map<String, dynamic> json)=> BookTest(
    id: json['id'],
    covidTest: json['covidTest'],
    date: json['date'],

  );
  Map<String, dynamic> toJSON() => {
    'id':id,
    'covidTest': covidTest,
    'date': date,
  };

}