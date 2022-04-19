//
//  Interactor.swift
//  WebWrapper5
//
//  Created by user on 15.04.22.
//

final class Interactor {
    
    // MARK: - Properties
    
    private let presenter: PresentationLogic
    
    // MARK: - Initialization
    
    init(presenter: PresentationLogic) {
        self.presenter = presenter
    }
}

// MARK: - BusinessLogic

extension Interactor: BusinessLogic {
    func request(_ request: Models.InitialData.Request) {
        presenter.present(Models.InitialData.Response())
    }

    func request(_ request: Models.GoBack.Request) {
        presenter.present(Models.GoBack.Response())
    }

    func request(_ request: Models.GoHome.Request) {
        presenter.present(Models.GoHome.Response())
    }

    func request(_ request: Models.GoForward.Request) {
        presenter.present(Models.GoForward.Response())
    }
}
