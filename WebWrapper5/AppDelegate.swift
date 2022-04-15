//
//  AppDelegate.swift
//  WebWrapper5
//
//  Created by user on 14.04.22.
//

import Cocoa

class AppDelegate: NSObject, NSApplicationDelegate {

    // MARK: - Properties

    var window: NSWindow?

    // MARK: - Private Properties

    private var contentRect: NSRect {
        return NSScreen.main?.frame ?? NSRect()
    }
    
    private var styleMask: NSWindow.StyleMask {
        return [.miniaturizable, .closable, .resizable, .titled]
    }

    // MARK: - Methods

    func applicationDidFinishLaunching(_ aNotification: Notification) {
        self.window = NSWindow(contentRect: contentRect, styleMask: styleMask, backing: .buffered, defer: false)
        guard let window = window else { return }
        window.center()
        window.makeKeyAndOrderFront(nil)
        window.contentViewController = Assembly.assembly()
    }

    func applicationShouldTerminateAfterLastWindowClosed(_ sender: NSApplication) -> Bool {
        return true
    }

    func applicationSupportsSecureRestorableState(_ app: NSApplication) -> Bool {
        return true
    }
}
