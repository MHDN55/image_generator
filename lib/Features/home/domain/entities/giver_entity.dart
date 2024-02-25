// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'package:equatable/equatable.dart';

import '../../data/models/urls_model.dart';

class GiverEntity extends Equatable {
  final UrlsModel urls;
  const GiverEntity({
    required this.urls,
  });
  @override
  List<Object?> get props => [];
}
