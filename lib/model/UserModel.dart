class UserModel {
  final String id;
  // final String name;
  // final String email;
  // final String password;
  // final String city;
  // final String profileImage;
  // final int score;
  // final int ticket;

  UserModel({
    required this.id,
    // required this.name,
    // required this.email,
    // required this.password,
    // required this.city,
    // required this.profileImage,
    // required this.score,
    // required this.ticket,
  });

  factory UserModel.fromMap(Map<String, dynamic> map, String id) {
    return UserModel(
      id: id,
      // name: map['name'],
      // email: map['email'],
      // password: map['password'],
      // city: map['city'],
      // profileImage: map['profileImage'],
      // score: map['score'],
      // ticket: map['ticket'],
    );
  }
}
