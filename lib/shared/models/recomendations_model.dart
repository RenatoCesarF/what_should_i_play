import 'game_model.dart';

class Recomendations {
  int id;
  List<InvolvedCompanies> involvedCompanies;
  String name;
  List<SimilarGames> similarGames;

  Recomendations({this.id, this.involvedCompanies, this.name, this.similarGames});

  Recomendations.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    if (json['involved_companies'] != null) {
      involvedCompanies = new List<InvolvedCompanies>();
      json['involved_companies'].forEach((v) {
        involvedCompanies.add(new InvolvedCompanies.fromJson(v));
      });
    }
    name = json['name'];
    if (json['similar_games'] != null) {
      similarGames = new List<SimilarGames>();
      json['similar_games'].forEach((v) {
        similarGames.add(new SimilarGames.fromJson(v));
      });
    }
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['id'] = this.id;
    if (this.involvedCompanies != null) {
      data['involved_companies'] = this.involvedCompanies.map((v) => v.toJson()).toList();
    }
    data['name'] = this.name;
    if (this.similarGames != null) {
      data['similar_games'] = this.similarGames.map((v) => v.toJson()).toList();
    }
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

class Company {
  int id;
  String name;
  List<Published> published;

  Company({this.id, this.name, this.published});

  Company.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    name = json['name'];
    if (json['published'] != null) {
      published = new List<Published>();
      json['published'].forEach((v) {
        published.add(new Published.fromJson(v));
      });
    }
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['id'] = this.id;
    data['name'] = this.name;
    if (this.published != null) {
      data['published'] = this.published.map((v) => v.toJson()).toList();
    }
    return data;
  }
}

class Published {
  int id;
  Cover cover;
  String name;

  Published({this.id, this.cover, this.name});

  Published.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    cover = json['cover'] != null ? new Cover.fromJson(json['cover']) : null;
    name = json['name'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['id'] = this.id;
    if (this.cover != null) {
      data['cover'] = this.cover.toJson();
    }
    data['name'] = this.name;
    return data;
  }
}

class SimilarGames {
  int id;
  Cover cover;
  String name;

  SimilarGames({this.id, this.cover, this.name});

  SimilarGames.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    cover = json['cover'] != null ? new Cover.fromJson(json['cover']) : null;
    name = json['name'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['id'] = this.id;
    if (this.cover != null) {
      data['cover'] = this.cover.toJson();
    }
    data['name'] = this.name;
    return data;
  }
}
