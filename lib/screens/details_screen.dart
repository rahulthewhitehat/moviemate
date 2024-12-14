// screens/details_screen.dart
import 'package:flutter/material.dart';
import '../models/show_model.dart';

class DetailsScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    final Show show = ModalRoute.of(context)!.settings.arguments as Show;

    return Scaffold(
      body: CustomScrollView(
        slivers: [
          SliverAppBar(
            expandedHeight: 500,
            flexibleSpace: FlexibleSpaceBar(
              background: Image.network(
                show.originalImageUrl ?? 'https://via.placeholder.com/300x400',
                fit: BoxFit.cover,
              ),
            ),
          ),
          SliverList(
            delegate: SliverChildListDelegate([
              Padding(
                padding: const EdgeInsets.all(16.0),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      show.name,
                      style: TextStyle(
                        fontSize: 24,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                    SizedBox(height: 10),
                    Row(
                      children: [
                        Text(
                          show.type,
                          style: TextStyle(
                            fontSize: 16,
                            color: Colors.grey,
                          ),
                        ),
                        SizedBox(width: 10),
                        Text(
                          '•',
                          style: TextStyle(color: Colors.grey),
                        ),
                        SizedBox(width: 10),
                        Text(
                          show.status,
                          style: TextStyle(
                            fontSize: 16,
                            color: Colors.grey,
                          ),
                        ),
                      ],
                    ),
                    if (show.premiered != null) ...[
                      SizedBox(height: 10),
                      Text(
                        'Premiered: ${show.premiered}',
                        style: TextStyle(
                          fontSize: 16,
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                    ],
                    if (show.networkName != null) ...[
                      SizedBox(height: 10),
                      Text(
                        'Network: ${show.networkName}',
                        style: TextStyle(
                          fontSize: 16,
                        ),
                      ),
                    ],
                    if (show.scheduleTime != null) ...[
                      SizedBox(height: 10),
                      Text(
                        'Scheduled at: ${show.scheduleTime} on ${show.scheduleDays?.join(', ')}',
                        style: TextStyle(
                          fontSize: 16,
                        ),
                      ),
                    ],
                    SizedBox(height: 10),
                    Text(
                      'Genres: ${show.genres.join(', ')}',
                      style: TextStyle(
                        fontSize: 16,
                      ),
                    ),
                    if (show.rating != null) ...[
                      SizedBox(height: 10),
                      Row(
                        children: [
                          Icon(Icons.star, color: Colors.amber),
                          SizedBox(width: 5),
                          Text(
                            show.rating.toString(),
                            style: TextStyle(
                              fontSize: 16,
                              fontWeight: FontWeight.bold,
                            ),
                          ),
                        ],
                      ),
                    ],
                    SizedBox(height: 20),
                    Text(
                      'Summary',
                      style: TextStyle(
                        fontSize: 18,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                    SizedBox(height: 10),
                    Text(
                      show.summary ?? 'No summary available',
                      style: TextStyle(
                        fontSize: 16,
                      ),
                    ),
                    if (show.officialSite != null) ...[
                      SizedBox(height: 20),
                      Text(
                        'Official Site',
                        style: TextStyle(
                          fontSize: 18,
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                      SizedBox(height: 10),
                      Text(
                        show.officialSite!,
                        style: TextStyle(
                          fontSize: 16,
                          color: Colors.blue,
                        ),
                      ),
                    ],
                  ],
                ),
              ),
            ]),
          ),
        ],
      ),
    );
  }
}
