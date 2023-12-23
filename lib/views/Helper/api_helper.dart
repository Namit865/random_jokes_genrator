import 'package:http/http.dart'as http;
import 'dart:convert';
class ApiService{
  static Future<Map<String,dynamic>> fetchJokes() async {

    final response = await http.get(Uri.parse('https://api.chucknorris.io/jokes/random'),);

    if(response.statusCode == 200){
      return json.decode(response.body);
    }
    else{
      throw Exception("Failed to Load");
    }
  }
}