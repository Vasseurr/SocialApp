class UserModel {
  String userName;
  String? fullName;
  String gender;
  List<List<String>>? postsUrlList;
  List<List<String>>? storiesUrlList;
  String? profileImageUrl;

  UserModel({
    required this.userName,
    required this.gender,
    this.postsUrlList,
    this.storiesUrlList,
    this.profileImageUrl,
  }) {
    fullName = userName;
  }
}
