//
//  Interactor.swift
//  WebWrapper5
//
//  Created by user on 15.04.22.
//

import Foundation

protocol BusinessLogic: AnyObject {}

final class Interactor {
    
    // MARK: - Properties
    
    private let presenter: PresentationLogic
    
    // MARK: - Initialization
    
    init(presenter: PresentationLogic) {
        self.presenter = presenter
    }
}

// MARK: - BusinessLogic

extension Interactor: BusinessLogic {}
