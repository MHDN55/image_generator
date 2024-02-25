// ignore_for_file: avoid_print

import 'dart:convert';

import 'package:dio/dio.dart';
import 'package:image_generator/Features/home/data/models/giver_model.dart';
import 'package:injectable/injectable.dart';
import '../../../../core/error/exceptions.dart';
import '../models/output_model.dart';

abstract class ImageGeneratorRemoteDataSource {
  Future<OutputModel> getImage(GiverModel giverModel);
  Future<GiverModel> postGiver(String text);
}

@LazySingleton(as: ImageGeneratorRemoteDataSource)
class ImageGeneratorRemoteDataSourceImpl
    implements ImageGeneratorRemoteDataSource {
  final Dio dio;
  ImageGeneratorRemoteDataSourceImpl({
    required this.dio,
  });

  Map<String, String> headers = {
    'Authorization': 'Token r8_6sXMH7IlmvUQ2oNBZiWkHTtnYByjmsW2dLy6t',
    'Content-Type': 'application/json'
  };

  @override
  Future<GiverModel> postGiver(String text) async {
    String data = jsonEncode(
      {
        "version":
            "ac732df83cea7fff18b8472768c88ad041fa750ff7682a21affe81863cbe77e4",
        "input": {
          "width": 768,
          "height": 768,
          "prompt": text,
          "scheduler": "K_EULER",
          "num_outputs": 1,
          "guidance_scale": 7.5,
          "num_inference_steps": 50
        }
      },
    );

    Response response = await dio.request(
      'https://api.replicate.com/v1/predictions?prompt=$text',
      options: Options(
        method: 'POST',
        headers: headers,
      ),
      data: data,
    );

    if (response.statusCode == 201) {
      final GiverModel giverModel = GiverModel.fromJson(response.data);

      return giverModel;
    } else {
      throw ServerException();
    }
  }

  @override
  Future<OutputModel> getImage(GiverModel giverModel) async {
    String url = giverModel.urls.get;

 
    var secondResponse = await dio.request(
      url,
      options: Options(
        method: 'GET',
        headers: headers,
      ),
    );

    print(secondResponse.data);

    if (secondResponse.statusCode == 200) {
      OutputModel outputModel = OutputModel.fromJson(secondResponse.data);

      print("======================${outputModel.output[0]}");

      return outputModel;
    } else {
      throw ServerException();
    }
  }
}
