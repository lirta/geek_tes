import 'package:http/http.dart' as http;

class ApiHelper {
  final String baseUrl = "https://fakestoreapi.com";

  Future getProducts() async {
    var response = await http.get(Uri.parse("$baseUrl/products"));
    return response;
  }
}
