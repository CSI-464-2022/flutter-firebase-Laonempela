// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'covid_user.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

CovidUser _$CovidUserFromJson(Map<String, dynamic> json) => CovidUser(
      userId: json['userId'] as String,
      omang: json['omang'] as String,
      name: json['name'] as String,
      physicalAddress: json['physicalAddress'] as String,

    );

Map<String, dynamic> _$CovidUserToJson(CovidUser instance) => <String, dynamic>{
      'userId': instance.userId,
      'omang': instance.omang,
      'name': instance.name,
      'physicalAddress': instance.physicalAddress,
    };
