import 'package:e_commerce/features/post/bloc/post_bloc.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class PostPage extends StatefulWidget {
  const PostPage({super.key});

  @override
  State<PostPage> createState() => _PostPageState();
}

class _PostPageState extends State<PostPage> {

  final PostBloc postBloc = PostBloc();

  @override
  void initState() {
    postBloc.add(PostInitialFetchEvent());
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.lightGreen,
        title: Text("Posts Page",
          style: TextStyle(
            color: Colors.black,
            fontWeight: FontWeight.bold,
            fontSize: 23,
          ),
        ),
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: () {
          postBloc.add(PostsAddEvent());
        },
        child: Icon(
          Icons.add,
          color: Colors.black,
        ),
      ),
      body: BlocConsumer<PostBloc, PostState>(
        bloc: postBloc,
        listenWhen: (previous, current) => current is PostActionState,
        buildWhen: (previous, current) => current is PostFetchingSuccessState || current is !PostActionState,
        listener: (context, state) {},
        builder: (context, state) {
          switch(state.runtimeType) {
            case PostLoadingState :
              return Center(child: CircularProgressIndicator(color: Colors.lightGreen,),);
            case PostFetchingErrorState :
              return ScaffoldMessenger(child: SnackBar(content: Text("Error fetching Data"),),);
            case PostFetchingSuccessState :
              final successState = state as PostFetchingSuccessState;
              return ListView.builder(
                itemCount: successState.posts.length,
                itemBuilder: (context, index) {
                  return Container(
                    color: Colors.lightGreen[50],
                    padding: EdgeInsets.all(16),
                    margin: EdgeInsets.all(16),
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text(successState.posts[index].title),
                        Text(successState.posts[index].body),
                      ],
                    ),
                  );
                },
              );
            default:
              return Container();
          }
        },
      ),
    );
  }
}
