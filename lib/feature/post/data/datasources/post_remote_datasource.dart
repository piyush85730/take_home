import 'package:flutter/cupertino.dart';
import 'package:take_home/core/error/exceptions.dart';
import 'package:take_home/core/services/api_service.dart';
import 'package:take_home/feature/post/data/model/post_model.dart';
import 'package:take_home/feature/post/domain/usecases/get_posts.dart';
import 'package:take_home/injection_container/injection_container.dart';

// ignore: one_member_abstracts
abstract class PostRemoteDataSource {
  Future<List<PostModel>> getPost(GetPostsParams getPostsParams);
}

class PostRemoteDataSourceImpl implements PostRemoteDataSource {
  @override
  Future<List<PostModel>> getPost(
    GetPostsParams getPostsParams,
  ) async {
    const path = "posts/";
    try {
      debugPrint("getPost -> 0");
      final raw = await sl<ApiService>().getRequest(path: path);
      debugPrint("getPost -> $raw");
      final res = raw.data;
      debugPrint("getPost -> $res");
      final postList = postModelFromJson(res);
      debugPrint("getPost -> ${postList.length}");
      return postList;
    } catch (e) {
      throw ServerException(error: e.toString());
    }
  }
}
