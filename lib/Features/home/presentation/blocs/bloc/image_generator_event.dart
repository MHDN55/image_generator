// ignore_for_file: public_member_api_docs, sort_constructors_first
part of 'image_generator_bloc.dart';

class ImageGeneratorEvent extends Equatable {
  const ImageGeneratorEvent();

  @override
  List<Object> get props => [];
}

class GetImageEvent extends ImageGeneratorEvent {
  final String text;
  const GetImageEvent({
    required this.text,
  });
  @override
  List<Object> get props => [text];
}
