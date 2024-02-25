// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'package:dartz/dartz.dart';
import 'package:injectable/injectable.dart';
import 'package:image_generator/Features/home/domain/repositories/image_generator_repositoies.dart';
import 'package:image_generator/core/error/failures.dart';
import '../../data/models/output_model.dart';

@LazySingleton()
class GetImageUserCase {
  ImageGeneratorRepository repository;
  GetImageUserCase({
    required this.repository,
  });
  Future<Either<Failure, OutputModel>> call(String text) async {
    return await repository.getImage(text);
  }
}
