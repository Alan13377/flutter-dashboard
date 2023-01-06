import 'package:admin_dashboard/services/local_storage.dart';
import 'package:dio/dio.dart';

class CafeApi {
  static final Dio _dio = Dio();
  static void configureDio() {
    //*Base Url
    _dio.options.baseUrl = "https://backend-flutter-web.vercel.app/api";

    //**Configurar Headers */
    _dio.options.headers = {
      "x-token": LocalStorage.prefs.getString("token") ?? ""
    };
  }

  //***GET */
  static Future httpGet(String path) async {
    try {
      final response = await _dio.get(path);

      return response.data;
    } catch (e) {
      print(e);
      throw ("Error en la peticion GET");
    }
  }

  //**Peticion POST */
  static Future httpPost(String path, Map<String, dynamic> data) async {
    final FormData formData = FormData.fromMap(data);
    try {
      final response = await _dio.post(path, data: formData);
      return response.data;
    } catch (e) {
      print(e);
      throw ("Error en la peticion POST");
    }
  }
}
