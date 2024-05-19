import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:one_context/one_context.dart';
import 'package:take_home/core/constants/string_constants.dart';
import 'package:take_home/core/constants/theme_constants.dart';
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
  late PostDetailCubit postDetailCubit;

  @override
  void initState() {
    super.initState();
    init();
  }

  Future<void> init() async {
    postDetailCubit = BlocProvider.of<PostDetailCubit>(context);
    await postDetailCubit.getPostComments(widget.post.id);
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: ListView(
          children: [
            Stack(
              alignment: Alignment.bottomLeft,
              children: [
                Image.asset(
                  widget.post.postImage!,
                  height: 500,
                  width: MediaQuery.of(context).size.width,
                  fit: BoxFit.cover,
                ),
                Container(
                  height: 500,
                  width: MediaQuery.of(context).size.width,
                  decoration: const BoxDecoration(
                    gradient: LinearGradient(
                      colors: [
                        ThemeColors.clrTransparent,
                        ThemeColors.clrBlack,
                      ],
                      stops: [0, 1],
                      begin: FractionalOffset.topCenter,
                      end: FractionalOffset.bottomCenter,
                      tileMode: TileMode.repeated,
                    ),
                  ),
                ),
                Container(
                  padding: const EdgeInsets.all(20),
                  child: Text(
                    widget.post.title,
                    style: const TextStyle(
                      fontSize: 16,
                      color: ThemeColors.clrWhite,
                    ),
                  ),
                ),
                GestureDetector(
                  onTap: () {
                    OneContext().pop();
                  },
                  child: Container(
                    height: 40,
                    width: 40,
                    margin: const EdgeInsets.only(bottom: 430, left: 20),
                    decoration: const BoxDecoration(
                      shape: BoxShape.circle,
                      color: ThemeColors.clrBlack70,
                    ),
                    child: const Icon(
                      Icons.arrow_back,
                      color: ThemeColors.clrWhite,
                    ),
                  ),
                ),
              ],
            ),
            BlocBuilder<PostDetailCubit, PostDetailState>(
              builder: (context, state) {
                debugPrint("PostCommentsList b 0 -> $state");
                if (state is PostDetailInitial ||
                    state is PostCommentDataLoading) {
                  return Container(
                    margin: const EdgeInsets.only(top: 50),
                    child: const Center(child: CircularProgressIndicator()),
                  );
                } else if (state is PostCommentDataLoaded ||
                    state is ChangeShowItem) {
                  if (state is PostCommentDataLoaded) {
                    debugPrint(
                      "PostCommentsList -> ${state.postCommentList.length}",
                    );
                    postCommentList
                      ..clear()
                      ..addAll(state.postCommentList);
                    debugPrint(
                      "PostCommentsList -> ${postCommentList.length}",
                    );
                  }

                  return _buildPosts(
                    postCommentList,
                    isLess: (state is ChangeShowItem) ? state.isLess : true,
                  );
                }
                return Container(
                  margin: const EdgeInsets.only(top: 50),
                  child: const Center(child: CircularProgressIndicator()),
                );
              },
            ),
          ],
        ),
      ),
    );
  }

  Widget _buildPosts(List<PostComment> postCommentList, {bool isLess = true}) {
    return Column(
      children: [
        ListView.separated(
          shrinkWrap: true,
          physics: const NeverScrollableScrollPhysics(),
          padding: const EdgeInsets.fromLTRB(20, 20, 20, 0),
          itemCount: (postCommentList.length < 3 || !isLess)
              ? postCommentList.length
              : 3,
          separatorBuilder: (context, index) {
            return const Divider(height: 1, color: ThemeColors.clrGrey);
          },
          itemBuilder: (context, index) {
            final postComment = postCommentList[index];
            return PostCommentItem(
              postComment: postComment,
              onDelete: () {
                postDetailCubit.removePostComment(index);
              },
            );
          },
        ),
        if (postCommentList.isEmpty)
          Container(
            margin: const EdgeInsets.only(top: 25),
            child: const Text(
              "No Comments",
              style: TextStyle(fontSize: 16, color: ThemeColors.clrBlack),
            ),
          ),
        if (postCommentList.length >= 3)
          const Padding(
            padding: EdgeInsets.only(left: 20, right: 20),
            child: Divider(height: 1, color: ThemeColors.clrGrey),
          ),
        if (postCommentList.length >= 3)
          GestureDetector(
            onTap: () {
              postDetailCubit.changeShowItem();
            },
            child: Container(
              color: ThemeColors.clrTransparent,
              margin: const EdgeInsets.only(top: 10, bottom: 20),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Text(
                    isLess
                        ? StringConstants.strShowMore
                        : StringConstants.strShowLess,
                    style: const TextStyle(
                      fontSize: 14,
                      color: ThemeColors.clrBlack,
                    ),
                  ),
                  Icon(
                    isLess ? Icons.arrow_drop_down : Icons.arrow_drop_up,
                  ),
                ],
              ),
            ),
          ),
      ],
    );
  }
}
