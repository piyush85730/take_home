import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:take_home/feature/post/domain/entity/post.dart';
import 'package:take_home/feature/post/presentation/cubit/post_cubit.dart';
import 'package:take_home/feature/post/presentation/widgets/post_item.dart';

class PostsPage extends StatefulWidget {
  const PostsPage({super.key});

  @override
  State<PostsPage> createState() => _PostsPageState();
}

class _PostsPageState extends State<PostsPage>
    with AutomaticKeepAliveClientMixin<PostsPage> {
  List<Post> postList = [];

  @override
  void initState() {
    super.initState();
    initRefresh();
  }

  Future<void> initRefresh() async {
    await BlocProvider.of<PostsCubit>(context).getPosts();
  }

  @override
  Widget build(BuildContext context) {
    super.build(context);
    return BlocBuilder<PostsCubit, PostsState>(
      builder: (context, state) {
        if (state is PostInitial || state is PostDataLoading) {
          return const Center(child: CircularProgressIndicator());
        } else if (state is PostDataLoaded) {
          postList = state.postList;
          return _buildPosts(postList);
        }
        return const Center(child: CircularProgressIndicator());
      },
    );
  }

  Widget _buildPosts(List<Post> postList) {
    return Column(
      children: [
        Expanded(
          child: ListView.builder(
            itemCount: postList.length,
            itemBuilder: (context, index) {
              final post = postList[index];
              return PostItem(post: post);
            },
          ),
        ),
      ],
    );
  }

  @override
  bool get wantKeepAlive => true;
}
