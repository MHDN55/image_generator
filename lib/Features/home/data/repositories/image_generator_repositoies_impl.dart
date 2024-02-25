// ignore_for_file: public_member_api_docs, sort_constructors_first, avoid_print
import 'package:dartz/dartz.dart';
import 'package:injectable/injectable.dart';

import 'package:image_generator/Features/home/data/datasources/image_generator_remote_data_source.dart';
import 'package:image_generator/core/error/failures.dart';
import 'package:image_generator/core/network/network_info.dart';

import '../../../../core/error/exceptions.dart';
import '../../domain/repositories/image_generator_repositoies.dart';
import '../models/output_model.dart';

@LazySingleton(as: ImageGeneratorRepository)
class ImageGeneratorRepositoryImpl implements ImageGeneratorRepository {
  final NetworkInfo networkInfo;
  final ImageGeneratorRemoteDataSource remoteDataSource;
  ImageGeneratorRepositoryImpl({
    required this.networkInfo,
    required this.remoteDataSource,
  });
  @override
  Future<Either<Failure, OutputModel>> getImage(String text) async {
    if (await networkInfo.isConnected) {
      try {
        final remotePost = await remoteDataSource.postGiver(text);

        await Future.delayed(const Duration(seconds: 3));

        final remoteGet = await remoteDataSource.getImage(remotePost);

        return Right(remoteGet);
      } on ServerException {
        return Left(ServerFailure());
      } catch (e) {
        print("==================== error =====================$e");

        return Left(ServerFailure());
      }
    }
    return Left(ServerFailure());
  }
}
