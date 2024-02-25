import 'package:image_generator/Features/home/domain/entities/output_entity.dart';
import 'package:json_annotation/json_annotation.dart';

part 'output_model.g.dart';

@JsonSerializable()
class OutputModel extends OutputEntity {
  const OutputModel({required super.output});

  factory OutputModel.fromJson(Map<String, dynamic> json) =>
      _$OutputModelFromJson(json);

  Map<String, dynamic> toJson() => _$OutputModelToJson(this);
}
