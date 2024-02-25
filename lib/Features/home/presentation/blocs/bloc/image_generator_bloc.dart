import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:equatable/equatable.dart';
import 'package:image_generator/Features/home/data/models/output_model.dart';
import 'package:image_generator/Features/home/domain/usecases/get_image_use_case.dart';
import 'package:image_generator/core/error/failures.dart';
import 'package:injectable/injectable.dart';

import '../../../../../core/Strings/failures.dart';

part 'image_generator_event.dart';
part 'image_generator_state.dart';

@injectable
class ImageGeneratorBloc
    extends Bloc<ImageGeneratorEvent, ImageGeneratorState> {
  final GetImageUserCase getImage;
  ImageGeneratorBloc({
    required this.getImage,
  }) : super(const ImageGeneratorState(
          message: "",
          status: ImageGeneratorStatus.initial,
          image: OutputModel(output: []),
        )) {
    on<ImageGeneratorEvent>(
      (event, emit) async {
        if (event is GetImageEvent) {
          emit(state.copyWith(status: ImageGeneratorStatus.loading));

          final imageOrFailure = await getImage(event.text);
          emit(
            imageOrFailure.fold(
              (failure) => state.copyWith(
                status: ImageGeneratorStatus.error,
                message: _mapFailureToMessage(failure),
              ),
              (image) => state.copyWith(
                  status: ImageGeneratorStatus.loaded, image: image),
            ),
          );
        }
      },
    );
  }

  String _mapFailureToMessage(Failure failure) {
    switch (failure.runtimeType) {
      case ServerFailure:
        return SERVER_FAILURE_MESSAGE;
      case EmptyCacheFailure:
        return EMPTY_CACH_FAILURE_MESSAGE;
      case OfflineFailure:
        return OFFLINE_FAILURE_MESSAGE;
      default:
        return "Unexpected Error , please tey again later .";
    }
  }
}
