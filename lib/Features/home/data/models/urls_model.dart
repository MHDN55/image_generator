import 'package:json_annotation/json_annotation.dart';

import '../../domain/entities/url_model.dart';

part 'urls_model.g.dart';

@JsonSerializable()
class UrlsModel extends UrlsEntity {
  const UrlsModel({required super.get});

  factory UrlsModel.fromJson(Map<String, dynamic> json) =>
      _$UrlsModelFromJson(json);

  Map<String, dynamic> toJson() => _$UrlsModelToJson(this);
}
