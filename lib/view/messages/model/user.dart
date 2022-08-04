class UserModel {
  String userName;
  String? fullName;
  String gender;

  UserModel({required this.userName, required this.gender}) {
    fullName = userName;
  }
}
