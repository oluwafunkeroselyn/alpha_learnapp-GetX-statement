import 'package:flutter/material.dart';
import 'package:get/get.dart';

class MovieScreen extends StatelessWidget {
  MovieScreen({super.key});
  final List<String> movies = <String> [].obs;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text('Movies',
      style: TextStyle(
        fontWeight: FontWeight.bold),
      ),
      centerTitle: true,
      ),
      body: Obx(() {
      return  Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              const SizedBox(height: 20),
              const Padding(
              padding: EdgeInsets.symmetric(horizontal: 16),
            child:     Text('Movie Content',
            style: TextStyle(fontSize: 16,
            fontWeight: FontWeight.w600,
            fontFamily: 'Product Sans'),
            ),
        ),
        const SizedBox(height: 20),
        Expanded(child: movies.isEmpty?
        Center(child:Column(
          mainAxisSize: MainAxisSize.min,
          children: [
            const SizedBox(height: 20),
          const Text('No movies available',
          style: TextStyle(
            fontSize: 18,
            fontWeight: FontWeight.w500,
          ),
          ),
         const SizedBox(height: 20),
          ],
          ),
          )
          : ListView.builder(
            padding: EdgeInsets.symmetric(horizontal: 16),
            itemCount: movies.length,
            itemBuilder: (context,index){
              return Card(
                child: ListTile(
                  title: Text(movies[index]),
                ),
              );
            },
            ),
          ),
            ],
      );
      }),
      floatingActionButton: FloatingActionButton(
        onPressed: (){
          movies.add('New movie added');
  },
  child: Icon(Icons.add),
      ),
  );
  }
            }
      