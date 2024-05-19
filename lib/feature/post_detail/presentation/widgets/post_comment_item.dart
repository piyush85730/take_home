import 'package:flutter/material.dart';
import 'package:take_home/core/constants/theme_constants.dart';
import 'package:take_home/core/utils/utils.dart';
import 'package:take_home/feature/post_detail/domain/entity/post_comment.dart';

class PostCommentItem extends StatelessWidget {
  const PostCommentItem({
    required this.postComment,
    required this.onDelete,
    super.key,
  });

  final PostComment postComment;
  final Function() onDelete;

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.only(top: 10, bottom: 5),
      child: Row(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Container(
            height: 40,
            width: 40,
            margin: const EdgeInsets.only(right: 10),
            decoration: BoxDecoration(
              shape: BoxShape.circle,
              image: DecorationImage(
                image: AssetImage(getRandomUserImage()),
                fit: BoxFit.cover,
              ),
            ),
          ),
          Expanded(
            child: Text(
              postComment.body,
              style: const TextStyle(fontSize: 14, color: ThemeColors.clrBlack),
            ),
          ),
          PopupMenuButton(
            onSelected: (value) {
              onDelete();
            },
            itemBuilder: (bc) {
              return const [
                PopupMenuItem(
                  value: '/delete',
                  child: Text("Delete"),
                ),
              ];
            },
          ),
        ],
      ),
    );
  }
}
