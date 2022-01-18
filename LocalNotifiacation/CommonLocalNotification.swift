//
//  CommonLocalNotification.swift
//  LocalNotifiacation
//
//  Created by 성준 on 2022/01/17.
//

import Foundation
import UserNotifications

enum NotificationText {
    static let title = "제목"
    static let body = "내용"
}

final class CommonLocalNotification {
    
    let userNotificationCenter = UNUserNotificationCenter.current()
    
    static let shared = CommonLocalNotification()
    private let requestIdentifier = "com.blhablha.notification"
    
     func getConnectNotiContent() -> UNMutableNotificationContent {
        let content = UNMutableNotificationContent()
        content.title = NotificationText.title
        content.body = NotificationText.body
        return content
    }
    
     func send(content: UNMutableNotificationContent) {

        let trigger = UNTimeIntervalNotificationTrigger(timeInterval: 1, repeats: false)
        let request = UNNotificationRequest(identifier: requestIdentifier,
                                            content: content,
                                            trigger: trigger)

        UNUserNotificationCenter.current().add(request, withCompletionHandler: nil)
    }
    
    func requestNotificationAuthorization() {
        let authOptions = UNAuthorizationOptions(arrayLiteral: .alert, .badge, .sound)

        UNUserNotificationCenter.current().requestAuthorization(options: authOptions) { success, error in
            if let error = error {
                print("Error: \(error)")
            }
        }
        
//        userNotificationCenter.requestAuthorization(options: authOptions) { success, error in
//            if let error = error {
//                print("Error: \(error)")
//            }
//        }
    }
}
