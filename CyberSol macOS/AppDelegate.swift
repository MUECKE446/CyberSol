//
//  AppDelegate.swift
//  CyberSol macOS
//
//  Created by Christian Muth on 20.02.24.
//

import Cocoa



let log = ActionLogger.defaultLogger()
var gameName = ""
// !!! Achtung: bei jeder Änderung der Version muss diese händisch auch in LaunchScreen.xib gemacht werden !!!
let CyberSolitaireVersion = "1.4.0"

// Konstanten für SwiftyPlistManger
let allGamePListNames = getAllGamePListNames()
var allPListNames : [String] = []

func logSwiftyPlistManager(_ error: SwiftyPlistManagerError?) {
    guard let err = error else {
        return
    }
    print("-------------> SwiftyPlistManager error: '\(err)'")
}

@main
class AppDelegate: NSObject, NSApplicationDelegate {



    func applicationDidFinishLaunching(_ aNotification: Notification){
        // Insert code here to initialize your application
    }

    func applicationWillTerminate(_ aNotification: Notification) {
        // Insert code here to tear down your application
    }

    func applicationShouldTerminateAfterLastWindowClosed(_ sender: NSApplication) -> Bool {
        return true
    }


}

