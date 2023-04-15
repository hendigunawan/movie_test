import 'dart:convert';

List<listFilm> postFromJson(String str) =>
    List<listFilm>.from(json.decode(str).map((x) => listFilm.fromJson(x)));

class listFilm {
  int? page;
  List<Results>? results;

  listFilm({this.page, this.results});

  listFilm.fromJson(Map<String, dynamic> json) {
    page = json['page'];
    if (json['results'] != null) {
      results = <Results>[];
      json['results'].forEach((v) {
        results!.add(new Results.fromJson(v));
      });
    }
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['page'] = this.page;
    if (this.results != null) {
      data['results'] = this.results!.map((v) => v.toJson()).toList();
    }
    return data;
  }
}

class Results {
  List<String>? genre;
  List<String>? imageurl;
  String? imdbid;
  double? imdbrating;
  int? released;
  String? synopsis;
  String? title;
  String? type;

  Results(
      {this.genre,
      this.imageurl,
      this.imdbid,
      this.imdbrating,
      this.released,
      this.synopsis,
      this.title,
      this.type});

  Results.fromJson(Map<String, dynamic> json) {
    genre = json['genre'].cast<String>();
    imageurl = json['imageurl'].cast<String>();
    imdbid = json['imdbid'];
    imdbrating = json['imdbrating'];
    released = json['released'];
    synopsis = json['synopsis'];
    title = json['title'];
    type = json['type'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['genre'] = this.genre;
    data['imageurl'] = this.imageurl;
    data['imdbid'] = this.imdbid;
    data['imdbrating'] = this.imdbrating;
    data['released'] = this.released;
    data['synopsis'] = this.synopsis;
    data['title'] = this.title;
    data['type'] = this.type;
    return data;
  }
}
