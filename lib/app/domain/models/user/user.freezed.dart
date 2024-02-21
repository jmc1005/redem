// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'user.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#adding-getters-and-methods-to-our-models');

User _$UserFromJson(Map<String, dynamic> json) {
  return _User.fromJson(json);
}

/// @nodoc
mixin _$User {
  dynamic get uuid => throw _privateConstructorUsedError;
  @JsonKey(name: 'first_name')
  dynamic get firstName => throw _privateConstructorUsedError;
  @JsonKey(name: 'last_name')
  dynamic get lastName => throw _privateConstructorUsedError;
  @JsonKey(name: 'profile_image')
  dynamic get profileImage => throw _privateConstructorUsedError;
  @JsonKey(name: 'date_of_birth')
  dynamic get dateOfBirth => throw _privateConstructorUsedError;
  dynamic get sex => throw _privateConstructorUsedError;
  dynamic get email => throw _privateConstructorUsedError;
  @JsonKey(name: 'user_type')
  dynamic get userType => throw _privateConstructorUsedError;
  @JsonKey(name: 'is_active')
  dynamic get isActive => throw _privateConstructorUsedError;
  @JsonKey(name: 'is_banned')
  dynamic get isBanned => throw _privateConstructorUsedError;
  dynamic get city => throw _privateConstructorUsedError;
  dynamic get country => throw _privateConstructorUsedError;

  Map<String, dynamic> toJson() => throw _privateConstructorUsedError;
  @JsonKey(ignore: true)
  $UserCopyWith<User> get copyWith => throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $UserCopyWith<$Res> {
  factory $UserCopyWith(User value, $Res Function(User) then) =
      _$UserCopyWithImpl<$Res, User>;
  @useResult
  $Res call(
      {dynamic uuid,
      @JsonKey(name: 'first_name') dynamic firstName,
      @JsonKey(name: 'last_name') dynamic lastName,
      @JsonKey(name: 'profile_image') dynamic profileImage,
      @JsonKey(name: 'date_of_birth') dynamic dateOfBirth,
      dynamic sex,
      dynamic email,
      @JsonKey(name: 'user_type') dynamic userType,
      @JsonKey(name: 'is_active') dynamic isActive,
      @JsonKey(name: 'is_banned') dynamic isBanned,
      dynamic city,
      dynamic country});
}

/// @nodoc
class _$UserCopyWithImpl<$Res, $Val extends User>
    implements $UserCopyWith<$Res> {
  _$UserCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? uuid = freezed,
    Object? firstName = freezed,
    Object? lastName = freezed,
    Object? profileImage = freezed,
    Object? dateOfBirth = freezed,
    Object? sex = freezed,
    Object? email = freezed,
    Object? userType = freezed,
    Object? isActive = freezed,
    Object? isBanned = freezed,
    Object? city = freezed,
    Object? country = freezed,
  }) {
    return _then(_value.copyWith(
      uuid: freezed == uuid
          ? _value.uuid
          : uuid // ignore: cast_nullable_to_non_nullable
              as dynamic,
      firstName: freezed == firstName
          ? _value.firstName
          : firstName // ignore: cast_nullable_to_non_nullable
              as dynamic,
      lastName: freezed == lastName
          ? _value.lastName
          : lastName // ignore: cast_nullable_to_non_nullable
              as dynamic,
      profileImage: freezed == profileImage
          ? _value.profileImage
          : profileImage // ignore: cast_nullable_to_non_nullable
              as dynamic,
      dateOfBirth: freezed == dateOfBirth
          ? _value.dateOfBirth
          : dateOfBirth // ignore: cast_nullable_to_non_nullable
              as dynamic,
      sex: freezed == sex
          ? _value.sex
          : sex // ignore: cast_nullable_to_non_nullable
              as dynamic,
      email: freezed == email
          ? _value.email
          : email // ignore: cast_nullable_to_non_nullable
              as dynamic,
      userType: freezed == userType
          ? _value.userType
          : userType // ignore: cast_nullable_to_non_nullable
              as dynamic,
      isActive: freezed == isActive
          ? _value.isActive
          : isActive // ignore: cast_nullable_to_non_nullable
              as dynamic,
      isBanned: freezed == isBanned
          ? _value.isBanned
          : isBanned // ignore: cast_nullable_to_non_nullable
              as dynamic,
      city: freezed == city
          ? _value.city
          : city // ignore: cast_nullable_to_non_nullable
              as dynamic,
      country: freezed == country
          ? _value.country
          : country // ignore: cast_nullable_to_non_nullable
              as dynamic,
    ) as $Val);
  }
}

/// @nodoc
abstract class _$$UserImplCopyWith<$Res> implements $UserCopyWith<$Res> {
  factory _$$UserImplCopyWith(
          _$UserImpl value, $Res Function(_$UserImpl) then) =
      __$$UserImplCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call(
      {dynamic uuid,
      @JsonKey(name: 'first_name') dynamic firstName,
      @JsonKey(name: 'last_name') dynamic lastName,
      @JsonKey(name: 'profile_image') dynamic profileImage,
      @JsonKey(name: 'date_of_birth') dynamic dateOfBirth,
      dynamic sex,
      dynamic email,
      @JsonKey(name: 'user_type') dynamic userType,
      @JsonKey(name: 'is_active') dynamic isActive,
      @JsonKey(name: 'is_banned') dynamic isBanned,
      dynamic city,
      dynamic country});
}

/// @nodoc
class __$$UserImplCopyWithImpl<$Res>
    extends _$UserCopyWithImpl<$Res, _$UserImpl>
    implements _$$UserImplCopyWith<$Res> {
  __$$UserImplCopyWithImpl(_$UserImpl _value, $Res Function(_$UserImpl) _then)
      : super(_value, _then);

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? uuid = freezed,
    Object? firstName = freezed,
    Object? lastName = freezed,
    Object? profileImage = freezed,
    Object? dateOfBirth = freezed,
    Object? sex = freezed,
    Object? email = freezed,
    Object? userType = freezed,
    Object? isActive = freezed,
    Object? isBanned = freezed,
    Object? city = freezed,
    Object? country = freezed,
  }) {
    return _then(_$UserImpl(
      freezed == uuid ? _value.uuid! : uuid,
      freezed == firstName ? _value.firstName! : firstName,
      freezed == lastName ? _value.lastName! : lastName,
      freezed == profileImage ? _value.profileImage! : profileImage,
      freezed == dateOfBirth ? _value.dateOfBirth! : dateOfBirth,
      freezed == sex ? _value.sex! : sex,
      freezed == email ? _value.email! : email,
      freezed == userType ? _value.userType! : userType,
      freezed == isActive ? _value.isActive! : isActive,
      freezed == isBanned ? _value.isBanned! : isBanned,
      freezed == city ? _value.city! : city,
      freezed == country ? _value.country! : country,
    ));
  }
}

/// @nodoc
@JsonSerializable()
class _$UserImpl implements _User {
  const _$UserImpl(
      this.uuid,
      @JsonKey(name: 'first_name') this.firstName,
      @JsonKey(name: 'last_name') this.lastName,
      @JsonKey(name: 'profile_image') this.profileImage,
      @JsonKey(name: 'date_of_birth') this.dateOfBirth,
      this.sex,
      this.email,
      @JsonKey(name: 'user_type') this.userType,
      @JsonKey(name: 'is_active') this.isActive,
      @JsonKey(name: 'is_banned') this.isBanned,
      this.city,
      this.country);

  factory _$UserImpl.fromJson(Map<String, dynamic> json) =>
      _$$UserImplFromJson(json);

  @override
  final dynamic uuid;
  @override
  @JsonKey(name: 'first_name')
  final dynamic firstName;
  @override
  @JsonKey(name: 'last_name')
  final dynamic lastName;
  @override
  @JsonKey(name: 'profile_image')
  final dynamic profileImage;
  @override
  @JsonKey(name: 'date_of_birth')
  final dynamic dateOfBirth;
  @override
  final dynamic sex;
  @override
  final dynamic email;
  @override
  @JsonKey(name: 'user_type')
  final dynamic userType;
  @override
  @JsonKey(name: 'is_active')
  final dynamic isActive;
  @override
  @JsonKey(name: 'is_banned')
  final dynamic isBanned;
  @override
  final dynamic city;
  @override
  final dynamic country;

  @override
  String toString() {
    return 'User(uuid: $uuid, firstName: $firstName, lastName: $lastName, profileImage: $profileImage, dateOfBirth: $dateOfBirth, sex: $sex, email: $email, userType: $userType, isActive: $isActive, isBanned: $isBanned, city: $city, country: $country)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$UserImpl &&
            const DeepCollectionEquality().equals(other.uuid, uuid) &&
            const DeepCollectionEquality().equals(other.firstName, firstName) &&
            const DeepCollectionEquality().equals(other.lastName, lastName) &&
            const DeepCollectionEquality()
                .equals(other.profileImage, profileImage) &&
            const DeepCollectionEquality()
                .equals(other.dateOfBirth, dateOfBirth) &&
            const DeepCollectionEquality().equals(other.sex, sex) &&
            const DeepCollectionEquality().equals(other.email, email) &&
            const DeepCollectionEquality().equals(other.userType, userType) &&
            const DeepCollectionEquality().equals(other.isActive, isActive) &&
            const DeepCollectionEquality().equals(other.isBanned, isBanned) &&
            const DeepCollectionEquality().equals(other.city, city) &&
            const DeepCollectionEquality().equals(other.country, country));
  }

  @JsonKey(ignore: true)
  @override
  int get hashCode => Object.hash(
      runtimeType,
      const DeepCollectionEquality().hash(uuid),
      const DeepCollectionEquality().hash(firstName),
      const DeepCollectionEquality().hash(lastName),
      const DeepCollectionEquality().hash(profileImage),
      const DeepCollectionEquality().hash(dateOfBirth),
      const DeepCollectionEquality().hash(sex),
      const DeepCollectionEquality().hash(email),
      const DeepCollectionEquality().hash(userType),
      const DeepCollectionEquality().hash(isActive),
      const DeepCollectionEquality().hash(isBanned),
      const DeepCollectionEquality().hash(city),
      const DeepCollectionEquality().hash(country));

  @JsonKey(ignore: true)
  @override
  @pragma('vm:prefer-inline')
  _$$UserImplCopyWith<_$UserImpl> get copyWith =>
      __$$UserImplCopyWithImpl<_$UserImpl>(this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$$UserImplToJson(
      this,
    );
  }
}

abstract class _User implements User {
  const factory _User(
      final dynamic uuid,
      @JsonKey(name: 'first_name') final dynamic firstName,
      @JsonKey(name: 'last_name') final dynamic lastName,
      @JsonKey(name: 'profile_image') final dynamic profileImage,
      @JsonKey(name: 'date_of_birth') final dynamic dateOfBirth,
      final dynamic sex,
      final dynamic email,
      @JsonKey(name: 'user_type') final dynamic userType,
      @JsonKey(name: 'is_active') final dynamic isActive,
      @JsonKey(name: 'is_banned') final dynamic isBanned,
      final dynamic city,
      final dynamic country) = _$UserImpl;

  factory _User.fromJson(Map<String, dynamic> json) = _$UserImpl.fromJson;

  @override
  dynamic get uuid;
  @override
  @JsonKey(name: 'first_name')
  dynamic get firstName;
  @override
  @JsonKey(name: 'last_name')
  dynamic get lastName;
  @override
  @JsonKey(name: 'profile_image')
  dynamic get profileImage;
  @override
  @JsonKey(name: 'date_of_birth')
  dynamic get dateOfBirth;
  @override
  dynamic get sex;
  @override
  dynamic get email;
  @override
  @JsonKey(name: 'user_type')
  dynamic get userType;
  @override
  @JsonKey(name: 'is_active')
  dynamic get isActive;
  @override
  @JsonKey(name: 'is_banned')
  dynamic get isBanned;
  @override
  dynamic get city;
  @override
  dynamic get country;
  @override
  @JsonKey(ignore: true)
  _$$UserImplCopyWith<_$UserImpl> get copyWith =>
      throw _privateConstructorUsedError;
}
