import 'package:image_generator/Features/home/domain/entities/giver_entity.dart';
import 'package:json_annotation/json_annotation.dart';

import 'urls_model.dart';


part 'giver_model.g.dart';

@JsonSerializable()
class GiverModel extends GiverEntity {
  const GiverModel({required super.urls});

  factory GiverModel.fromJson(Map<String,dynamic> json ) => _$GiverModelFromJson(json);

  Map<String,dynamic> toJson() => _$GiverModelToJson(this);
}
