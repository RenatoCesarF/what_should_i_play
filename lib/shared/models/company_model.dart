import 'game_model.dart';

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
