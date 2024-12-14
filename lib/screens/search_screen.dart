import 'package:flutter/material.dart';
import '../services/tv_maze_service.dart';
import '../models/show_model.dart';
import '../widgets/show_card.dart';
import '../widgets/bottom_navigation.dart';

class SearchScreen extends StatefulWidget {
  const SearchScreen({super.key});

  @override
  _SearchScreenState createState() => _SearchScreenState();
}

class _SearchScreenState extends State<SearchScreen> {
  List<Show> shows = [];
  bool isLoading = false;
  final TextEditingController _searchController = TextEditingController();

  Future<void> _searchShows(String query) async {
    if (query.isEmpty) {
      setState(() {
        shows.clear();
      });
      return;
    }

    setState(() {
      isLoading = true;
    });

    try {
      final fetchedShows = await TvMazeService.searchShows(query);
      setState(() {
        shows = fetchedShows;
        isLoading = false;
      });
    } catch (e) {
      setState(() {
        isLoading = false;
      });
      ScaffoldMessenger.of(context).showSnackBar(
        const SnackBar(content: Text('Failed to search shows')),
      );
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: TextField(
          controller: _searchController,
          decoration: const InputDecoration(
            hintText: 'Search movies...',
            prefixIcon: Icon(Icons.search, color: Colors.white), // Magnifying glass icon
            border: InputBorder.none,
          ),
          style: const TextStyle(color: Colors.white),
          onChanged: _searchShows, // Call _searchShows every time the text changes
        ),
        backgroundColor: Colors.black,
      ),
      body: isLoading
          ? const Center(child: CircularProgressIndicator())
          : shows.isEmpty
          ? const Center(
        child: Text(
          'No results found',
          style: TextStyle(color: Colors.white, fontSize: 18),
        ),
      )
          : GridView.builder(
        gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
          crossAxisCount: 2,
          childAspectRatio: 0.7,
          crossAxisSpacing: 10,
          mainAxisSpacing: 10,
        ),
        itemCount: shows.length,
        itemBuilder: (context, index) {
          return ShowCard(
            show: shows[index],
            onTap: () {
              Navigator.pushNamed(
                context,
                '/details',
                arguments: shows[index],
              );
            },
          );
        },
      ),
      bottomNavigationBar: const CustomBottomNavigationBar(currentIndex: 1),
    );
  }
}
