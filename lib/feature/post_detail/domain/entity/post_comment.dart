class PostComment {
  PostComment({
    required this.postId,
    required this.id,
    required this.name,
    required this.email,
    required this.body,
    this.userImage,
  });

  int postId;
  int id;
  String name;
  String email;
  String body;
  String? userImage;
}
