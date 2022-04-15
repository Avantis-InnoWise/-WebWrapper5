//
//  Presenter.swift
//  WebWrapper5
//
//  Created by user on 15.04.22.
//

import Foundation

protocol PresentationLogic: AnyObject {}

final class Presenter {
    
    // MARK: - Properties
    
    weak var viewController: DisplayLogic?

}

// MARK: - PresentationLogic

extension Presenter: PresentationLogic {}
