import 'dart:convert';

import 'package:json_annotation/json_annotation.dart';
import 'package:take_home/core/utils/utils.dart';
import 'package:take_home/feature/post_detail/domain/entity/post_comment.dart';

part 'post_comment_model.g.dart';

List<PostCommentModel> postCommentModelFromJson(String str) =>
    List<PostCommentModel>.from(
      json.decode(str).map((x) => PostCommentModel.fromJson(x)),
    );

String postCommentModelToJson(List<PostCommentModel> data) =>
    json.encode(List<dynamic>.from(data.map((x) => x.toJson())));

@JsonSerializable()
class PostCommentModel extends PostComment {
  PostCommentModel({
    required super.postId,
    required super.id,
    required super.name,
    required super.email,
    required super.body,
    super.userImage,
  });

  factory PostCommentModel.fromJson(Map<String, dynamic> json) {
    final postCommentModel = _$PostCommentModelFromJson(json)
      ..userImage = getRandomUserImage();
    return postCommentModel;
  }

  Map<String, dynamic> toJson() => _$PostCommentModelToJson(this);
}
