// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'symptom.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_$SymptomImpl _$$SymptomImplFromJson(Map<String, dynamic> json) =>
    _$SymptomImpl(
      json['uuid'],
      json['name'],
      json['is_active'],
      json['scale'],
      json['create_at'],
    );

Map<String, dynamic> _$$SymptomImplToJson(_$SymptomImpl instance) =>
    <String, dynamic>{
      'uuid': instance.uuid,
      'name': instance.name,
      'is_active': instance.isActive,
      'scale': instance.scale,
      'create_at': instance.createAt,
    };
