//
//  ViewController.swift
//  LocalNotifiacation
//
//  Created by 성준 on 2022/01/17.
//

import UIKit

class ViewController: UIViewController {
    
     func getConnectNotiContent() -> UNMutableNotificationContent {
        let content = UNMutableNotificationContent()
        content.title = NotificationText.title
        content.body = NotificationText.body
        return content
    }

    @IBAction func sendLocalNotification() {
        DispatchQueue.global().asyncAfter(deadline: .now() + 1) {
            CommonLocalNotification.shared.send(content: self.getConnectNotiContent())
        }
    }
}

