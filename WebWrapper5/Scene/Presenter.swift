//
//  Presenter.swift
//  WebWrapper5
//
//  Created by user on 15.04.22.
//

final class Presenter {
    
    // MARK: - Properties
    
    weak var viewController: DisplayLogic?
    
    // MARK: - Private Methods
    
    private func process() -> Models.InitialData.ViewModel {
        let content = Models.Content(
            bckTtl: "backButtonTitle".stringLocalizable,
            hmTtl: "homeButtonTitle".stringLocalizable,
            frwrdTtl: "forwardButtonTitle".stringLocalizable
        )
        
        return Models.InitialData.ViewModel(content: content, baseURL: Endpoint.baseURL)
    }
}

// MARK: - PresentationLogic

extension Presenter: PresentationLogic {
    func present(_ response: Models.InitialData.Response) {
        viewController?.display(process())
    }
    
    func present(_ response: Models.GoBack.Response) {
        viewController?.display(Models.GoBack.ViewModel())
    }
    
    func present(_ response: Models.GoHome.Response) {
        viewController?.display(Models.GoHome.ViewModel(url: Endpoint.baseURL))
    }
    
    func present(_ response: Models.GoForward.Response) {
        viewController?.display(Models.GoForward.ViewModel())
    }
}
