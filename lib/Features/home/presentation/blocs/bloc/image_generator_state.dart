// ignore_for_file: public_member_api_docs, sort_constructors_first
part of 'image_generator_bloc.dart';

enum ImageGeneratorStatus { initial, loaded, loading, error }

class ImageGeneratorState extends Equatable {
  final ImageGeneratorStatus status;
  final String message;
  final OutputModel image;

  const ImageGeneratorState({
    required this.status,
    required this.message,
    required this.image,
  });

  @override
  List<Object> get props => [
        status,
        message,
        image,
      ];

  ImageGeneratorState copyWith({
    ImageGeneratorStatus? status,
    String? message,
    OutputModel? image,
  }) {
    return ImageGeneratorState(
      status: status ?? this.status,
      message: message ?? this.message,
      image: image ?? this.image,
    );
  }
}
