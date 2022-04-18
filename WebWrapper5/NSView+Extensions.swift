//
//  NSView+Extensions.swift
//  WebWrapper5
//
//  Created by user on 15.04.22.
//

import Cocoa

extension NSView {
    func addSubviews(_ subviews: [NSView]) {
        subviews.forEach(addSubview)
    }
}
