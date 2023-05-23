import 'package:cached_network_image/cached_network_image.dart';
import 'package:demo/bloc/product_bloc.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

void main() async {

  runApp(MultiBlocProvider(providers: [
    BlocProvider(create: (context) => ProductBloc()),
  ], child: const MyApp()));

}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return const MaterialApp(
      home: SearchProductPage(),
    );
  }
}

class SearchProductPage extends StatefulWidget {
  const SearchProductPage({Key? key}) : super(key: key);

  @override
  State<SearchProductPage> createState() => _SearchProductPageState();
}

class _SearchProductPageState extends State<SearchProductPage> {

  @override
  void initState() {
    context.read<ProductBloc>().add( const GetProductEvent());
    super.initState();
  }
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          // backgroundColor: Colors.grey,
          backgroundColor: Colors.teal, //sửa 2
          title: Container(
            child: TextButton(onPressed: () {
            },
              child: const Text("123123"),
            ),
          ),
        ),
        body: BlocBuilder<ProductBloc, ProductState>(
          builder: (context, state) {
            if(state is ProductInitial){
              return const Placeholder();
            }else if( state is ProductLoadingState ){
              return Center(child: const CircularProgressIndicator());
            }else if(state is ProductLoadedState){
              final list = state.list;
              return ListView.builder(
                itemCount: state.list.length,
                itemBuilder: (context, index) {
                  final product = list[index];
                  return Column(
                    children: [
                      CachedNetworkImage(imageUrl: product.image,
                        placeholder:(context, url) => const CircularProgressIndicator(),
                      errorWidget: (context, url, error) => const Icon(Icons.error),),
                      Text(product.name),
                      Text(product.id),
                      Text(product.color),

                    ],
                  );
              },);
            }
            else if(state is ProductErrorState){
              return Text(state.err);
            }else{
              return const Text("qeweq");
            }
          },
        )


    );
  }
}

