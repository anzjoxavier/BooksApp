import 'package:http/http.dart' as http;

class BookServices{
  static  Future getBookData(String url) async {
    http.Response response = await http.get(
      Uri.parse(url),
    );
    return response.body;
  }
}