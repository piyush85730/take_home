import 'dart:convert';

import 'package:json_annotation/json_annotation.dart';
import 'package:take_home/core/utils/utils.dart';
import 'package:take_home/feature/post/domain/entity/post.dart';

part 'post_model.g.dart';

List<PostModel> postModelFromJson(String str) =>
    List<PostModel>.from(json.decode(str).map((x) => PostModel.fromJson(x)));

String postModelToJson(List<PostModel> data) =>
    json.encode(List<dynamic>.from(data.map((x) => x.toJson())));

@JsonSerializable()
class PostModel extends Post {
  PostModel({
    required super.userId,
    required super.id,
    required super.title,
    required super.body,
    super.userImage,
    super.postImage,
    super.userName,
  });

  factory PostModel.fromJson(Map<String, dynamic> json) {
    final postModel = _$PostModelFromJson(json)
      ..userImage = getRandomUserImage()
      ..postImage = getRandomPostImage()
      ..userName = getRandomUserName();
    return postModel;
  }

  Map<String, dynamic> toJson() => _$PostModelToJson(this);
}
