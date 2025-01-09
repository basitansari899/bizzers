import 'package:json_annotation/json_annotation.dart';

part 'user_data.g.dart';

@JsonSerializable()
class UserData {
  final String? userName;
  final String fullName;
  final String email;
  final String password;
  final String? dateOfBirth;
  final String? country;
  final String? language;
  final bool termsAndCondition;
  final List<String> interest;

  const UserData({
    required this.fullName,
    required this.email,
    required this.password,
    required this.interest,
    this.userName,
    this.dateOfBirth,
    this.country,
    this.language,
    this.termsAndCondition = false,
  });

  factory UserData.fromJson(Map<String, dynamic> json) => _$UserDataFromJson(json);
  Map<String, dynamic> toJson() => _$UserDataToJson(this);
}
