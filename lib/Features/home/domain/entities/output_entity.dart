// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'package:equatable/equatable.dart';

class OutputEntity extends Equatable {
  final List<String> output;
  const OutputEntity({
    required this.output,
  });
  @override
  List<Object?> get props => [output];
}
