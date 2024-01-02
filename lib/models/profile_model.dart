import 'package:cloud_firestore/cloud_firestore.dart';

class ProfileModel {
  //person info
  String? imageProfile;
  String? name;
  String? age;
  String? gender;
  String? city;
  String? country;
  String? lookingForPartner;

  //appearance
  String? height;
  String? weight;
  String? bodyType;

//lifestyle
  String? drinks;
  String? smoke;
  String? marriageStatus;
  String? haveChildren;
  String? noOfChildren;
  String? profession;
  String? income;
  String? partnerLookingFor;
  String? family;
  String? hobbies;

  //culture
  String? religion;
  String? nationality;
  String? education;
  String? languages;

  ProfileModel({
    this.imageProfile,
    this.age,
    this.name,
    this.gender,
    this.city,
    this.country,
    this.lookingForPartner,
    this.height,
    this.weight,
    this.bodyType,
    this.drinks,
    this.smoke,
    this.marriageStatus,
    this.haveChildren,
    this.noOfChildren,
    this.profession,
    this.income,
    this.partnerLookingFor,
    this.family,
    this.hobbies,
    this.religion,
    this.nationality,
    this.education,
    this.languages,
  });
  static ProfileModel dataFromSnapshot(DocumentSnapshot snapshot) {
    var dataSnapshot = snapshot.data() as Map<String, dynamic>;

    return ProfileModel(
      imageProfile: dataSnapshot["imageProfile"],
      name: dataSnapshot["name"],
      age: dataSnapshot["age"],
      gender: dataSnapshot["gender"],
      city: dataSnapshot["city"],
      country: dataSnapshot["country"],
      lookingForPartner: dataSnapshot["lookingForPartner"],
      height: dataSnapshot["height"],
      weight: dataSnapshot["weight"],
      bodyType: dataSnapshot["bodytype"],
      drinks: dataSnapshot["drinks"],
      smoke: dataSnapshot["smoke"],
      marriageStatus: dataSnapshot["marriageStatus"],
      haveChildren: dataSnapshot["haveChildren"],
      noOfChildren: dataSnapshot["noOfChildren"],
      profession: dataSnapshot["profession"],
      income: dataSnapshot["income"],
      partnerLookingFor: dataSnapshot["partnerLookingFor"],
      family: dataSnapshot["family"],
      hobbies: dataSnapshot["hobbies"],
      religion: dataSnapshot["religion"],
      nationality: dataSnapshot["nationality"],
      education: dataSnapshot["education"],
      languages: dataSnapshot["languages"],
    );
  }

  Map<String, dynamic> profileToJson() {
    return {
      "imageProfile": imageProfile,
      "name": name,
      "age": age,
      "gender": gender,
      "city": city,
      "country": country,
      "lookingForPartner": lookingForPartner,
      "height": height,
      "weight": weight,
      "bodyType": bodyType,
      "drinks": drinks,
      "smoke": smoke,
      "marriageStatus": marriageStatus,
      "haveChildren": haveChildren,
      "noOfChildren": noOfChildren,
      "profession": profession,
      "income": income,
      "partnerLookingFor": partnerLookingFor,
      "family": family,
      "hobbies": hobbies,
      "religion": religion,
      "nationality": nationality,
      "education": education,
      "languages": languages
    };
  }
}
