import 'package:dartz/dartz.dart';
import '../../../../core/error/failures.dart';
import '../../data/models/output_model.dart';

abstract class ImageGeneratorRepository {
  Future<Either<Failure, OutputModel>> getImage(String text);
}
