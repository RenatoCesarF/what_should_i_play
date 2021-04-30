class Logo {
  int id;
  String imageId;

  Logo({this.id, this.imageId});

  Logo.fromJson(Map<String, dynamic> json) {
    if (json['id'] != null) {
      id = json['id'];
      imageId = json['image_id'];
    }
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['id'] = this.id;
    data['image_id'] = this.imageId;

    return data;
  }

  get getBigImageURL => "https://images.igdb.com/igdb/image/upload/t_cover_big/${this.imageId}.jpg";
  get getThumbImageURL => "https://images.igdb.com/igdb/image/upload/t_thumb/${this.imageId}.jpg";
  get getLogoMedURL => "https://images.igdb.com/igdb/image/upload/t_logo_med/${this.imageId}.jpg";

  //
}
