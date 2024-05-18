import 'package:flutter/material.dart';
import 'package:one_context/one_context.dart';
import 'package:take_home/core/constants/string_constants.dart';
import 'package:take_home/core/constants/theme_constants.dart';
import 'package:take_home/feature/post/domain/entity/post.dart';
import 'package:take_home/feature/post_detail/presentation/pages/post_detail_page.dart';

class PostItem extends StatelessWidget {
  const PostItem({required this.post, required this.onDelete, super.key});

  final Post post;
  final Function() onDelete;

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () {
        OneContext().pushNamed(
          Routes.postDetailPage,
          arguments: PostDetailArguments(post: post),
        );
      },
      child: Card(
        child: Container(
          padding: const EdgeInsets.all(15),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            mainAxisAlignment: MainAxisAlignment.center,
            mainAxisSize: MainAxisSize.min,
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
                        image: AssetImage(post.userImage!),
                        fit: BoxFit.cover,
                      ),
                    ),
                  ),
                  const Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(
                        "Test",
                        style: TextStyle(
                          fontWeight: FontWeight.bold,
                          fontSize: 16,
                        ),
                      ),
                      Text(
                        "2 hours ago",
                        style:
                            TextStyle(fontSize: 14, color: ThemeColors.clrGrey),
                      ),
                    ],
                  ),
                  const Spacer(),
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
                  )
                ],
              ),
              const SizedBox(height: 10),
              Text(post.title, style: const TextStyle(fontSize: 16)),
              const SizedBox(height: 5),
              Text(
                post.body,
                style: const TextStyle(
                  fontSize: 14,
                  color: ThemeColors.clrGrey,
                ),
              ),
              const SizedBox(height: 10),
              Container(
                clipBehavior: Clip.antiAlias,
                decoration:
                    BoxDecoration(borderRadius: BorderRadius.circular(5)),
                child: Image.asset(post.postImage!),
              ),
              const SizedBox(height: 5),
            ],
          ),
        ),
      ),
    );
  }
}
