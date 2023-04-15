import 'package:flutter/material.dart';
import 'package:movie_test/api/getapi.dart';
import 'package:movie_test/page/full/model/modelfull.dart';
import 'package:movie_test/page/full/view.dart';

class SearchView extends StatefulWidget {
  const SearchView({super.key});

  @override
  State<SearchView> createState() => _SearchViewState();
}

class _SearchViewState extends State<SearchView> {
  TextEditingController textControler = TextEditingController();
  late Future<List<dynamic>> searchFilmApi;
  String query = '';
  String img = 'http://image.tmdb.org/t/p/w500';

  @override
  void initState() {
    super.initState();
    searchFilmApi = searchFilm(query);
  }

  Future<void> refrest() async {
    setState(() {
      searchFilmApi = searchFilm(textControler.text.toString());
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Container(
          width: double.infinity,
          height: 40,
          decoration: BoxDecoration(
            color: Colors.white,
            borderRadius: BorderRadius.circular(5),
          ),
          child: Center(
            child: TextField(
              controller: textControler,
              decoration: InputDecoration(
                prefixIcon: const Icon(Icons.search),
                suffixIcon: IconButton(
                  icon: const Icon(Icons.clear),
                  onPressed: () {
                    setState(() {
                      textControler = TextEditingController(text: '');
                    });
                  },
                ),
                hintText: 'Search...',
                border: InputBorder.none,
              ),
              onChanged: (value) {
                setState(() {
                  textControler.addListener(() {
                    searchFilmApi = searchFilm(value);
                  });
                });
              },
              onSubmitted: (value) {
                setState(() {
                  textControler.addListener(() {
                    searchFilmApi = searchFilm(value);
                  });
                });
              },
              onEditingComplete: () {
                setState(() {
                  searchFilmApi = searchFilm(textControler.text.toString());
                });
              },
            ),
          ),
        ),
      ),
      body: textControler.text == ""
          ? Container()
          : SafeArea(
              child: FutureBuilder<List<dynamic>>(
                future: searchFilm(textControler.text.toString()),
                builder: (context, snapshot) {
                  if (snapshot.hasData) {
                    return RefreshIndicator(
                      onRefresh: refrest,
                      child: ListView.builder(
                        itemCount: snapshot.data!.length,
                        itemBuilder: ((context, index) {
                          return ListTile(
                            contentPadding: EdgeInsets.all(10),
                            leading: snapshot.data![index]['backdrop_path'] ==
                                    null
                                ? Image.network(
                                    'https://cdn0.iconfinder.com/data/icons/files-49/32/tn12_file_broken_warning_error_mistake_document_interface_-512.png',
                                  )
                                : Image.network(
                                    img +
                                        snapshot.data![index]['backdrop_path']
                                            .toString(),
                                  ),
                            title: snapshot.data![index]['title'] == null
                                ? Text(
                                    'kesalahan dari api title tidak terdetect',
                                  )
                                : Text(
                                    snapshot.data![index]['title'].toString(),
                                  ),
                            onTap: () {
                              if (snapshot.data![index]['title'] == null) {
                                showDialog(
                                    context: context,
                                    builder: (context) {
                                      return AlertDialog(
                                        actions: [
                                          TextButton(
                                            child: const Text('Close'),
                                            onPressed: () {
                                              Navigator.of(context).pop();
                                            },
                                          ),
                                        ],
                                        title: Text('ERROR'),
                                        content: Container(
                                          height: 200,
                                          child: Column(
                                            children: [
                                              Image.network(
                                                  'https://images.bisnis.com/posts/2019/12/08/1178963/images-600x400.jpeg'),
                                              SizedBox(
                                                height: 5,
                                              ),
                                              Text(
                                                  'ID Film Tidak Ditemukan / kesalahan dari Api'),
                                            ],
                                          ),
                                        ),
                                      );
                                    });
                              } else {
                                Navigator.of(context).push(
                                  MaterialPageRoute(
                                    builder: (context) => FullVuiew(
                                      id: snapshot.data![index]['id'],
                                      title: snapshot.data![index]['title']
                                          .toString(),
                                    ),
                                  ),
                                );
                              }
                            },
                          );
                        }),
                      ),
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
