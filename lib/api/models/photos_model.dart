// To parse this JSON data, do
//
//     final photosModel = photosModelFromJson(jsonString);

import 'dart:convert';

List<PhotosModel> photosModelFromJson(String str) => List<PhotosModel>.from(
    json.decode(str).map((x) => PhotosModel.fromJson(x)));

String photosModelToJson(List<PhotosModel> data) =>
    json.encode(List<dynamic>.from(data.map((x) => x.toJson())));

class PhotosModel {
  PhotosModel({
    required this.id,
    required this.createdAt,
    required this.updatedAt,
    required this.width,
    required this.height,
    required this.color,
    required this.description,
    required this.altDescription,
    required this.urls,
    required this.links,
    required this.categories,
    required this.likes,
    required this.likedByUser,
    required this.currentUserCollections,
    required this.topicSubmissions,
    required this.user,
  });

  String id;
  DateTime createdAt;
  DateTime updatedAt;

  int width;
  int height;
  String color;

  dynamic description;
  dynamic altDescription;
  Urls urls;
  PhotosModelLinks links;
  List<dynamic> categories;
  int likes;
  bool likedByUser;
  List<dynamic> currentUserCollections;
  TopicSubmissions topicSubmissions;
  User user;

  factory PhotosModel.fromJson(Map<String, dynamic> json) => PhotosModel(
        id: json["id"],
        createdAt: DateTime.parse(json["created_at"]),
        updatedAt: DateTime.parse(json["updated_at"]),
        width: json["width"],
        height: json["height"],
        color: json["color"],
        description: json["description"],
        altDescription: json["alt_description"],
        urls: Urls.fromJson(json["urls"]),
        links: PhotosModelLinks.fromJson(json["links"]),
        categories: List<dynamic>.from(json["categories"].map((x) => x)),
        likes: json["likes"],
        likedByUser: json["liked_by_user"],
        currentUserCollections:
            List<dynamic>.from(json["current_user_collections"].map((x) => x)),
        topicSubmissions: TopicSubmissions.fromJson(json["topic_submissions"]),
        user: User.fromJson(json["user"]),
      );

  Map<String, dynamic> toJson() => {
        "id": id,
        "created_at": createdAt.toIso8601String(),
        "updated_at": updatedAt.toIso8601String(),
        "width": width,
        "height": height,
        "color": color,
        "description": description,
        "alt_description": altDescription,
        "urls": urls.toJson(),
        "links": links.toJson(),
        "categories": List<dynamic>.from(categories.map((x) => x)),
        "likes": likes,
        "liked_by_user": likedByUser,
        "current_user_collections":
            List<dynamic>.from(currentUserCollections.map((x) => x)),
        "topic_submissions": topicSubmissions.toJson(),
        "user": user.toJson(),
      };
}

class PhotosModelLinks {
  PhotosModelLinks({
    required this.self,
    required this.html,
    required this.download,
    required this.downloadLocation,
  });

  String self;
  String html;
  String download;
  String downloadLocation;

  factory PhotosModelLinks.fromJson(Map<String, dynamic> json) =>
      PhotosModelLinks(
        self: json["self"],
        html: json["html"],
        download: json["download"],
        downloadLocation: json["download_location"],
      );

  Map<String, dynamic> toJson() => {
        "self": self,
        "html": html,
        "download": download,
        "download_location": downloadLocation,
      };
}

class User {
  User({
    required this.id,
    required this.updatedAt,
    required this.username,
    required this.name,
    required this.firstName,
    required this.links,
    required this.profileImage,
    required this.totalCollections,
    required this.totalLikes,
    required this.totalPhotos,
    required this.acceptedTos,
    required this.forHire,
  });

  String id;
  DateTime updatedAt;
  String username;
  String name;
  String firstName;
  //String lastName;
  //String twitterUsername;
  //String portfolioUrl;

  //String location;
  UserLinks links;
  ProfileImage profileImage;

  int totalCollections;
  int totalLikes;
  int totalPhotos;
  bool acceptedTos;
  bool forHire;

  factory User.fromJson(Map<String, dynamic> json) => User(
        id: json["id"],
        updatedAt: DateTime.parse(json["updated_at"]),
        username: json["username"],
        name: json["name"],
        firstName: json["first_name"],
        links: UserLinks.fromJson(json["links"]),
        profileImage: ProfileImage.fromJson(json["profile_image"]),
        totalCollections: json["total_collections"],
        totalLikes: json["total_likes"],
        totalPhotos: json["total_photos"],
        acceptedTos: json["accepted_tos"],
        forHire: json["for_hire"],
      );

  Map<String, dynamic> toJson() => {
        "id": id,
        "updated_at": updatedAt.toIso8601String(),
        "username": username,
        "name": name,
        "first_name": firstName,
        "links": links.toJson(),
        "profile_image": profileImage.toJson(),
        "total_collections": totalCollections,
        "total_likes": totalLikes,
        "total_photos": totalPhotos,
        "accepted_tos": acceptedTos,
        "for_hire": forHire,
      };
}

class UserLinks {
  UserLinks({
    required this.self,
    required this.html,
    required this.photos,
    required this.likes,
    required this.portfolio,
    required this.following,
    required this.followers,
  });

  String self;
  String html;
  String photos;
  String likes;
  String portfolio;
  String following;
  String followers;

  factory UserLinks.fromJson(Map<String, dynamic> json) => UserLinks(
        self: json["self"],
        html: json["html"],
        photos: json["photos"],
        likes: json["likes"],
        portfolio: json["portfolio"],
        following: json["following"],
        followers: json["followers"],
      );

  Map<String, dynamic> toJson() => {
        "self": self,
        "html": html,
        "photos": photos,
        "likes": likes,
        "portfolio": portfolio,
        "following": following,
        "followers": followers,
      };
}

class ProfileImage {
  ProfileImage({
    required this.small,
    required this.medium,
    required this.large,
  });

  String small;
  String medium;
  String large;

  factory ProfileImage.fromJson(Map<String, dynamic> json) => ProfileImage(
        small: json["small"],
        medium: json["medium"],
        large: json["large"],
      );

  Map<String, dynamic> toJson() => {
        "small": small,
        "medium": medium,
        "large": large,
      };
}

class TopicSubmissions {
  TopicSubmissions();

  factory TopicSubmissions.fromJson(Map<String, dynamic> json) =>
      TopicSubmissions();

  Map<String, dynamic> toJson() => {};
}

class Urls {
  Urls({
    required this.raw,
    required this.full,
    required this.regular,
    required this.small,
    required this.thumb,
    required this.smallS3,
  });

  String raw;
  String full;
  String regular;
  String small;
  String thumb;
  String smallS3;

  factory Urls.fromJson(Map<String, dynamic> json) => Urls(
        raw: json["raw"],
        full: json["full"],
        regular: json["regular"],
        small: json["small"],
        thumb: json["thumb"],
        smallS3: json["small_s3"],
      );

  Map<String, dynamic> toJson() => {
        "raw": raw,
        "full": full,
        "regular": regular,
        "small": small,
        "thumb": thumb,
        "small_s3": smallS3,
      };
}
