# fluttertest

Create a Flutter application - 

Name  - Flutter Test Application
Package name - 
	Android  - android.fluttertest.com
	IOS - ios.fluttertest.com
Theme - Use your own theme.
State Management - Use your Own state management of your choice. Make sure there is no unnecessary rebuilds of widgets.

Login Screen - 
Google Login
Email Login
Note - 
Save the login details in Shared Preferences so that next time the application is opened it will navigate directly to the home screen.
Navigate to the home screen on successful login.
Show relevant error messages when there is an error using a toast or snackbar

Home Screen
	App Bar -
		Search Bar and logout button
	Logout Button  - 
		On Click clear the shared preferences and navigate to login screen
	Use home.json to create a tree structure to show the tree present in the json file.
	Use hasAccess to highlight items.
	Use the above dropdown as reference.
![Screenshot 2022-05-09 at 18 25 24](https://user-images.githubusercontent.com/8918999/167414386-020c5e6d-3ee1-4f63-9073-427ae58192db.png)



Nice to have - 
Searching for a relevant category on Search Bar
When searching for an item, the suggestion should appear in a dropdown below the search bar.
On Clicking the suggestion, the particular item should be highlighted in the tree.

Before submitting - 
Make sure to differentiate UI and logic
Try to document all your code.

Data : assets/home.json
