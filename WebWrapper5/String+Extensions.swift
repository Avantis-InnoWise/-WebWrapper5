//
//  String+Extensions.swift
//  WebWrapper5
//
//  Created by user on 15.04.22.
//

import Foundation

extension String {
    static var stringEmpty: String {
        ""
    }

    var stringLocalizable: String {
        NSLocalizedString(self, comment: String.stringEmpty)
    }

    var appInfoLocalizable: String {
        NSLocalizedString(self, tableName: "AppInfo", comment: String.stringEmpty)
    }
}
