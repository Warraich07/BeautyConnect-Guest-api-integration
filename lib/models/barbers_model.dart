class BarbersModel {
  int? time;
  int? id;
  String? name;
  String? type;
  String? email;
  String? image;
  dynamic about;
  String? location;
  String? lat;
  String? long;
  dynamic status;
  String? otp;
  String? profileStatus;
  dynamic emailVerifiedAt;
  DateTime? createdAt;
  DateTime? updatedAt;
  dynamic phone;
  dynamic deletedAt;
  String? averageRating;

  BarbersModel({
    this.time,
    this.id,
    this.name,
    this.type,
    this.email,
    this.image,
    this.about,
    this.location,
    this.lat,
    this.long,
    this.status,
    this.otp,
    this.profileStatus,
    this.emailVerifiedAt,
    this.createdAt,
    this.updatedAt,
    this.phone,
    this.deletedAt,
    this.averageRating,
  });

  factory BarbersModel.fromJson(Map<String, dynamic> json) => BarbersModel(
    time: json['first_available_slot'],
    id: json["id"],
    name: json["name"],
    type: json["type"],
    email: json["email"],
    image: json["image"],
    about: json["about"],
    location: json["location"],
    lat: json["lat"],
    long: json["long"],
    status: json["status"],
    otp: json["otp"],
    profileStatus: json["profile_status"],
    emailVerifiedAt: json["email_verified_at"],
    createdAt: json["created_at"] == null ? null : DateTime.parse(json["created_at"]),
    updatedAt: json["updated_at"] == null ? null : DateTime.parse(json["updated_at"]),
    phone: json["phone"],
    deletedAt: json["deleted_at"],
    averageRating: json["average_rating"].toString(),
  );

  Map<String, dynamic> toJson() => {
    "first_available_slot": time,
    "id": id,
    "name": name,
    "type": type,
    "email": email,
    "image": image,
    "about": about,
    "location": location,
    "lat": lat,
    "long": long,
    "status": status,
    "otp": otp,
    "profile_status": profileStatus,
    "email_verified_at": emailVerifiedAt,
    "created_at": createdAt?.toIso8601String(),
    "updated_at": updatedAt?.toIso8601String(),
    "phone": phone,
    "deleted_at": deletedAt,
    "average_rating": averageRating,
  };
}
