import 'package:flutter/material.dart';
import 'package:take_home/core/constants/string_constants.dart';
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
          Expanded(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Row(
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
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Text(
                            postComment.name,
                            maxLines: 1,
                            overflow: TextOverflow.ellipsis,
                            style: const TextStyle(
                              fontWeight: FontWeight.bold,
                              fontSize: 16,
                            ),
                          ),
                          Text(
                            postComment.email,
                            style: const TextStyle(
                              fontSize: 14,
                              color: ThemeColors.clrGrey,
                            ),
                          ),
                        ],
                      ),
                    ),
                  ],
                ),
                Container(
                  width: double.maxFinite,
                  margin: const EdgeInsets.only(top: 5, left: 50),
                  child: Text(
                    postComment.body,
                    style: const TextStyle(
                      fontSize: 14,
                      color: ThemeColors.clrBlack,
                    ),
                  ),
                ),
              ],
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
                  child: Text(StringConstants.strDelete),
                ),
              ];
            },
          ),
        ],
      ),
    );
  }
}
