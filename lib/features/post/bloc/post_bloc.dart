import 'dart:async';
import 'dart:convert';

import 'package:e_commerce/features/post/models/post_data_UI_model.dart';
import 'package:e_commerce/features/post/repos/posts_repos.dart';
import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;
import 'package:bloc/bloc.dart';
import 'package:meta/meta.dart';

part 'post_event.dart';
part 'post_state.dart';

class PostBloc extends Bloc<PostEvent, PostState> {
  PostBloc() : super(PostInitial()) {
    on<PostInitialFetchEvent>(postInitialFetchEvent);
    on<PostsAddEvent>(postAddEvent);
  }

  FutureOr<void> postInitialFetchEvent(PostInitialFetchEvent event, Emitter<PostState> emit) async {
    emit(PostLoadingState());
    List<PostDataUIModel> posts = await PostsRepo.getPosts();
    emit(PostFetchingSuccessState(posts: posts));
  }
  Future<void> postAddEvent(PostsAddEvent event, Emitter<PostState> emit) async {
    bool success = await PostsRepo.addPost();
    print(success);
    if(success) {
      emit(PostAdditionSuccessState());
    } else {
      emit(PostAdditionErrorState());
    }
  }

}
