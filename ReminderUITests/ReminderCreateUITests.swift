//
//  ReminderUITests.swift
//  ReminderUITests
//
//  Created by Александр on 13/06/2019.
//  Copyright © 2019 Alex. All rights reserved.
//

import XCTest


class ReminderCreateUITests: XCTestCase {
    
    let helper = RemindersHelper()
    
    override func tearDown() {
        helper.getRemindersApp().terminate()
    }

    func testCreateReminderOne() {
        helper.initRemindersApp()
        helper.createReminder(name: "Reminder 1")
        helper.setupNotifications(day: getDateToSlider(day: -5))
        helper.saveReminder()
    }
    
    func testCreateReminderTwo() {
        helper.initRemindersApp()
        helper.createReminder(name: "Reminder 2")
        helper.setPriority(priority: "Low")
        helper.setupNotifications(day: getDateToSlider(day: 5))
        helper.saveReminder()
    }
    
    func testCreateReminderThree() {
        helper.initRemindersApp()
        helper.createReminder(name: "Reminder 3")
        helper.writeNote(note: "Test Note")
        helper.saveReminder()
    }
    
    func getDateToSlider(day: Double) -> String {
        let currentDate = Date(timeIntervalSinceNow: day * 60 * 60 * 24)
        let dateFormatter = DateFormatter()
        dateFormatter.dateFormat = "MMM dd"
        let dateString = dateFormatter.string(from: currentDate)
        return dateString
    }

}
