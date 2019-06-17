Automated tests to check the Reminders app.

### PRECONDITION
* need to install XCode.

### How to run:
1. go to the project work directory, ex.: /home/git/ReminderTests
2. execute command:
``` xcodebuild -workspace Reminder.xcworkspace -scheme "Reminder" -sdk iphonesimulator -destination 'platform=iOS Simulator,name=iPhone X,OS=12.2' test ```
