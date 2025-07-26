import 'package:flutter/material.dart';

class FavoriteScreen extends StatefulWidget {
  const FavoriteScreen({super.key});

  @override
  State<FavoriteScreen> createState() => _FavoriteScreenState();
}

class _FavoriteScreenState extends State<FavoriteScreen> {
  final List<String> favorites = [];

  void _addFavorite() {
    setState(() {
      favorites.add('New favorite book #${favorites.length + 1}');
    });

    ScaffoldMessenger.of(context).showSnackBar(
      const SnackBar(content: Text('Favorite added!')),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Favorites'),
        backgroundColor: Colors.lightGreen,
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: _addFavorite,
        backgroundColor: Colors.lightGreen,
        child: const Icon(Icons.add),
      ),
      body: SafeArea(
        child: SingleChildScrollView(
          child: Column(
            children: [
              Container(
                height: MediaQuery.of(context).size.height * 0.3,
                color: Colors.grey[300],
                child: InkWell(
                  onTap: () {
                    ScaffoldMessenger.of(context).showSnackBar(
                      const SnackBar(content: Text('Tapped Favorite Book!')),
                    );
                  },
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.start,
                    children: [
                      const CircleAvatar(
                        radius: 64,
                        backgroundColor: Colors.lightGreenAccent,
                        child: Icon(Icons.book, size: 40, color: Colors.white),
                      ),
                      const SizedBox(height: 12),
                      Text(
                        'Favorite Books',
                        style: Theme.of(context).textTheme.bodyMedium?.copyWith(
                              color: Colors.lightGreen,
                              fontWeight: FontWeight.bold,
                            ),
                      ),
                    ],
                  ),
                ),
              ),
              const SizedBox(height: 20),
              // Display the list of favorites
              ListView.builder(
                shrinkWrap: true,
                physics: const NeverScrollableScrollPhysics(),
                itemCount: favorites.length,
                itemBuilder: (context, index) {
                  return ListTile(
                    leading: const Icon(Icons.star, color: Colors.lightGreen),
                    title: Text(favorites[index]),
                  );
                },
              ),
            ],
          ),
        ),
      ),
    );
  }
}
