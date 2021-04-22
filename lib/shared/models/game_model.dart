import 'gamePage_model.dart';

class Game {
  String summary;
  String summaryShort;
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
      this.firstReleaseDate,
      this.genres,
      this.involvedCompanies,
      this.name,
      this.platforms,
      this.totalRating,
      this.websites,
      this.summaryShort,
      this.summary});

  get launchYear => DateTime.fromMillisecondsSinceEpoch(this.firstReleaseDate * 1000).year;

  get getDeveloperCompany =>
      this.involvedCompanies.where((element) => element.developer == true).first.company;

  Game.fromJson(Map<String, dynamic> json) {
    summary = json['summary'];

    if (summary != null) {
      summaryShort = summary.substring(0, (summary.length / 3).floor());
      if (summary.length > 500) {
        summaryShort = summary.substring(0, (summary.length / 6).floor());
      }
    }

    if (json['websites'] != null) {
      websites = <Websites>[];
      json['websites'].forEach((v) {
        websites.add(Websites.fromJson(v));
      });
    }

    id = json['id'];
    cover = json['cover'] != null ? new Cover.fromJson(json['cover']) : null;

    firstReleaseDate = json['first_release_date'];

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
    name = json['name'];
    if (json['platforms'] != null) {
      // ignore: deprecated_member_use
      platforms = new List<Platforms>();
      json['platforms'].forEach((v) {
        platforms.add(new Platforms.fromJson(v));
      });
    }
    totalRating = json['total_rating'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['id'] = this.id;
    if (this.cover != null) {
      data['cover'] = this.cover.toJson();
    }
    data['first_release_date'] = this.firstReleaseDate;
    if (this.genres != null) {
      data['genres'] = this.genres.map((v) => v.toJson()).toList();
    }
    if (this.involvedCompanies != null) {
      data['involved_companies'] = this.involvedCompanies.map((v) => v.toJson()).toList();
    }
    data['name'] = this.name;
    if (this.platforms != null) {
      data['platforms'] = this.platforms.map((v) => v.toJson()).toList();
    }
    data['total_rating'] = this.totalRating;
    return data;
  }
}

class Cover {
  int id;
  String imageId;
  String smallCover;
  String imageBaseURL = "https://images.igdb.com/igdb/image/upload";
  String bigCover;
  String medScreenShot;
  String medLogo;
  String bigStreenShot;
  String thub;
  String micro;
  String sd;
  String hd;

  Cover({
    this.id,
    this.imageId,
    this.smallCover,
    this.imageBaseURL,
    this.medScreenShot,
    this.bigCover,
  });

  Cover.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    imageId = json['image_id'];
    smallCover = "$imageBaseURL/t_cover_small/$imageId.jpg";
    bigCover = "$imageBaseURL/t_cover_big/$imageId.jpg";
    medLogo = "$imageBaseURL/t_logo_med/$imageId.jpg";
    medScreenShot = "$imageBaseURL/t_screenshot_med/$imageId.jpg";
    bigStreenShot = "$imageBaseURL/t_screenshot_big/$imageId.jpg";
    thub = "$imageBaseURL/t_thumb/$imageId.jpg";
    micro = "$imageBaseURL/t_micro/$imageId.jpg";
    sd = "$imageBaseURL/t_720p/$imageId.jpg";
    hd = "$imageBaseURL/t_1080p/$imageId.jpg";
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['id'] = this.id;
    data['image_id'] = this.imageId;

    return data;
  }
}

class Genres {
  int id;
  String name;

  Genres({this.id, this.name});

  Genres.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    name = json['name'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['id'] = this.id;
    data['name'] = this.name;
    return data;
  }
}

class InvolvedCompanies {
  int id;
  Company company;
  bool developer;

  InvolvedCompanies({this.id, this.company, this.developer});

  InvolvedCompanies.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    company = json['company'] != null ? new Company.fromJson(json['company']) : null;
    developer = json['developer'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['id'] = this.id;
    if (this.company != null) {
      data['company'] = this.company.toJson();
    }
    data['developer'] = this.developer;
    return data;
  }
}

class Platforms {
  List<Platforms> platforms;

  Platforms({this.platforms});

  Platforms.fromJson(Map<String, dynamic> json) {
    if (json['platforms'] != null) {
      platforms = <Platforms>[];
      json['platforms'].forEach((v) {
        platforms.add(new Platforms.fromJson(v));
      });
    }
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    if (this.platforms != null) {
      data['platforms'] = this.platforms.map((v) => v.toJson()).toList();
    }
    return data;
  }
}

class Websites {
  int category;
  String url;

  Websites({this.category, this.url});

  Websites.fromJson(Map<String, dynamic> json) {
    if (json['category'] != null) {
      category = json['category'];
    }

    if (json['url'] != null) {
      url = json['url'];
    }
  }
}
