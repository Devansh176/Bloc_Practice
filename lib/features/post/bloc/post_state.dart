part of 'post_bloc.dart';

@immutable
sealed class PostState {} //for builders

abstract class PostActionState extends PostState {
} //for listeners

final class PostInitial extends PostState {}

class PostLoadingState extends PostState {
}

class PostFetchingSuccessState extends PostState {
  final List<PostDataUIModel> posts;
  PostFetchingSuccessState({required this.posts});
}

class PostFetchingErrorState extends PostState {
  final String errorMessage;
  PostFetchingErrorState({required this.errorMessage});
}

class PostAdditionSuccessState extends PostActionState {
}

class PostAdditionErrorState extends PostActionState {
}