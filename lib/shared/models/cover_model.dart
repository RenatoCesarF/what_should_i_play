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
