# MovieMate

This is a Flutter app designed to display a list of movies, with functionality to search, view details, and navigate between different screens. The app uses the TVMaze API to fetch movie data.

## Screens

### 1. Splash Screen
- A simple splash screen with an appropriate image to represent the theme of the app.
- Displays briefly before navigating to the Home Screen.

### 2. Home Screen
- Displays a list of movies fetched from the following API:
    - API Endpoint: `https://api.tvmaze.com/search/shows?q=all`
- Each movie is displayed with:
    - Thumbnail Image
    - Title
    - Summary
- Clicking on any movie navigates to the Details Screen.

### 3. Search Screen
- Contains a search bar that allows users to search for movies.
- Fetches and displays movie data based on the search term using the following API:
    - API Endpoint: `https://api.tvmaze.com/search/shows?q=${search_term}`
- Displays search results similarly to the Home Screen.

### 4. Details Screen
- Displays detailed information about the selected movie:
    - Image
    - Title
    - Summary
    - Other available movie details

### 5. Bottom Navigation
- Bottom navigation is used for seamless navigation between the Home Screen and the Search Screen.

## UI Design
- The UI is inspired by Netflix, providing a user-friendly layout for browsing movies.
- The app is responsive, designed for both mobile and tablet devices.

## Features
- Home screen displays a list of movies with images, titles, and summaries.
- Search functionality allows users to find movies by name.
- A detailed view of each movie is accessible by clicking on its thumbnail.
- Bottom navigation for easy switching between Home and Search screens.

## Technologies Used
- **Flutter SDK**: Used for mobile development.
- **TVMaze API**: Fetches movie data for the app.

## Acknowledgments
- **TVMaze API**: For providing free movie data.
- **Inspired by Netflix's UI**: For the design and user experience.
