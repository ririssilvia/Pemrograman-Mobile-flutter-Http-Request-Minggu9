//class movie lengkap dengan variabel dan construktor
class Movie {
  int id;
  String title;
  double voteAverage;
  String overview;
  String posterPath;

  Movie(this.id, this.title, this.voteAverage, this.overview, this.posterPath);

  //function untuk mengkonversi json menjadi response yang sesuai dengan class movie
  Movie.fromJson(Map<String, dynamic> parsedJson) {
    this.id = parsedJson['id'];
    this.title = parsedJson['title'];
    this.voteAverage = parsedJson['vote_average'] * 1.0;
    this.overview = parsedJson['overview'];
    this.posterPath = parsedJson['poster_path'];
  }
}