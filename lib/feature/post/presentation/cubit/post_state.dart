part of 'post_cubit.dart';

abstract class PostsState extends Equatable {
  const PostsState();
}

class PostInitial extends PostsState {
  @override
  List<Object?> get props => [];
}

class PostDataLoading extends PostsState {
  @override
  List<Object?> get props => [];
}

class PostDataLoaded extends PostsState {
  const PostDataLoaded({required this.postList});

  final List<Post> postList;

  @override
  List<Object?> get props => [postList];
}

class PostDataFailed extends PostsState {
  const PostDataFailed({required this.error});

  final String error;

  @override
  List<Object?> get props => [error];
}
