//
//  ReminderChecksUITests.swift
//  ReminderUITests
//
//  Created by Александр on 17/06/2019.
//  Copyright © 2019 Alex. All rights reserved.
//

import XCTest

class ReminderDateChecksUITests: XCTestCase {

    let helper = RemindersHelper()
    
    override func tearDown() {
        helper.getRemindersApp().terminate()
    }
    
    func testCheckReminderOneAndTwoDates() {
        helper.initRemindersApp()
        helper.editReminders()
        helper.checkReminderData(reminderName: "Reminder 1", checkString: getDateToCheck(day: -5))
        helper.checkReminderData(reminderName: "Reminder 2", checkString: getDateToCheck(day: 5))
    }
    
    func testCheckReminderThreeNotes() {
        helper.initRemindersApp()
        helper.editReminders()
        helper.checkReminderData(reminderName: "Reminder 3", checkString: "Test Note")
    }
    
    func getDateToCheck(day: Double) -> String {
        let currentDate = Date(timeIntervalSinceNow: day * 60 * 60 * 24)
        let dateFormatter = DateFormatter()
        dateFormatter.dateFormat = "M/dd/yy"
        let dateString = dateFormatter.string(from: currentDate)
        return dateString
    }

}
