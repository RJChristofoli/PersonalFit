import 'package:personalfit/modules/domain/entities/personal.dart';

class PersonalModel extends Personal {
  const PersonalModel({
    required String id,
    required String name,
    required List<String> specialties,
    required double rating,
    required int price,
    required String bio,
    required String photoUrl,
    required String city,
    required String state,
    required String whatsapp,
  }) : super(
          id: id,
          name: name,
          specialties: specialties,
          rating: rating,
          price: price,
          bio: bio,
          photoUrl: photoUrl,
          city: city,
          state: state,
          whatsapp: whatsapp,
        );

  factory PersonalModel.fromJson(Map<String, dynamic> json) {
    return PersonalModel(
      id: json['id'],
      name: json['name'],
      specialties: List<String>.from(json['specialities']),
      rating: (json['rating'] as num).toDouble(),
      price: json['price'],
      bio: json['bio'],
      photoUrl: json['avatar'],
      city: json['city'],
      state: json['state'],
      whatsapp: json['number'],
    );
  }

  Map<String, dynamic> toJson() {
    return {
      'id': id,
      'name': name,
      'specialities': specialties,
      'rating': rating,
      'price': price,
      'bio': bio,
      'avatar': photoUrl,
      'city': city,
      'state': state,
      'number': whatsapp,
    };
  }
}
