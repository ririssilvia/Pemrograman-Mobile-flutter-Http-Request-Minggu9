import 'package:flutter/material.dart';
import 'package:minggu9/pages/movie_detail.dart';
import 'package:minggu9/service/http_service.dart';

class MovieList extends StatefulWidget {
  @override
  _MovieListState createState() => _MovieListState();
}

class _MovieListState extends State<MovieList> {
  int moviesCount;
  List movies;
  HttpService service;
  //modif
  String imgPath = 'https://image.tmdb.org/t/p/w500/';

  Future initialize() async {
    movies = [];
    movies = await service.getPopularMovies();
    setState(() {
      moviesCount = movies.length;
      movies = movies;
    });
  }

  @override
  void initState() {
    service = HttpService();
    initialize();
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.indigo[50],
      appBar: AppBar(
        elevation: .5,
        leading: IconButton(
          icon: Icon(Icons.menu),
          onPressed: () {},
        ),
        title: Text("Popular Movies"),
      ),

//       body: ListView.builder(
//         itemCount: (this.moviesCount == null) ? 0 : this.moviesCount,
//         itemBuilder: (context, int position) {
//       return Card(
//             color: Colors.white,
//             elevation: 2.0,
//             child: ListTile(
//               leading: Image.network('https://image.tmdb.org/t/p/w500/' +  movies[position].posterPath),
//               title: Text(movies[position].title,
//                style: TextStyle(
//                                   fontSize: 18,
//                                   fontWeight: FontWeight.w600
//                                   ),
//                                 ),
//               subtitle: Text( movies[position].voteAverage.toString(),
                
//               ),
//               //Untuk membuat perpindahan dari movie list ke movie detail buatlah onTap event di listview pada movie list
//               onTap: () {
//                 MaterialPageRoute route = MaterialPageRoute(
//                     builder: (_) => MovieDetail(movies[position]));
//                 Navigator.push(context, route);
//               },
//             ),
//           );
//         },
//       ),
//     );
//   }
// }
 body: GridView.builder(
          itemCount: (this.moviesCount == null) ? 0 : this.moviesCount,
          padding: const EdgeInsets.all(20),
         
          gridDelegate: new SliverGridDelegateWithFixedCrossAxisCount(
            crossAxisCount: 3,
            childAspectRatio: 2 / 3,
            mainAxisSpacing: 10.0,
            crossAxisSpacing: 20.0,
          ),
          itemBuilder: (context, int position) {
            return GridTile(
              child: InkResponse(
                enableFeedback: true,
                child: Image.network(
                  imgPath + movies[position].posterPath,
                  fit: BoxFit.cover,
                ),
                onTap: () {
                  MaterialPageRoute route = MaterialPageRoute(
                      builder: (_) => MovieDetail(movies[position]));
                  Navigator.push(context, route);
                },
              ),
            );
          }),
    );
  }
}