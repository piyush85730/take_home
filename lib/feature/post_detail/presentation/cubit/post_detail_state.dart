part of 'post_detail_cubit.dart';

abstract class PostDetailState extends Equatable {
  const PostDetailState();
}

class PostDetailInitial extends PostDetailState {
  @override
  List<Object?> get props => [];
}

class PostCommentDataLoading extends PostDetailState {
  @override
  List<Object?> get props => [];
}

class PostCommentDataLoaded extends PostDetailState {
  const PostCommentDataLoaded({required this.postCommentList});

  final List<PostComment> postCommentList;

  @override
  List<Object?> get props => [postCommentList];
}

class PostCommentDataFailed extends PostDetailState {
  const PostCommentDataFailed({required this.error});

  final String error;

  @override
  List<Object?> get props => [error];
}

class ChangeShowItem extends PostDetailState {
  const ChangeShowItem({required this.isLess});

  final bool isLess;

  @override
  List<Object?> get props => [isLess];
}
