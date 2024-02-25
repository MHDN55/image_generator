// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'output_model.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

OutputModel _$OutputModelFromJson(Map<String, dynamic> json) => OutputModel(
      output:
          (json['output'] as List<dynamic>).map((e) => e as String).toList(),
    );

Map<String, dynamic> _$OutputModelToJson(OutputModel instance) =>
    <String, dynamic>{
      'output': instance.output,
    };
