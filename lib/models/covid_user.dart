import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/foundation.dart';
import 'package:json_annotation/json_annotation.dart';
part 'covid_user.g.dart';

@JsonSerializable()
class CovidUser {
  String userId;
  String omang;
  String name;
  String physicalAddress;

  CovidUser({
    required this.userId,
    required this.omang,
    required this.name,
    required this.physicalAddress,

});

  factory CovidUser.fromDocument(DocumentSnapshot snapshot) {

    String userId = "";
    String name = "";
    String aboutMe = "";

    try {
      name = snapshot.get("name");
      userId = snapshot.get("userId");
    } catch (e) {
      if (kDebugMode) {
        print(e);
      }
    }
    return CovidUser(omang:"12418975",name: name,userId: userId, physicalAddress: '123',);
  }

  factory CovidUser.fromJson(Map<String, dynamic> json) => _$CovidUserFromJson(json);
  Map<String, dynamic> toJson() => _$CovidUserToJson(this);
}

