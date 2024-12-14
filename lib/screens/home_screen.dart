import 'package:flutter/material.dart';
import '../services/tv_maze_service.dart';
import '../models/show_model.dart';
import '../widgets/show_card.dart';
import '../widgets/bottom_navigation.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({super.key});

  @override
  _HomeScreenState createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  List<Show> shows = [];
  bool isLoading = true;

  @override
  void initState() {
    super.initState();
    _loadShows();
  }

  Future<void> _loadShows() async {
    try {
      final fetchedShows = await TvMazeService.searchShows('all');
      setState(() {
        shows = fetchedShows;
        isLoading = false;
      });
    } catch (e) {
      setState(() {
        isLoading = false;
      });
      ScaffoldMessenger.of(context).showSnackBar(
        const SnackBar(content: Text('Failed to load shows')),
      );
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Row(
          children: [
            Image.asset(
              'assets/logo.png', // Path to your logo image
              height: 30, // Small size for the logo
            ),
            const SizedBox(width: 10), // Space between logo and title
            const Text(
              'MovieMate',
              style: TextStyle(color: Colors.red),
            ),
          ],
        ),
        backgroundColor: Colors.black,
        actions: [
          IconButton(
            icon: const Icon(Icons.search, color: Colors.red,),
            onPressed: () {
              Navigator.pushNamed(context, '/search');
            },
          ),
        ],
      ),
      body: isLoading
          ? const Center(child: CircularProgressIndicator())
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
      bottomNavigationBar: const CustomBottomNavigationBar(currentIndex: 0),
    );
  }
}
