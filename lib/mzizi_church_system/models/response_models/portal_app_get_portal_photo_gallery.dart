class PortalPhotoGallery {
  String albumID;
  String albumName;
  String albumDescription;
  String albumType;
  String albumPhotoCount;
  List<Albumphotos> albumphotos;

  PortalPhotoGallery(
      {this.albumID,
      this.albumName,
      this.albumDescription,
      this.albumType,
      this.albumPhotoCount,
      this.albumphotos});

  PortalPhotoGallery.fromJson(Map<String, dynamic> json) {
    albumID = json['AlbumID'];
    albumName = json['AlbumName'];
    albumDescription = json['AlbumDescription'];
    albumType = json['AlbumType'];
    albumPhotoCount = json['AlbumPhotoCount'];
    if (json['Albumphotos'] != null) {
      albumphotos = new List<Albumphotos>();
      json['Albumphotos'].forEach((v) {
        albumphotos.add(new Albumphotos.fromJson(v));
      });
    }
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['AlbumID'] = this.albumID;
    data['AlbumName'] = this.albumName;
    data['AlbumDescription'] = this.albumDescription;
    data['AlbumType'] = this.albumType;
    data['AlbumPhotoCount'] = this.albumPhotoCount;
    if (this.albumphotos != null) {
      data['Albumphotos'] = this.albumphotos.map((v) => v.toJson()).toList();
    }
    return data;
  }
}

class Albumphotos {
  String imageID;
  String imageLink;
  Null imageHeight;
  Null imageWidth;

  Albumphotos(
      {this.imageID, this.imageLink, this.imageHeight, this.imageWidth});

  Albumphotos.fromJson(Map<String, dynamic> json) {
    imageID = json['ImageID'];
    imageLink = json['ImageLink'];
    imageHeight = json['ImageHeight'];
    imageWidth = json['ImageWidth'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['ImageID'] = this.imageID;
    data['ImageLink'] = this.imageLink;
    data['ImageHeight'] = this.imageHeight;
    data['ImageWidth'] = this.imageWidth;
    return data;
  }
}
