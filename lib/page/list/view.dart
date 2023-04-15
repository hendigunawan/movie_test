import 'package:flutter/material.dart';
import 'package:movie_test/api/getapi.dart';
import 'package:movie_test/page/full/view.dart';
import 'package:movie_test/helper/cardwidget.dart';

class ListViewMovie extends StatefulWidget {
  const ListViewMovie({super.key});

  @override
  State<ListViewMovie> createState() => _ListViewState();
}

class _ListViewState extends State<ListViewMovie> {
  late Future<List<dynamic>> filmListApi;
  String page = '1';
  String img = 'http://image.tmdb.org/t/p/w500';

  @override
  void initState() {
    super.initState();
    filmListApi = getListFilm(page);
  }

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Padding(
        padding: const EdgeInsets.all(8.0),
        child: FutureBuilder<List<dynamic>>(
          future: getListFilm(page),
          builder: (context, snapshot) {
            if (snapshot.hasData) {
              return GridView.builder(
                gridDelegate: const SliverGridDelegateWithMaxCrossAxisExtent(
                  maxCrossAxisExtent: 200,
                  childAspectRatio: 4 / 5,
                  crossAxisSpacing: 20,
                  mainAxisSpacing: 20,
                ),
                itemCount: snapshot.data!.length,
                itemBuilder: (context, index) {
                  return CardGrid(
                    title: snapshot.data![index]['title'],
                    logo: img + snapshot.data![index]['poster_path'],
                    rating: snapshot.data![index]['vote_average'].toString(),
                    onPress: () {
                      print(snapshot.data![index]['id']);
                      Navigator.of(context).push(
                        MaterialPageRoute(
                          builder: (BuildContext context) => FullVuiew(
                            title: snapshot.data![index]['title'],
                            id: snapshot.data![index]['id'],
                          ),
                        ),
                      );

                      // getDetailFilm(snapshot.data![index]['id']);
                    },
                  );
                },
              );
            } else {
              return Center(
                child: CircularProgressIndicator(),
              );
            }
          },
        ),
      ),
    );
  }
}
