![Screenshot_20240527_202916](https://github.com/Ajay-2022-Soft-Tech/news_api/assets/113298640/98374a0e-a6e4-4cc8-96ee-78b6aabf7daa)![Screenshot_20240527_202916](https://github.com/Ajay-2022-Soft-Tech/news_api/assets/113298640/596d2e85-8c83-401d-b59f-7645af7ad6d6)News App
Description
This News App is a modern and dynamic news application built using Flutter, providing users with the latest news headlines from various sources. The app allows users to filter news based on different categories and news channels, offering a personalized news reading experience. The app also features a sleek and user-friendly interface, ensuring a smooth navigation experience.

<img src="[![][Screenshot_20240527_202848](https://github.com/Ajay-2022-Soft-Tech/news_api/assets/113298640/574995c7-70da-4da3-b6da-a489e74c967f)](https://private-user-images.githubusercontent.com/113298640/334154316-98374a0e-a6e4-4cc8-96ee-78b6aabf7daa.png?jwt=eyJhbGciOiJIUzI1NiIsInR5cCI6IkpXVCJ9.eyJpc3MiOiJnaXRodWIuY29tIiwiYXVkIjoicmF3LmdpdGh1YnVzZXJjb250ZW50LmNvbSIsImtleSI6ImtleTUiLCJleHAiOjE3MTY4MjUxMjcsIm5iZiI6MTcxNjgyNDgyNywicGF0aCI6Ii8xMTMyOTg2NDAvMzM0MTU0MzE2LTk4Mzc0YTBlLWE2ZTQtNGNjOC05NmVlLTc4YjZhYWJmN2RhYS5wbmc_WC1BbXotQWxnb3JpdGhtPUFXUzQtSE1BQy1TSEEyNTYmWC1BbXotQ3JlZGVudGlhbD1BS0lBVkNPRFlMU0E1M1BRSzRaQSUyRjIwMjQwNTI3JTJGdXMtZWFzdC0xJTJGczMlMkZhd3M0X3JlcXVlc3QmWC1BbXotRGF0ZT0yMDI0MDUyN1QxNTQ3MDdaJlgtQW16LUV4cGlyZXM9MzAwJlgtQW16LVNpZ25hdHVyZT05YzNmYTQ0ZDIzZDNkNzBjMGNkODY5OGY5MGI5NGI2MTI0MzcwODhjN2Y3NTMyYmUyOWUwYmNlNWFiNDdkNmY1JlgtQW16LVNpZ25lZEhlYWRlcnM9aG9zdCZhY3Rvcl9pZD0wJmtleV9pZD0wJnJlcG9faWQ9MCJ9.LQ6J1pw638hwEaSYKmpx3fOrlo_RhBsUqTghweGdZMM)" data-canonical-src="https://gyazo.com/eb5c5741b6a9a16c692170a41a49c858.png" width="200" height="400" />
![Screenshot_20240527_202916](https://github.com/Ajay-2022-Soft-Tech/news_api/assets/113298640/ac6102e0-3f70-4633-a6b8-57fd991b1b1f width=100)

![Screenshot_20240527_203042](https://github.com/Ajay-2022-Soft-Tech/news_api/assets/113298640/d0bfc5cb-877b-4535-b4f2-02cbc0012196 width=100)

![Screenshot_20240527_203120](https://github.com/Ajay-2022-Soft-Tech/news_api/assets/113298640/90740bf7-a01f-47cc-800b-7ecca7265685 width=100)


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
