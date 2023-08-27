
import 'package:http/http.dart' as http;

class ApiService {
  final _baseUrl = 'https://www.googleapis.com/books/v1/';

  ApiService();
  Future<http.Response> get({required String endPoints}) async {
    Uri url = Uri.parse('$_baseUrl$endPoints');
    http.Response response = await http.get(url) ;

    return response;
  }
}
