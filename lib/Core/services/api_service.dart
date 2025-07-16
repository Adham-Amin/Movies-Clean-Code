import 'package:dio/dio.dart';

class ApiService {
  final Dio _dio;
  final String _baseUrl = 'https://api.themoviedb.org/3';
  final String _token = 'eyJhbGciOiJIUzI1NiJ9.eyJhdWQiOiJjMzg4OTQ5ZGUyZDM5ZThhMDVmZmMwZWY5ODJkMGYzZCIsIm5iZiI6MTc1MjUxMDM3My44MSwic3ViIjoiNjg3NTJmYTU4MmZhOWFjYzM2ZjkxYTg1Iiwic2NvcGVzIjpbImFwaV9yZWFkIl0sInZlcnNpb24iOjF9.L46eolvrjS9ztFIoE5E5Ew0DxRqr_UqgJaC3MN70Qw4';

  ApiService(this._dio);

  Future<Map<String, dynamic>> get({required String endPoint}) async {
    final response = await _dio.get(
      '$_baseUrl$endPoint',
      options: Options(
        headers: {
          'Content-Type': 'application/json',
          'Authorization': 'Bearer $_token',
        },
      ),
    );
    return response.data;
  }
}
