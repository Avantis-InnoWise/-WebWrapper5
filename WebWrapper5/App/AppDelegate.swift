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
        NSScreen.main?.frame ?? NSRect()
    }
    
    private var styleMask: NSWindow.StyleMask {
        [.miniaturizable, .closable, .resizable, .titled]
    }

    private var contentViewController: NSViewController {
        Assembly.assembly()
    }

    // MARK: - Methods

    func applicationDidFinishLaunching(_ aNotification: Notification) {
        self.window = NSWindow(contentRect: contentRect, styleMask: styleMask, backing: .buffered, defer: false)
        guard let window = window else { return }
        window.center()
        if let title = Bundle.main.object(forInfoDictionaryKey: "CFBundleDisplayName") as? String {
            window.title = title
        }
        window.contentViewController = contentViewController
        window.makeKeyAndOrderFront(nil)
    }

    func applicationShouldTerminateAfterLastWindowClosed(_ sender: NSApplication) -> Bool { return true }

    func applicationSupportsSecureRestorableState(_ app: NSApplication) -> Bool { return true }
}
