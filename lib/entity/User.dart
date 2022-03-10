class User {
  final String id;
  final String email;
  final String password;
  final int score;

  User({this.id, this.email, this.password, this.score});

  factory User.fromJSON(Map<String, dynamic> json) {
    return User(id: json["id"],
        email: json["mail"],
        password: json["password"],
        score: json["score"]);
  }
}