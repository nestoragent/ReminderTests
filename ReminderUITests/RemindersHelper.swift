//
//  RemindersHelper.swift
//  ReminderUITests
//
//  Created by Александр on 15/06/2019.
//  Copyright © 2019 Alex. All rights reserved.
//

import Foundation
import XCTest

class RemindersHelper  {
    
    var remindersApp: XCUIApplication
    
    init() {
        remindersApp = XCUIApplication(bundleIdentifier: "com.apple.reminders")
    }
    
    func initRemindersApp() {
        if remindersApp.state == XCUIApplication.State.notRunning || remindersApp.state == XCUIApplication.State.runningBackground {
            remindersApp.activate()
        }
        stackOtherLists()
    }
    
    func getRemindersApp() -> XCUIApplication {
        initRemindersApp()
        return remindersApp
    }
    
    func setPriority(priority: String) {
        remindersApp.tables.buttons[priority].tap()
    }
    
    func createReminder(name: String) {
        remindersApp.buttons["Add"].tap()
        remindersApp.sheets["Create new…"].buttons["Reminder"].tap()
        let axremindernotesidentifierTextView = remindersApp.tables.children(matching: .cell).element(boundBy: 0).textViews["AXReminderNotesIdentifier"]
        axremindernotesidentifierTextView.typeText(name)
    }
    
    func setupNotifications(day: String) {
        remindersApp.switches["Remind me on a day"].tap()
        let predicate = NSPredicate(format: "label CONTAINS[c] 'Alarm'")
        let labels = remindersApp.staticTexts.containing(predicate)
        labels.element(boundBy: 0).tap()
        //setup day
        let tablesQuery = remindersApp.tables
        tablesQuery.pickerWheels.element(boundBy: 0).adjust(toPickerWheelValue: day)
    }
    
    func saveReminder() {
        remindersApp.navigationBars["Create Reminder"].buttons["Done"].tap()
    }
    
    func writeNote(note: String) {
        let allnotes = remindersApp.tables.children(matching: .cell)
        allnotes.element(boundBy: 3).tap()
        allnotes.element(boundBy: 3).typeText(note)
    }
    
    func editReminders() {
        remindersApp.buttons["Reminders"].tap()
        remindersApp.buttons["Edit"].tap()
    }
    
    func checkReminderData(reminderName: String, checkString: String) {
        let predicate = NSPredicate(format: "label CONTAINS[c] %@", "Delete \(reminderName)")
        let reminders = remindersApp.buttons.containing(predicate)
        let reminderValue = reminders.element(boundBy: 1).label
        print("out String \(checkString)")
        print("value: \(reminderValue)")
        XCTAssertTrue(reminderValue.contains(checkString))
    }
    
    func deleteReminder(reminderName: String) {
        let predicate = NSPredicate(format: "label CONTAINS[c] %@", "Delete \(reminderName)")
        let reminders = remindersApp.buttons.containing(predicate)
        reminders.element(boundBy: 1).tap()
        let deleteButton = remindersApp.tables.buttons["Delete"]
//        tablesQuery.buttons["More"].tap()
        deleteButton.tap()
        //        remindersApp.buttons["Done"].tap()
    }
    
    func stackOtherLists() {
        let doneButton = remindersApp.buttons["Done"]
        if doneButton.exists {
            doneButton.tap()
        }
        let stackOther = remindersApp.buttons["Stack of other lists"]
        if stackOther.exists {
            stackOther.tap()
        }
    }
    
    func deleteAllReminders() {
        var index = 0
        repeat {
            var predicate = NSPredicate(format: "label CONTAINS[c] %@", "Delete Reminder")
            var reminders = remindersApp.tables.buttons.containing(predicate)
            print("size: \(reminders.count)")
            if reminders.element(boundBy: 0).isHittable {
                print("value: \(reminders.element(boundBy: 0).label)")
                reminders.element(boundBy: 0).tap()
                remindersApp.tables.buttons["Delete"].tap()
                print("size2: \(reminders.count)")
            }
            index = reminders.count
        } while index > 0
        
//        xcodebuild -workspace ReminderWork.xcworkspace -scheme "Reminder" -sdk iphonesimulator -destination 'platform=iOS Simulator,name=iPhone X,OS=12.2' test -only-testing:ReminderUITests
    }
    
    
    func checkThatReminderDeleted(reminderName: String) {
        let predicate = NSPredicate(format: "label CONTAINS[c] %@", "Delete \(reminderName)")
        let reminders = remindersApp.buttons.containing(predicate)
        print("count: \(reminders.count)")
        XCTAssertTrue(0 == reminders.count)
    }
    
    
    
}
