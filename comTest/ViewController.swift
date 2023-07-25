//
//  ViewController.swift
//  comTest
//
//  Created by Denis Fedorets on 24.07.2023.
//

import UIKit
import WatchConnectivity


class ViewController: UIViewController {
    
    // 1: Get singleton class whitch manage WCSession
    var connectivityHandler = SessionHandler.shared
    
    // 2: Counter for manage number of messages sended
    var messagesCounter = 0
  
    // ...
    
    /// Send messages on main thread
    @IBAction func sendMessage(_ sender: UIButton) {
        messagesCounter += 1
        // 3: Send message to apple watch, we don't wait to response, only trace errors
        connectivityHandler.session.sendMessage(["msg" : "Message \(messagesCounter)"], replyHandler: nil) { (error) in
            print("Error sending message: \(error)")
        }
    }
    
    
}
