import 'package:flutter/material.dart';
import 'package:line_icons/line_icons.dart';
import 'package:movie_test/api/getapi.dart';
import 'package:movie_test/page/full/model/modelfull.dart';
import 'package:movie_test/page/full/view.dart';

class WishList extends StatefulWidget {
  const WishList({super.key});

  @override
  State<WishList> createState() => _WishListState();
}

class _WishListState extends State<WishList> {
  late Future<List<dynamic>> wishlist;
  String img = 'http://image.tmdb.org/t/p/w500';

  @override
  void initState() {
    super.initState();
    wishlist = getWishList();
  }

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: FutureBuilder(
        future: getWishList(),
        builder: ((context, snapshot) {
          if (snapshot.hasData) {
            return ListView.builder(
              itemCount: snapshot.data!.length,
              itemBuilder: ((context, index) {
                return GestureDetector(
                  onTap: () {
                    Navigator.of(context).push(
                      MaterialPageRoute(
                        builder: (context) => FullVuiew(
                          title: snapshot.data![index]['title'].toString(),
                          id: snapshot.data![index]['id'],
                        ),
                      ),
                    );
                  },
                  child: Container(
                    decoration: BoxDecoration(
                      color: Color.fromARGB(82, 182, 179, 179),
                      border: Border.all(),
                      borderRadius: const BorderRadius.all(
                        Radius.circular(10),
                      ),
                    ),
                    margin: const EdgeInsets.all(5),
                    height: MediaQuery.of(context).size.height / 6,
                    child: Row(
                      children: [
                        ClipRRect(
                          borderRadius: BorderRadius.circular(10),
                          child: Image.network(
                            img + snapshot.data![index]['poster_path'],
                          ),
                        ),
                        const SizedBox(
                          width: 10,
                        ),
                        Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            const SizedBox(
                              height: 10,
                            ),
                            Text(
                              snapshot.data![index]['title'],
                              maxLines: 2,
                              style: const TextStyle(
                                fontSize: 16,
                                fontWeight: FontWeight.bold,
                              ),
                            ),
                            const SizedBox(
                              height: 20,
                            ),
                            Container(
                              child: Row(
                                children: [
                                  const Icon(
                                    LineIcons.star,
                                  ),
                                  Text(
                                    snapshot.data![index]['vote_average']
                                        .toString(),
                                  ),
                                ],
                              ),
                            ),
                            Container(
                              child: Row(
                                children: [
                                  const Icon(
                                    LineIcons.box,
                                  ),
                                  Text(
                                    snapshot.data![index]['release_date']
                                        .toString(),
                                    style: const TextStyle(),
                                  ),
                                ],
                              ),
                            ),
                          ],
                        ),
                        // Align(
                        //   alignment: Alignment.bottomRight,
                        //   child: IconButton(
                        //     onPressed: () {},
                        //     icon: Icon(LineIcons.trash),
                        //   ),
                        // ),
                      ],
                    ),
                  ),
                );
              }),
            );
          } else {
            return const Center(
              child: CircularProgressIndicator(),
            );
          }
        }),
      ),
    );
  }
}
