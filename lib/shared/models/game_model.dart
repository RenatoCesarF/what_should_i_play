import 'package:project/shared/models/platforms_model.dart';
import 'package:project/shared/models/websites_model.dart';

import 'cover_model.dart';
import 'genres_model.dart';
import 'involvedCompanies_model.dart';

class Game {
  List<Game> similarGames;
  String summary;
  int id;
  Cover cover;
  int firstReleaseDate;
  List<Genres> genres;
  List<InvolvedCompanies> involvedCompanies;
  String name;
  List<Platforms> platforms;
  double totalRating;
  List<Websites> websites;

  Game(
      {this.id,
      this.cover,
      this.similarGames,
      this.firstReleaseDate,
      this.genres,
      this.involvedCompanies,
      this.name,
      this.platforms,
      this.totalRating,
      this.websites,
      this.summary});

  Game.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    cover = json['cover'] != null ? new Cover.fromJson(json['cover']) : null;
    firstReleaseDate = json['first_release_date'];
    name = json['name'];
    summary = json['summary'];
    totalRating = json['total_rating'];

    if (json['websites'] != null) {
      websites = <Websites>[];
      json['websites'].forEach((v) {
        websites.add(Websites.fromJson(v));
      });
    }

    if (json['similar_games'] != null) {
      similarGames = <Game>[];
      json['similar_games'].forEach((v) {
        similarGames.add(new Game.fromJson(v));
      });
    }

    if (json['genres'] != null) {
      // ignore: deprecated_member_use
      genres = new List<Genres>();
      json['genres'].forEach((v) {
        genres.add(new Genres.fromJson(v));
      });
    }
    if (json['involved_companies'] != null) {
      // ignore: deprecated_member_use
      involvedCompanies = new List<InvolvedCompanies>();
      json['involved_companies'].forEach((v) {
        involvedCompanies.add(new InvolvedCompanies.fromJson(v));
      });
    }

    if (json['platforms'] != null) {
      // ignore: deprecated_member_use
      platforms = new List<Platforms>();
      json['platforms'].forEach((v) {
        platforms.add(new Platforms.fromJson(v));
      });
    }
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['id'] = this.id;
    data['name'] = this.name;
    data['first_release_date'] = this.firstReleaseDate;
    data['total_rating'] = this.totalRating;

    if (this.cover != null) {
      data['cover'] = this.cover.toJson();
    }
    if (this.genres != null) {
      data['genres'] = this.genres.map((v) => v.toJson()).toList();
    }
    if (this.involvedCompanies != null) {
      data['involved_companies'] = this.involvedCompanies.map((v) => v.toJson()).toList();
    }

    if (this.platforms != null) {
      data['platforms'] = this.platforms.map((v) => v.toJson()).toList();
    }
    if (this.similarGames != null) {
      data['similar_games'] = this.similarGames.map((v) => v.toJson()).toList();
    }
    return data;
  }

  get launchYear => DateTime.fromMillisecondsSinceEpoch(this.firstReleaseDate * 1000).year;

  get getDeveloperCompany =>
      this.involvedCompanies.where((element) => element.developer == true).first.company;

  get getShortSummary {
    String summaryShort = "";
    if (this.summary != null) {
      summaryShort = this.summary.substring(0, (this.summary.length / 3).floor());
      if (this.summary.length > 500) {
        summaryShort = this.summary.substring(0, (this.summary.length / 6).floor());
      }
    }
    return summaryShort;
  }
}
