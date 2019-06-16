//
//  ReminderDeleteUITests.swift
//  ReminderUITests
//
//  Created by Александр on 17/06/2019.
//  Copyright © 2019 Alex. All rights reserved.
//

import XCTest

class ReminderDeleteUITests: XCTestCase {

    let helper = RemindersHelper()
    
    override func tearDown() {
        helper.getRemindersApp().terminate()
    }
    
    func testDeleteReminderTwo() {
        helper.initRemindersApp()
        helper.editReminders()
        helper.deleteReminder(reminderName: "Reminder 2")
        helper.checkThatReminderDeleted(reminderName: "Reminder 2")
    }
    
    func testz_DeleteAllReminders() {
        helper.initRemindersApp()
        helper.editReminders()
        helper.deleteAllReminders()
        helper.checkThatReminderDeleted(reminderName: "Reminder 1")
        helper.checkThatReminderDeleted(reminderName: "Reminder 3")
    }

}
