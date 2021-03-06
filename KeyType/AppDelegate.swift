//
//  AppDelegate.swift
//  KeyType
//
//  MIT License
//  Copyright (c) 2016 potsbo
//

import Cocoa



@NSApplicationMain
class AppDelegate: NSObject, NSApplicationDelegate {
    let statusItem = NSStatusBar.system().statusItem(withLength: CGFloat(NSVariableStatusItemLength))

    func applicationDidFinishLaunching(_ aNotification: Notification) {
        let menu = NSMenu()
        statusItem.title = "⌘"
        statusItem.highlightMode = true
        statusItem.menu = menu
        
        let version = Bundle.main.infoDictionary?["CFBundleShortVersionString"] as! String
        
        menu.addItem(withTitle: "About KeyType \(version)", action: nil, keyEquivalent: "")
        menu.addItem(withTitle: "Quit", action: #selector(AppDelegate.quit(_:)), keyEquivalent: "")
        _ = KeyEventController()
    }
    
    func applicationWillTerminate(_ aNotification: Notification) {
        // Insert code here to tear down your application
    }
    
    @IBAction func quit(_ sender: NSButton) {
        NSApplication.shared().terminate(self)
    }
}
