import 'package:flutter/material.dart';
import 'package:take_home/feature/post/domain/entity/post.dart';

class PostItem extends StatelessWidget {
  const PostItem({required this.post, super.key});

  final Post post;

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () {},
      child: Card(
        child: Container(
          padding: const EdgeInsets.all(8),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            mainAxisAlignment: MainAxisAlignment.center,
            mainAxisSize: MainAxisSize.min,
            children: [
              Text(
                post.title,
                maxLines: 5,
                softWrap: true,
              ),
              const SizedBox(height: 5),

            ],
          ),
        ),
      ),
    );
  }
}