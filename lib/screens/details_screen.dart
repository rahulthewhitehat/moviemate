// screens/details_screen.dart
import 'package:flutter/material.dart';
import '../models/show_model.dart';

class DetailsScreen extends StatelessWidget {
  const DetailsScreen({super.key});

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
                      style: const TextStyle(
                        fontSize: 24,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                    const SizedBox(height: 10),
                    Row(
                      children: [
                        Text(
                          show.type,
                          style: const TextStyle(
                            fontSize: 16,
                            color: Colors.grey,
                          ),
                        ),
                        const SizedBox(width: 10),
                        const Text(
                          '•',
                          style: TextStyle(color: Colors.grey),
                        ),
                        const SizedBox(width: 10),
                        Text(
                          show.status,
                          style: const TextStyle(
                            fontSize: 16,
                            color: Colors.grey,
                          ),
                        ),
                      ],
                    ),
                    if (show.premiered != null) ...[
                      const SizedBox(height: 10),
                      Text(
                        'Premiered: ${show.premiered}',
                        style: const TextStyle(
                          fontSize: 16,
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                    ],
                    if (show.networkName != null) ...[
                      const SizedBox(height: 10),
                      Text(
                        'Network: ${show.networkName}',
                        style: const TextStyle(
                          fontSize: 16,
                        ),
                      ),
                    ],
                    if (show.scheduleTime != null) ...[
                      const SizedBox(height: 10),
                      Text(
                        'Scheduled at: ${show.scheduleTime} on ${show.scheduleDays?.join(', ')}',
                        style: const TextStyle(
                          fontSize: 16,
                        ),
                      ),
                    ],
                    const SizedBox(height: 10),
                    Text(
                      'Genres: ${show.genres.join(', ')}',
                      style: const TextStyle(
                        fontSize: 16,
                      ),
                    ),
                    if (show.rating != null) ...[
                      const SizedBox(height: 10),
                      Row(
                        children: [
                          const Icon(Icons.star, color: Colors.amber),
                          const SizedBox(width: 5),
                          Text(
                            show.rating.toString(),
                            style: const TextStyle(
                              fontSize: 16,
                              fontWeight: FontWeight.bold,
                            ),
                          ),
                        ],
                      ),
                    ],
                    const SizedBox(height: 20),
                    const Text(
                      'Summary',
                      style: TextStyle(
                        fontSize: 18,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                    const SizedBox(height: 10),
                    Text(
                      show.summary ?? 'No summary available',
                      style: const TextStyle(
                        fontSize: 16,
                      ),
                    ),
                    if (show.officialSite != null) ...[
                      const SizedBox(height: 20),
                      const Text(
                        'Official Site',
                        style: TextStyle(
                          fontSize: 18,
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                      const SizedBox(height: 10),
                      Text(
                        show.officialSite!,
                        style: const TextStyle(
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
