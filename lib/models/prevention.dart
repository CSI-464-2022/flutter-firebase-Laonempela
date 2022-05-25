import 'package:json_annotation/json_annotation.dart';


@JsonSerializable()
class PreventionCard {
  late final String svgSrc;
  late final String title;



  PreventionCard({
    required this.svgSrc,
    required this.title,
  });
}