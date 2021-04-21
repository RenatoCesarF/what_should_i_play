import 'game_model.dart';

class Recomendations {
  int id;
  List<InvolvedCompanies> involvedCompanies;
  String name;
  List<Game> similarGames;

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
      similarGames = new List<Game>();
      json['similar_games'].forEach((v) {
        similarGames.add(new Game.fromJson(v));
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
  List<Game> published;

  Company({this.id, this.name, this.published});

  Company.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    name = json['name'];
    if (json['published'] != null) {
      published = new List<Game>();
      json['published'].forEach((v) {
        published.add(new Game.fromJson(v));
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
