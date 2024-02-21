// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'user.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_$UserImpl _$$UserImplFromJson(Map<String, dynamic> json) => _$UserImpl(
      json['uuid'],
      json['first_name'],
      json['last_name'],
      json['profile_image'],
      json['date_of_birth'],
      json['sex'],
      json['email'],
      json['user_type'],
      json['is_active'],
      json['is_banned'],
      json['city'],
      json['country'],
    );

Map<String, dynamic> _$$UserImplToJson(_$UserImpl instance) =>
    <String, dynamic>{
      'uuid': instance.uuid,
      'first_name': instance.firstName,
      'last_name': instance.lastName,
      'profile_image': instance.profileImage,
      'date_of_birth': instance.dateOfBirth,
      'sex': instance.sex,
      'email': instance.email,
      'user_type': instance.userType,
      'is_active': instance.isActive,
      'is_banned': instance.isBanned,
      'city': instance.city,
      'country': instance.country,
    };
