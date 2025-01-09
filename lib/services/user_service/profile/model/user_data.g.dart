// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'user_data.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

UserData _$UserDataFromJson(Map<String, dynamic> json) => UserData(
      fullName: json['fullName'] as String,
      email: json['email'] as String,
      password: json['password'] as String,
      interest:
          (json['interest'] as List<dynamic>).map((e) => e as String).toList(),
      userName: json['userName'] as String?,
      dateOfBirth: json['dateOfBirth'] as String?,
      country: json['country'] as String?,
      language: json['language'] as String?,
      termsAndCondition: json['termsAndCondition'] as bool? ?? false,
    );

Map<String, dynamic> _$UserDataToJson(UserData instance) => <String, dynamic>{
      'userName': instance.userName,
      'fullName': instance.fullName,
      'email': instance.email,
      'password': instance.password,
      'dateOfBirth': instance.dateOfBirth,
      'country': instance.country,
      'language': instance.language,
      'termsAndCondition': instance.termsAndCondition,
      'interest': instance.interest,
    };
