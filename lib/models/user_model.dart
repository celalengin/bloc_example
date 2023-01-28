// To parse this JSON data, do
//
//     final userModel = userModelFromJson(jsonString);

import 'dart:convert';

List<UserModel> userModelFromJson(String str) => List<UserModel>.from(json.decode(str).map((x) => UserModel.fromJson(x)));

String userModelToJson(List<UserModel> data) => json.encode(List<dynamic>.from(data.map((x) => x.toJson())));

class UserModel {
  UserModel({
    required this.id,
    required this.firstName,
    required this.lastName,
    required this.maidenName,
    required this.age,
    required this.gender,
    required this.email,
    required this.phone,
    required this.username,
    required this.password,
    required this.birthDate,
    required this.image,
    required this.bloodGroup,
    required this.height,
    required this.weight,
    required this.eyeColor,
    required this.hair,
    required this.domain,
    required this.ip,
    required this.address,
    required this.macAddress,
    required this.university,
    required this.bank,
    required this.company,
    required this.ein,
    required this.ssn,
    required this.userAgent,
  });

  final int id;
  final String firstName;
  final String lastName;
  final String maidenName;
  final int age;
  final Gender gender;
  final String email;
  final String phone;
  final String username;
  final String password;
  final DateTime birthDate;
  final String image;
  final String bloodGroup;
  final int height;
  final double weight;
  final EyeColor eyeColor;
  final Hair hair;
  final String domain;
  final String ip;
  final Address address;
  final String macAddress;
  final String university;
  final Bank bank;
  final Company company;
  final String ein;
  final String ssn;
  final String userAgent;

  factory UserModel.fromJson(Map<String, dynamic> json) => UserModel(
    id: json["id"],
    firstName: json["firstName"],
    lastName: json["lastName"],
    maidenName: json["maidenName"],
    age: json["age"],
    gender: genderValues.map[json["gender"]]!,
    email: json["email"],
    phone: json["phone"],
    username: json["username"],
    password: json["password"],
    birthDate: DateTime.parse(json["birthDate"]),
    image: json["image"],
    bloodGroup: json["bloodGroup"],
    height: json["height"],
    weight: json["weight"]?.toDouble(),
    eyeColor: eyeColorValues.map[json["eyeColor"]]!,
    hair: Hair.fromJson(json["hair"]),
    domain: json["domain"],
    ip: json["ip"],
    address: Address.fromJson(json["address"]),
    macAddress: json["macAddress"],
    university: json["university"],
    bank: Bank.fromJson(json["bank"]),
    company: Company.fromJson(json["company"]),
    ein: json["ein"],
    ssn: json["ssn"],
    userAgent: json["userAgent"],
  );

  Map<String, dynamic> toJson() => {
    "id": id,
    "firstName": firstName,
    "lastName": lastName,
    "maidenName": maidenName,
    "age": age,
    "gender": genderValues.reverse[gender],
    "email": email,
    "phone": phone,
    "username": username,
    "password": password,
    "birthDate": "${birthDate.year.toString().padLeft(4, '0')}-${birthDate.month.toString().padLeft(2, '0')}-${birthDate.day.toString().padLeft(2, '0')}",
    "image": image,
    "bloodGroup": bloodGroup,
    "height": height,
    "weight": weight,
    "eyeColor": eyeColorValues.reverse[eyeColor],
    "hair": hair.toJson(),
    "domain": domain,
    "ip": ip,
    "address": address.toJson(),
    "macAddress": macAddress,
    "university": university,
    "bank": bank.toJson(),
    "company": company.toJson(),
    "ein": ein,
    "ssn": ssn,
    "userAgent": userAgent,
  };
}

class Address {
  Address({
    required this.address,
    this.city,
    required this.coordinates,
    required this.postalCode,
    required this.state,
  });

  final String address;
  final String? city;
  final Coordinates coordinates;
  final String postalCode;
  final String state;

  factory Address.fromJson(Map<String, dynamic> json) => Address(
    address: json["address"],
    city: json["city"],
    coordinates: Coordinates.fromJson(json["coordinates"]),
    postalCode: json["postalCode"],
    state: json["state"],
  );

  Map<String, dynamic> toJson() => {
    "address": address,
    "city": city,
    "coordinates": coordinates.toJson(),
    "postalCode": postalCode,
    "state": state,
  };
}

class Coordinates {
  Coordinates({
    required this.lat,
    required this.lng,
  });

  final double lat;
  final double lng;

  factory Coordinates.fromJson(Map<String, dynamic> json) => Coordinates(
    lat: json["lat"]?.toDouble(),
    lng: json["lng"]?.toDouble(),
  );

  Map<String, dynamic> toJson() => {
    "lat": lat,
    "lng": lng,
  };
}

class Bank {
  Bank({
    required this.cardExpire,
    required this.cardNumber,
    required this.cardType,
    required this.currency,
    required this.iban,
  });

  final String cardExpire;
  final String cardNumber;
  final String cardType;
  final String currency;
  final String iban;

  factory Bank.fromJson(Map<String, dynamic> json) => Bank(
    cardExpire: json["cardExpire"],
    cardNumber: json["cardNumber"],
    cardType: json["cardType"],
    currency: json["currency"],
    iban: json["iban"],
  );

  Map<String, dynamic> toJson() => {
    "cardExpire": cardExpire,
    "cardNumber": cardNumber,
    "cardType": cardType,
    "currency": currency,
    "iban": iban,
  };
}

class Company {
  Company({
    required this.address,
    required this.department,
    required this.name,
    required this.title,
  });

  final Address address;
  final String department;
  final String name;
  final String title;

  factory Company.fromJson(Map<String, dynamic> json) => Company(
    address: Address.fromJson(json["address"]),
    department: json["department"],
    name: json["name"],
    title: json["title"],
  );

  Map<String, dynamic> toJson() => {
    "address": address.toJson(),
    "department": department,
    "name": name,
    "title": title,
  };
}

enum EyeColor { GREEN, BROWN, GRAY, AMBER, BLUE }

final eyeColorValues = EnumValues({
  "Amber": EyeColor.AMBER,
  "Blue": EyeColor.BLUE,
  "Brown": EyeColor.BROWN,
  "Gray": EyeColor.GRAY,
  "Green": EyeColor.GREEN
});

enum Gender { MALE, FEMALE }

final genderValues = EnumValues({
  "female": Gender.FEMALE,
  "male": Gender.MALE
});

class Hair {
  Hair({
    required this.color,
    required this.type,
  });

  final Color color;
  final Type type;

  factory Hair.fromJson(Map<String, dynamic> json) => Hair(
    color: colorValues.map[json["color"]]!,
    type: typeValues.map[json["type"]]!,
  );

  Map<String, dynamic> toJson() => {
    "color": colorValues.reverse[color],
    "type": typeValues.reverse[type],
  };
}

enum Color { BLACK, BLOND, BROWN, CHESTNUT, AUBURN }

final colorValues = EnumValues({
  "Auburn": Color.AUBURN,
  "Black": Color.BLACK,
  "Blond": Color.BLOND,
  "Brown": Color.BROWN,
  "Chestnut": Color.CHESTNUT
});

enum Type { STRANDS, CURLY, VERY_CURLY, STRAIGHT, WAVY }

final typeValues = EnumValues({
  "Curly": Type.CURLY,
  "Straight": Type.STRAIGHT,
  "Strands": Type.STRANDS,
  "Very curly": Type.VERY_CURLY,
  "Wavy": Type.WAVY
});

class EnumValues<T> {
  Map<String, T> map;
  late Map<T, String> reverseMap;

  EnumValues(this.map);

  Map<T, String> get reverse {
    reverseMap = map.map((k, v) => MapEntry(v, k));
    return reverseMap;
  }
}
