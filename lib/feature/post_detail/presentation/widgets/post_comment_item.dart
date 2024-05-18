import 'package:flutter/material.dart';
import 'package:take_home/core/constants/theme_constants.dart';
import 'package:take_home/core/utils/utils.dart';
import 'package:take_home/feature/post_detail/domain/entity/post_comment.dart';

class PostCommentItem extends StatelessWidget {
  const PostCommentItem({required this.postComment, super.key});

  final PostComment postComment;

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () {},
      child: Card(
        child: Container(
          padding: const EdgeInsets.all(15),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            mainAxisAlignment: MainAxisAlignment.center,
            mainAxisSize: MainAxisSize.min,
            children: [
              Text(
                postComment.body,
                style: const TextStyle(
                  fontSize: 14,
                  color: ThemeColors.clrBlack,
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
