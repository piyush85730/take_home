import 'dart:convert';

import 'package:take_home/core/error/exceptions.dart';
import 'package:take_home/core/services/api_service.dart';
import 'package:take_home/feature/post/data/model/post_model.dart';
import 'package:take_home/injection_container/injection_container.dart';

// ignore: one_member_abstracts
abstract class PostRemoteDataSource {
  Future<List<PostModel>> getPost();
}

class PostRemoteDataSourceImpl implements PostRemoteDataSource {
  @override
  Future<List<PostModel>> getPost() async {
    const path = "posts/";
    try {
      final raw = await sl<ApiService>().getRequest(path: path);
      final res = raw.data;
      final postList = postModelFromJson(json.encode(res));
      return postList;
    } catch (e) {
      throw ServerException(error: e.toString());
    }
  }
}
