import 'package:flutter/material.dart';
import '../services/tv_maze_service.dart';
import '../models/show_model.dart';
import '../widgets/show_card.dart';
import '../widgets/bottom_navigation.dart';

class SearchScreen extends StatefulWidget {
  @override
  _SearchScreenState createState() => _SearchScreenState();
}

class _SearchScreenState extends State<SearchScreen> {
  List<Show> shows = [];
  bool isLoading = false;
  TextEditingController _searchController = TextEditingController();

  Future<void> _searchShows(String query) async {
    if (query.isEmpty) return;

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
        SnackBar(content: Text('Failed to search shows')),
      );
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: TextField(
          controller: _searchController,
          decoration: InputDecoration(
            hintText: 'Search movies...',
            border: InputBorder.none,
          ),
          onSubmitted: _searchShows,
        ),
        backgroundColor: Colors.black,
      ),
      body: isLoading
          ? Center(child: CircularProgressIndicator())
          : GridView.builder(
        gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
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
                  arguments: shows[index]
              );
            },
          );
        },
      ),
      bottomNavigationBar: CustomBottomNavigationBar(currentIndex: 1),
    );
  }
}