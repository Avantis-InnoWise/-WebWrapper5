//
//  Assembly.swift
//  WebWrapper5
//
//  Created by user on 15.04.22.
//

import Cocoa

enum Assembly {
    static func assembly() -> NSViewController {
        let presenter = Presenter()
        let interactor = Interactor(presenter: presenter)
        let viewController = ViewController(interactor: interactor)
        
        presenter.viewController = viewController
        
        return viewController
    }
}
