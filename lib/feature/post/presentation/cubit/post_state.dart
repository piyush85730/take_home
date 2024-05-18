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

class DeleteDataLoading extends PostsState {
  @override
  List<Object?> get props => [];
}

class DeleteDataSuccess extends PostsState {
  const DeleteDataSuccess({required this.isDeleted});

  final bool isDeleted;

  @override
  List<Object?> get props => [isDeleted];
}

class DeleteDataFailed extends PostsState {
  const DeleteDataFailed({required this.error});

  final String error;

  @override
  List<Object?> get props => [error];
}
