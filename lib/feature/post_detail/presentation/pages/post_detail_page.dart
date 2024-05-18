import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:take_home/feature/post/domain/entity/post.dart';
import 'package:take_home/feature/post_detail/domain/entity/post_comment.dart';
import 'package:take_home/feature/post_detail/presentation/cubit/post_detail_cubit.dart';
import 'package:take_home/feature/post_detail/presentation/widgets/post_comment_item.dart';

class PostDetailArguments {
  const PostDetailArguments({required this.post});

  final Post post;
}

class PostDetailPage extends StatefulWidget {
  const PostDetailPage({required this.post, super.key});

  final Post post;

  @override
  State<PostDetailPage> createState() => _PostDetailPageState();
}

class _PostDetailPageState extends State<PostDetailPage> {
  List<PostComment> postCommentList = [];

  @override
  void initState() {
    super.initState();
    init();
  }

  Future<void> init() async {
    await BlocProvider.of<PostDetailCubit>(context)
        .getPostComments(widget.post.id);
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: ListView(
          children: [
            BlocBuilder<PostDetailCubit, PostDetailState>(
              builder: (context, state) {
                if (state is PostDetailInitial ||
                    state is PostCommentDataLoading) {
                  return const Center(child: CircularProgressIndicator());
                } else if (state is PostCommentDataLoaded) {
                  postCommentList = state.postList;
                  return _buildPosts(postCommentList);
                }
                return const Center(child: CircularProgressIndicator());
              },
            ),
          ],
        ),
      ),
    );
  }

  Widget _buildPosts(List<PostComment> postCommentList) {
    return ListView.separated(
      shrinkWrap: true,
      physics: const NeverScrollableScrollPhysics(),
      padding: const EdgeInsets.all(10),
      itemCount: postCommentList.length,
      separatorBuilder: (context, index) {
        return const SizedBox(height: 5);
      },
      itemBuilder: (context, index) {
        final postComment = postCommentList[index];
        return PostCommentItem(postComment: postComment);
      },
    );
  }
}
