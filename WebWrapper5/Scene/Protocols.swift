//
//  Protocols.swift
//  WebWrapper5
//
//  Created by user on 18.04.22.
//

protocol BusinessLogic: AnyObject {
    func request(_ request: Models.InitialData.Request)
    func request(_ request: Models.GoBack.Request)
    func request(_ request: Models.GoHome.Request)
    func request(_ request: Models.GoForward.Request)
}

protocol PresentationLogic: AnyObject {
    func present(_ response: Models.InitialData.Response)
    func present(_ response: Models.GoBack.Response)
    func present(_ response: Models.GoHome.Response)
    func present(_ response: Models.GoForward.Response)
}

protocol DisplayLogic: AnyObject {
    func display(_ viewModel: Models.InitialData.ViewModel)
    func display(_ viewModel: Models.GoBack.ViewModel)
    func display(_ viewModel: Models.GoHome.ViewModel)
    func display(_ viewModel: Models.GoForward.ViewModel)
}
