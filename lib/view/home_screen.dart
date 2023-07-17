import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:provider_practise/providers/movie_provider.dart';
import 'package:provider_practise/view/my_list_screen.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({super.key});

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  @override
  Widget build(BuildContext context) {
    var getMovies = context.watch<MovieProvider>().getMovies;
    var getMyList = context.watch<MovieProvider>().getMyList;
    return Scaffold(
        appBar: AppBar(
          title: const Text("Provider"),
        ),
        body: Column(
          crossAxisAlignment: CrossAxisAlignment.stretch,
          children: [
            ElevatedButton.icon(
                onPressed: () {
                  Navigator.push(context,
                      MaterialPageRoute(builder: (context) => MyListScreen()));
                },
                icon: const Icon(Icons.favorite),
                label: Text(
                  "Go to my list(${getMyList.length})",
                  style: const TextStyle(
                    fontSize: 24,
                  ),
                ),
                style: ElevatedButton.styleFrom(
                    backgroundColor: Colors.red,
                    padding: const EdgeInsets.symmetric(vertical: 20))),
            const SizedBox(
              height: 30,
            ),
            Expanded(
              child: ListView.builder(
                itemBuilder: (_, index) {
                  final currentMovie = getMovies[index];
                  return Container(
                    decoration: const BoxDecoration(
                        color: Colors.blue,
                        borderRadius: BorderRadius.all(Radius.circular(5))),
                    height: 70,
                    margin:
                        const EdgeInsets.symmetric(vertical: 5, horizontal: 10),
                    width: double.infinity,
                    child: ListTile(
                        title: Text(currentMovie.title!,
                            style: const TextStyle(
                                color: Colors.black,
                                fontWeight: FontWeight.bold)),
                        subtitle: Text(
                          currentMovie.duration ?? "No Information",
                          style: const TextStyle(
                              color: Colors.black, fontWeight: FontWeight.bold),
                        ),
                        trailing: IconButton(
                          icon: Icon(
                            Icons.favorite,
                            color: getMyList.contains(currentMovie)
                                ? Colors.red
                                : Colors.white,
                            size: 30,
                          ),
                          onPressed: () {
                            if (!getMyList.contains(currentMovie)) {
                              context
                                  .read<MovieProvider>()
                                  .addToList(currentMovie);
                            } else {
                              context
                                  .read<MovieProvider>()
                                  .removeFromList(currentMovie);
                            }
                          },
                        )),
                  );
                },
                itemCount: getMovies.length,
              ),
            )
          ],
        ));
  }
}
