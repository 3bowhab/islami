import 'package:dio/dio.dart';
import 'package:islami/data/api/api_end_points.dart';
import 'package:islami/data/models/adhan_model/adhan_model.dart';
import 'package:islami/data/models/api_error/api_error.dart';
import 'package:islami/data/models/radio_model/radio_model.dart';

class ApiManager {
  final dio = Dio(
    BaseOptions(
      connectTimeout: const Duration(seconds: 10),
      receiveTimeout: const Duration(seconds: 10),
    ),
  );

  Future<RadioModel> getRadioData() async {
    try {
      final response = await dio.get(
        ApiEndPoints.getRadioData,
      );
      return RadioModel.fromJson(response.data);
    } on DioException catch (e) {
      if (e.response?.data != null) {
        final apiError = ApiError.fromJson(e.response!.data);
        throw Exception(apiError.message ?? 'Unknown Error from Server');
      } else {
        throw Exception(e.message ?? 'Network Error');
      }
    } catch (e) {
      throw Exception('Unknown Error: $e');
    }
  }

  Future<AdhanModel> getAdhanData() async {
    try {
      final response = await dio.get(ApiEndPoints.getAdhanData);
      return AdhanModel.fromJson(response.data);
    } on DioException catch (e) {
      if (e.response?.data != null) {
        final apiError = ApiError.fromJson(e.response!.data);
        throw Exception(apiError.message ?? 'Unknown Error from Server');
      } else {
        throw Exception(e.message ?? 'Network Error');
      }
    } catch (e) {
      throw Exception('Unknown Error: $e');
    }
  }
}
