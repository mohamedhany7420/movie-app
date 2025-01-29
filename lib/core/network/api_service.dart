import 'package:dio/dio.dart';
import 'package:movies_app/core/network/api_constants.dart';

class ApiService{
  ApiService(this.dio);
  final Dio dio;
  Future<Map<String,dynamic>> get({required endpoint}) async{
    var response = await dio.get('${ApiConstants.baseUrl}$endpoint${ApiConstants.apiKey}');
    return response.data;
  }
}