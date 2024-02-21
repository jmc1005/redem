import 'package:freezed_annotation/freezed_annotation.dart';

import '../typedefs.dart';

part 'user.freezed.dart';
part 'user.g.dart';

@freezed
class User with _$User {
  const factory User(
    uuid,
    @JsonKey(name: 'first_name') firstName,
    @JsonKey(name: 'last_name') lastName,
    @JsonKey(name: 'profile_image') profileImage,
    @JsonKey(name: 'date_of_birth') dateOfBirth,
    sex,
    email,
    @JsonKey(name: 'user_type') userType,
    @JsonKey(name: 'is_active') isActive,
    @JsonKey(name: 'is_banned') isBanned,
    city,
    country,
  ) = _User;

  factory User.fromJson(Json json) => _$UserFromJson(json);
}

//String? imageProfileFromJson(Json json){}