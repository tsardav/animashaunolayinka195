# Student Management System App
A simple mobile application for managing student profiles built using Flutter. The app allows users to add, view, and delete student profiles. Designed with a modular structure and built for both iOS and Android, this app leverages the GetX state management library and adheres to the MVVM architecture.

# Table of Contents
1. Features
2. Setup Instructions
3. Usage
4. Known Limitations
5. Future Improvements

# Features
1. **Home Screen:** Lists all students with details such as name, email, and enrollment status.
2. **Add Student:** Allows users to add a new student profile by filling out a form with fields for name, email, enrollment status, and profile photo upload.
3. **Delete Student:** Users can delete a specific student by tapping the delete icon next to the student’s profile.
4. **Bottom Navigation Bar:** Simplified navigation through three main screens: Home, Add Student, and Settings.
5. **Persistent Storage:** Data is managed through local storage to maintain profiles, using a mock local JSON file to simulate an API.
6. **Data Validation:** Form fields in the Add Student screen are validated to ensure correct data input.
7. **Toast Messages:** Displays success and delete notifications using GetX snackbar for user feedback.
8. **MVVM Architecture:** Separates logic into models, views, viewmodels, and services for cleaner, modular code.
9. **State Management:** Managed with GetX for reactive programming and smooth state transitions.

# Setup Instructions
1. # Prerequisites:

i.  Install **Flutter SDK** (>=2.5.0): Follow instructions from Flutter's official website.
ii. Ensure you have **Xcode**(for iOS) or **Android Studio** (for Android) set up for running the app on a simulator/emulator.
iii. GetX Package: This is already added to the pubspec.yaml file.

2. # Clone the Repository:

   git clone https://github.com/gutengboi/Student_Management_App.git
   cd student-management-app

4. # Install Dependencies:

   flutter pub get

5. # Run the App:
   i .Start the emulator or simulator.
   ii. Execute the following command

       flutter run
6. # Add Mock Data (Optional):

   Add mock JSON data to assets/mock_students.json if you want to simulate initial data.

# Usage

1. # Home Screen:
   i. View a list of student profiles.
   ii. Tap the delete icon to remove a student profile.

2. # Add Student Screen:
   i. Fill out the form fields (name, email, enrollment status, and photo upload).
   ii. Click the **Add Student** button to add the student. A success toast message will appear, and you’ll be navigated back to the Home screen where the new     student is listed.
3. # Settings Screen:
   i. Placeholder for additional settings (e.g., filters, preferences) as needed in the future.

# Known Limitations
1. **Mock Data Persistence:** The mock data is not truly persistent across sessions, as it's loaded from a JSON file. Future iterations may require integration with a real database or cloud storage.
2. **No Profile Photo Upload:** While a placeholder is provided, there’s currently no support for uploading or displaying an actual profile photo.
3. **Minimal Settings Functionality:** The Settings screen is included but lacks detailed functionality.
4. **Limited Offline Support:** Data persistence in this app relies on local storage, so a network-based API would need to be added for cloud-based data access.
5. **Limited UI Customization:** Basic UI styling is used for simplicity; additional work could enhance the appearance and customizability.

# Future Improvements
1. **Database Integration:** Implement SQLite or Firebase for data persistence and multi-device support.
2. **Profile Photo Support:** Add functionality to allow users to upload and display profile photos.
3. **Enhanced Settings Screen:** Extend the Settings screen to manage filters, app preferences, or profile customization.
4. **Improved Error Handling:** Add user-friendly error messages for network and data validation errors.
5. **Unit Tests:** Expand unit tests for view models and components to improve app reliability and maintainability.

