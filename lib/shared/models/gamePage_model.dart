import 'game_model.dart';

class GamePage {
  List<InvolvedCompanies> involvedCompanies;
  List<Game> similarGames;
  Game game;

  GamePage({this.involvedCompanies, this.similarGames, this.game});

  GamePage.fromJson(Map<String, dynamic> json) {
    game = Game.fromJson(json);
    if (json['involved_companies'] != null) {
      involvedCompanies = <InvolvedCompanies>[];
      json['involved_companies'].forEach((v) {
        involvedCompanies.add(new InvolvedCompanies.fromJson(v));
      });
    }
    if (json['similar_games'] != null) {
      similarGames = <Game>[];
      json['similar_games'].forEach((v) {
        similarGames.add(new Game.fromJson(v));
      });
    }
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    if (this.involvedCompanies != null) {
      data['involved_companies'] = this.involvedCompanies.map((v) => v.toJson()).toList();
    }
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
  Logo logo; //a getter to developer logo

  Company({this.id, this.name, this.published, this.logo});

  Company.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    name = json['name'];

    if (json['logo'] != null) {
      logo = Logo.fromJson(json['logo']);
      print(logo.imageId);
    }

    if (json['published'] != null) {
      published = <Game>[];
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

class Logo {
  int id;
  String imageId;

  Logo({this.id, this.imageId});

  Logo.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    imageId = json['image_id'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['id'] = this.id;
    data['image_id'] = this.imageId;

    return data;
  }
}
