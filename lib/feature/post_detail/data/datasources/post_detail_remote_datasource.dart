import 'dart:convert';

import 'package:flutter/cupertino.dart';
import 'package:take_home/core/error/exceptions.dart';
import 'package:take_home/core/services/api_service.dart';
import 'package:take_home/feature/post_detail/data/model/post_comment_model.dart';
import 'package:take_home/feature/post_detail/domain/usecases/get_post_comment.dart';
import 'package:take_home/injection_container/injection_container.dart';

// ignore: one_member_abstracts
abstract class PostDetailRemoteDataSource {
  Future<List<PostCommentModel>> getPostComments(
    GetPostCommentsParams getPostCommentsParams,
  );
}

class PostDetailRemoteDataSourceImpl implements PostDetailRemoteDataSource {
  @override
  Future<List<PostCommentModel>> getPostComments(
    GetPostCommentsParams getPostCommentsParams,
  ) async {
    final path = "posts/${getPostCommentsParams.postId}/comments";
    try {
      debugPrint("getPostComments 0 -> $path");
      final raw = await sl<ApiService>().getRequest(path: path);
      final res = raw.data;
      debugPrint("getPostComments 1 -> $res");
      final postCommentList = postCommentModelFromJson(json.encode(res));
      return postCommentList;
    } catch (e) {
      throw ServerException(error: e.toString());
    }
  }
}
