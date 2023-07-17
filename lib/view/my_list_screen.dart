import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:provider_practise/providers/movie_provider.dart';

class MyListScreen extends StatefulWidget {
  const MyListScreen({super.key});

  @override
  State<MyListScreen> createState() => _MyListScreenState();
}

class _MyListScreenState extends State<MyListScreen> {
  @override
  Widget build(BuildContext context) {
    final showMyList = context.watch<MovieProvider>().myList;
    return Scaffold(
        appBar: AppBar(title: Text("My List (${showMyList.length})")),
        body: ListView.builder(
          itemBuilder: (_, index) {
            final currentMovie = showMyList[index];
            return Container(
              decoration: const BoxDecoration(
                  color: Colors.blue,
                  borderRadius: BorderRadius.all(Radius.circular(5))),
              height: 70,
              margin: const EdgeInsets.symmetric(vertical: 5, horizontal: 10),
              width: double.infinity,
              child: ListTile(
                  title: Text(currentMovie.title!,
                      style: const TextStyle(
                        color: Colors.black,
                      )),
                  subtitle: Text(
                    currentMovie.duration ?? "",
                    style: const TextStyle(color: Colors.black, fontSize: 20),
                  ),
                  trailing: TextButton(
                    child: const Text(
                      "Remove",
                      style: TextStyle(color: Colors.red),
                    ),
                    onPressed: () {
                      context
                          .read<MovieProvider>()
                          .removeFromList(currentMovie);
                    },
                  )),
            );
          },
          itemCount: showMyList.length,
        ));
  }
}
