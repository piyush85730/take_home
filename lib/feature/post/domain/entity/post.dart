class Post {
  Post({
    required this.userId,
    required this.id,
    required this.title,
    required this.body,
    this.userImage,
    this.postImage,
    this.userName,
  });

  int userId;
  int id;
  String title;
  String body;
  String? userImage;
  String? postImage;
  String? userName;
}
