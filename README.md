![Screenshot_20240527_202916](https://github.com/Ajay-2022-Soft-Tech/news_api/assets/113298640/98374a0e-a6e4-4cc8-96ee-78b6aabf7daa)![Screenshot_20240527_202916](https://github.com/Ajay-2022-Soft-Tech/news_api/assets/113298640/596d2e85-8c83-401d-b59f-7645af7ad6d6)News App
Description
This News App is a modern and dynamic news application built using Flutter, providing users with the latest news headlines from various sources. The app allows users to filter news based on different categories and news channels, offering a personalized news reading experience. The app also features a sleek and user-friendly interface, ensuring a smooth navigation experience.



Technologies Used
Flutter: The primary framework used for developing the cross-platform mobile application.
Dart: The programming language used with Flutter.
CachedNetworkImage: For efficient image loading and caching.
Flutter Spinkit: For providing loading indicators.
Google Fonts: For custom fonts.
Intl: For date formatting.
News API: The backend API used for fetching news articles.
Features
News Filtering: Users can filter news articles by different news channels like BBC News, BBC Sports, and Al Jazeera.
Categories: News articles are categorized into different sections for easy access.
Detail View: Users can tap on a news article to view detailed information.
Dynamic UI: The app dynamically loads images and text, providing a responsive and engaging user experience.
Offline Caching: Images are cached for offline viewing.
Methods Used
FutureBuilder: Used to fetch and display data asynchronously.
CachedNetworkImage: Ensures images are loaded efficiently with caching support.
ListView.builder: Used for rendering lists of news articles dynamically.
Navigator: For navigation between screens.
PopupMenuButton: For the filter options in the AppBar.
How to Run
Clone the Repository:

sh
Copy code
git clone https://github.com/yourusername/news_app.git
cd news_app
Install Dependencies:

sh
Copy code
flutter pub get
Set Up API Key:

Obtain an API key from News API.
Create a file named api_key.dart in the lib directory.
Add the following code to api_key.dart:
dart
Copy code
const String apiKey = 'YOUR_API_KEY_HERE';
Run the App:

sh
Copy code
flutter run
Screenshots


Contributing
Contributions are welcome! Please fork the repository and submit a pull request for any features or bug fixes.

License
This project is licensed under the MIT License. See the LICENSE file for more information.

This README provides a comprehensive guide to the News App, covering the technologies used, features, methods, and steps to run the application. Feel free to customize the details based on your specific implementation and needs.
