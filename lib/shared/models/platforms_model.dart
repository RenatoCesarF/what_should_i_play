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
