class User {
  final String uid;

  User({this.uid});
}

class UserData {
  final String uid;
  final String name;
  final String phone;
  final String email;
  final String gender;
  final String dob;

  UserData(
      {this.uid, this.phone, this.gender, this.name, this.dob, this.email});
}
