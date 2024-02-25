import 'package:equatable/equatable.dart';

class UrlsEntity extends Equatable {
  final String get;
  const UrlsEntity({
    required this.get,
  });
  @override
  List<Object?> get props => [get];
}
