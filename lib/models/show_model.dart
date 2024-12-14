class Show {
  final int id;
  final String name;
  final String? summary;
  final String? mediumImageUrl;
  final String? originalImageUrl;
  final double? rating;
  final List<String> genres;
  final String type;
  final String status;
  final String? officialSite;
  final String language;
  final String? premiered;
  final String? networkName;
  final String? scheduleTime;
  final List<String>? scheduleDays;

  Show({
    required this.id,
    required this.name,
    this.summary,
    this.mediumImageUrl,
    this.originalImageUrl,
    this.rating,
    this.genres = const [],
    required this.type,
    required this.status,
    this.officialSite,
    required this.language,
    this.premiered,
    this.networkName,
    this.scheduleTime,
    this.scheduleDays,
  });

  factory Show.fromJson(Map<String, dynamic> json) {
    final show = json['show'] ?? json;
    return Show(
      id: show['id'],
      name: show['name'] ?? 'Unknown Title',
      summary: show['summary']?.replaceAll(RegExp(r'<[^>]*>'), ''),
      mediumImageUrl: show['image']?['medium'] ?? 'https://via.placeholder.com/210x295',
      originalImageUrl: show['image']?['original'] ?? 'https://via.placeholder.com/300x400',
      rating: show['rating']?['average']?.toDouble(),
      genres: List<String>.from(show['genres'] ?? []),
      type: show['type'] ?? 'Unknown',
      status: show['status'] ?? 'Unknown',
      officialSite: show['officialSite'],
      language: show['language'] ?? 'Unknown',
      premiered: show['premiered'],
      networkName: show['network']?['name'],
      scheduleTime: show['schedule']?['time'],
      scheduleDays: List<String>.from(show['schedule']?['days'] ?? []),
    );
  }
}
