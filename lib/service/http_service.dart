import 'package:http/http.dart' as http;
import 'dart:io';

class HttpService {
  final String apiKey = '3550ae3a6a21a1e689239bb9e2df242d';
  final String baseUrl = 'https://api.themoviedb.org/3/movie/upcoming?api_key=';

  Future<String> getPopularMovies() async{
      final String uri = baseUrl + apiKey;

      http.Response result = await http.get(Uri.parse(uri));
      if(result.statusCode == HttpStatus.ok){
        print("Sukses");
        String response = result.body;
        return response;
      }else{
        print("Fail");
        return null;
      }
    }
}
