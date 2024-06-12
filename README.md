# Task Manager

## User Interface

- **Main Screen**: Displays a list of tasks.
- **Add Task**: Includes an input field for adding new tasks.
- **Delete Task**: Swipe to delete tasks from the list.

## Functionality

- **Swipe to Delete**: Implemented using the SwipeCellKit CocoaPod.
- **Local Storage**: Uses Realm database to store tasks.
- **Programmatic UI**: Built programmatically using UIKit.
- **Task List**: Tasks are displayed using `UITableView`.

## How to Run the App

1. **Open the Project**: Unzip the provided file.
2. **Workspace Setup**: Open the generated `TaskManager.xcworkspace` file.
3. **Select Simulator**: Choose your preferred simulator in Xcode.
4. **Run the App**: Click the Run button in Xcode.

   If CocoaPods are not installed:
   1. Open the project directory in Terminal.
   2. Run the command `pod install`.
   3. Follow steps 2 to 4 again.

## Dependencies

- [SwipeCellKit](https://github.com/SwipeCellKit/SwipeCellKit)
- [Realm](https://realm.io/)

## Notes

- Ensure you have CocoaPods installed on your system to manage dependencies.
- The app is built using UIKit and requires iOS 11.0 or later.


