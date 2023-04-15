import 'package:flutter/material.dart';
import 'package:line_icons/line_icons.dart';
import 'package:movie_test/api/getapi.dart';
import 'package:movie_test/helper/masage.dart';
import 'package:movie_test/page/full/model/modelfull.dart';

class FullVuiew extends StatefulWidget {
  const FullVuiew({super.key, required this.title, required this.id});
  final String title;
  final int id;

  @override
  State<FullVuiew> createState() => _FullVuiewState();
}

class _FullVuiewState extends State<FullVuiew> {
  late Future<FullDetailMovie> filmFullApi;
  late Future<Status> masageStatus;
  late Future<List<dynamic>> reviewMovieApi;
  late Future<List<dynamic>> creditMovieApi;
  String img = 'http://image.tmdb.org/t/p/w500';

  @override
  void initstate() {
    super.initState();
    filmFullApi = getDetailFilm(widget.id);
    masageStatus = addWishList(widget.id.toString());
    reviewMovieApi = getReviewFilm(widget.id.toString());
    creditMovieApi = getReviewFilm(widget.id.toString());

    print(widget.id);
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(widget.title),
        actions: [
          GestureDetector(
            child: Icon(LineIcons.heart),
            onTap: () async {
              await addWishList(widget.id.toString());
              // ignore: use_build_context_synchronously
              showDialog(
                context: context,
                builder: (context) {
                  return AlertDialog(
                    title: Text('Add Berhasil'),
                    content: Text(
                      'Movie ${widget.title} Berhasil Ditambahkan!!',
                    ),
                    actions: [
                      TextButton(
                        child: const Text('Close'),
                        onPressed: () {
                          Navigator.of(context).pop();
                        },
                      ),
                      // TextButton(
                      //   child: const Text('Cek List'),
                      //   onPressed: () {
                      //     Navigator.of(context).pus;
                      //   },
                      // ),
                    ],
                  );
                },
              );
            },
          ),
          SizedBox(
            width: 5,
          ),
        ],
      ),
      body: SafeArea(
        child: Padding(
          padding: EdgeInsets.all(0),
          child: FutureBuilder<FullDetailMovie>(
            future: getDetailFilm(widget.id),
            builder: (context, snapshot) {
              if (snapshot.hasData) {
                return ListView(
                  children: [
                    Column(
                      // mainAxisSize: MainAxisSize.min,
                      children: [
                        Container(
                          height: 280,
                          child: Stack(
                            // fit: StackFit.expand,
                            clipBehavior: Clip.none,
                            children: [
                              ClipRRect(
                                borderRadius: const BorderRadius.only(
                                  bottomLeft: Radius.circular(10),
                                  bottomRight: Radius.circular(10),
                                ),
                                child: Image.network(
                                  img + snapshot.data!.backdropPath.toString(),
                                ),
                              ),
                              Positioned(
                                top: 130,
                                left: 20,
                                child: Row(
                                  crossAxisAlignment: CrossAxisAlignment.end,
                                  children: [
                                    ClipRRect(
                                      borderRadius: BorderRadius.circular(10),
                                      child: Image.network(
                                        img +
                                            snapshot.data!.posterPath
                                                .toString(),
                                        fit: BoxFit.fill,
                                        width: 90,
                                        height: 130,
                                      ),
                                    ),
                                    SizedBox(
                                      width: 10,
                                    ),
                                    Container(
                                      width: MediaQuery.of(context).size.width *
                                          0.5 /
                                          0.9,
                                      child: Text(
                                        snapshot.data!.title.toString(),
                                        style: TextStyle(
                                          fontSize: 25,
                                          fontWeight: FontWeight.bold,
                                        ),
                                        maxLines: 2,
                                      ),
                                    )
                                  ],
                                ),
                              ),
                              Positioned(
                                right: 5,
                                bottom: 84,
                                child: Container(
                                  height: 40,
                                  width: 90,
                                  decoration: const BoxDecoration(
                                    color: Color.fromARGB(153, 37, 37, 37),
                                    borderRadius:
                                        BorderRadius.all(Radius.circular(20)),
                                  ),
                                  child: Padding(
                                    padding: const EdgeInsets.all(8.0),
                                    child: Center(
                                      child: Row(
                                        children: <Widget>[
                                          const Icon(
                                            LineIcons.star,
                                            color: Color(0xffffd700),
                                          ),
                                          const SizedBox(
                                            width: 10,
                                          ),
                                          Text(
                                            snapshot.data!.voteAverage
                                                .toString(),
                                            style: const TextStyle(
                                              fontSize: 15,
                                              color: Color(0xffffd700),
                                            ),
                                          ),
                                        ],
                                      ),
                                    ),
                                  ),
                                ),
                              ),
                            ],
                          ),
                        ),
                        Row(
                          mainAxisAlignment: MainAxisAlignment.center,
                          // crossAxisAlignment: CrossAxisAlignment.stretch,
                          children: [
                            Icon(LineIcons.box),
                            SizedBox(
                              width: 4,
                            ),
                            Text(
                              snapshot.data!.releaseDate.toString(),
                            ),
                            SizedBox(
                              width: 10,
                            ),
                            Container(
                              height: 25,
                              width: 1,
                              decoration: BoxDecoration(
                                color: Colors.black45,
                                border: Border(
                                  right: BorderSide(),
                                ),
                              ),
                            ),
                            SizedBox(
                              width: 10,
                            ),
                            Icon(LineIcons.clock),
                            SizedBox(
                              width: 4,
                            ),
                            Text(
                              '${snapshot.data!.runtime} Minutes',
                            ),
                            SizedBox(
                              width: 10,
                            ),
                            Container(
                              height: 25,
                              width: 1,
                              decoration: BoxDecoration(
                                color: Colors.black45,
                                border: Border(
                                  right: BorderSide(),
                                ),
                              ),
                            ),
                            SizedBox(
                              width: 10,
                            ),
                            Icon(LineIcons.language),
                            SizedBox(
                              width: 4,
                            ),
                            Text(
                              snapshot.data!.originalLanguage.toString(),
                            ),
                          ],
                        ),
                        SizedBox(
                          height: 15,
                        ),
                        Container(
                          height: 42,
                          child: SingleChildScrollView(
                            scrollDirection: Axis.horizontal,
                            child: ListView.builder(
                              scrollDirection: Axis.horizontal,
                              shrinkWrap: true,
                              itemCount: snapshot.data!.genres!.length,
                              itemBuilder: (context, index) {
                                return Container(
                                  margin: EdgeInsets.all(5),
                                  height: 40,
                                  decoration: const BoxDecoration(
                                    color: Color.fromARGB(92, 37, 37, 37),
                                    borderRadius:
                                        BorderRadius.all(Radius.circular(20)),
                                  ),
                                  child: Padding(
                                    padding: const EdgeInsets.all(8),
                                    child: Center(
                                      child: Text(
                                        snapshot.data!.genres![index].name
                                            .toString(),
                                      ),
                                    ),
                                  ),
                                );
                              },
                            ),
                          ),
                        ),
                        // SizedBox(
                        //   height: 10,
                        // ),
                        _tabSection(
                          context,
                          desrip: snapshot.data!.overview,
                          id: snapshot.data!.id.toString(),
                          data: getReviewFilm(snapshot.data!.id.toString()),
                          credit: getCreditFilm(snapshot.data!.id.toString()),
                        ),
                      ],
                    ),
                  ],
                );
              } else {
                return const Center(
                  child: CircularProgressIndicator(),
                );
              }
            },
          ),
        ),
      ),
    );
  }
}

Widget _tabSection(BuildContext context,
    {String? desrip,
    String? id,
    required Future<List<dynamic>> data,
    required Future<List<dynamic>> credit}) {
  String img = 'http://image.tmdb.org/t/p/w500';

  return Padding(
    padding: const EdgeInsets.all(10.0),
    child: DefaultTabController(
      length: 3,
      child: Column(
        mainAxisSize: MainAxisSize.min,
        children: <Widget>[
          Container(
            child: TabBar(
              tabs: [
                Tab(
                  text: "About Movie",
                ),
                Tab(
                  text: "Reviews",
                ),
                Tab(
                  text: "Credits",
                ),
              ],
              labelColor: Colors.black,
            ),
          ),
          Container(
            height: MediaQuery.of(context).size.height,
            padding: EdgeInsets.only(top: 10),
            child: TabBarView(children: [
              Container(
                child: Column(
                  children: [
                    Text(
                      desrip.toString(),
                    ),
                  ],
                ),
              ),
              Container(
                child: FutureBuilder<List<dynamic>>(
                  builder: (context, snapshot) {
                    if (snapshot.hasData) {
                      return ListView.builder(
                        itemCount: snapshot.data!.length,
                        itemBuilder: (context, index) {
                          return ListTile(
                            title: Text(
                              snapshot.data![index]['author_details']
                                  ['username'],
                            ),
                            leading: CircleAvatar(
                              child: Icon(LineIcons.user),
                            ),
                            subtitle: Text(
                              snapshot.data![index]['content'],
                            ),
                            trailing: Container(
                              alignment: Alignment.center,
                              padding: EdgeInsets.all(3),
                              width: 40,
                              height: 50,
                              decoration: BoxDecoration(
                                borderRadius: BorderRadius.circular(10),
                                color: Color.fromARGB(92, 37, 37, 37),
                              ),
                              child: Column(
                                children: [
                                  Icon(
                                    LineIcons.star,
                                    color: Color(0xffffd700),
                                  ),
                                  Text(
                                    snapshot.data![index]['author_details']
                                            ['rating']
                                        .toString(),
                                    style: TextStyle(
                                      color: Color(0xffffd700),
                                    ),
                                  ),
                                ],
                              ),
                            ),
                          );
                        },
                      );
                    } else {
                      return CircularProgressIndicator();
                    }
                  },
                  future: data,
                ),
              ),
              Container(
                child: FutureBuilder(
                  builder: (context, snapshot) {
                    if (snapshot.hasData) {
                      return GridView.builder(
                        gridDelegate:
                            const SliverGridDelegateWithMaxCrossAxisExtent(
                          maxCrossAxisExtent: 200,
                          childAspectRatio: 4 / 5,
                          crossAxisSpacing: 20,
                          mainAxisSpacing: 20,
                        ),
                        itemBuilder: (context, index) {
                          return Container(
                            child: Column(
                              children: [
                                CircleAvatar(
                                  backgroundImage: snapshot.data![index]
                                              ['profile_path'] ==
                                          null
                                      ? NetworkImage(
                                          'https://upload.wikimedia.org/wikipedia/commons/7/7c/Profile_avatar_placeholder_large.png',
                                        )
                                      : NetworkImage(
                                          img +
                                              snapshot.data![index]
                                                  ['profile_path'],
                                        ),
                                  radius: 50,
                                ),
                                SizedBox(
                                  height: 5,
                                ),
                                Text(
                                  snapshot.data![index]['original_name'],
                                ),
                                SizedBox(
                                  height: 5,
                                ),
                                Text(snapshot.data![index]
                                    ['known_for_department'])
                              ],
                            ),
                          );
                        },
                      );
                    } else {
                      return Center(
                        child: CircularProgressIndicator(),
                      );
                    }
                  },
                  future: credit,
                ),
              ),
            ]),
          ),
        ],
      ),
    ),
  );
}


// return ListView.builder(
//                 shrinkWrap: true,
//                 itemCount: snapshot.data!.genres!.length,
//                 itemBuilder: (context, index) {
//                   return Text(snapshot.data!.genres![index].name.toString());
//                 },
//               );