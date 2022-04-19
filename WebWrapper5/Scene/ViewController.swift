//
//  ViewController.swift
//  WebWrapper5
//
//  Created by user on 14.04.22.
//

import Cocoa
import WebKit

final class ViewController: NSViewController {
    
    // MARK: - Nested Types
    
    private enum Constants {
        static let inset = 30.0
        static let buttonWidth = 80.0
        static let goHomeButtonWidth = 120.0
    }
    
    // MARK: - Properties
    
    private let interactor: BusinessLogic
    
    private var content: Models.Content? {
        didSet {
            setupBttnContent()
        }
    }
    
    // MARK: - UI Properties
    
    private let goBackBttn = Button()
    private let goHomeBttn = Button()
    private let goForwardBttn = Button()
    private let headerBox = BoxView()
    private let wkWebView = WKWebView()
    
    // MARK: - Initialization
    
    init(interactor: BusinessLogic) {
        self.interactor = interactor
        super.init(nibName: nil, bundle: nil)
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented in ViewController")
    }
    
    // MARK: - Lifecycle
    
    override func loadView() {
        guard let frame = NSScreen.main?.frame else { return }
        self.view = NSView(frame: frame)
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        configureUI()
        startSettings()
    }
    
    // MARK: - Private Methods
    
    private func startSettings() {
        interactor.request(Models.InitialData.Request())
    }
    
    private func configureUI() {
        setupWkWebView()
        setupSubviews()
        setupBttnActions()
    }
    
    private func setupWkWebView() {
        wkWebView.navigationDelegate = self
        wkWebView.translatesAutoresizingMaskIntoConstraints = false
    }
    
    private func setupSubviews() {
        view.addSubviews([headerBox, wkWebView])
        headerBox.addSubviews([goBackBttn, goHomeBttn, goForwardBttn])
        
        NSLayoutConstraint.activate([
            headerBox.widthAnchor.constraint(equalTo: view.widthAnchor),
            headerBox.topAnchor.constraint(equalTo: view.topAnchor),
            
            goBackBttn.widthAnchor.constraint(equalToConstant: Constants.buttonWidth),
            goBackBttn.centerYAnchor.constraint(equalTo: headerBox.centerYAnchor),
            goBackBttn.leftAnchor.constraint(equalTo: headerBox.leftAnchor, constant: Constants.inset),
            
            goHomeBttn.widthAnchor.constraint(equalToConstant: Constants.goHomeButtonWidth),
            goHomeBttn.centerXAnchor.constraint(equalTo: view.centerXAnchor),
            goHomeBttn.centerYAnchor.constraint(equalTo: headerBox.centerYAnchor),
            
            goForwardBttn.widthAnchor.constraint(equalToConstant: Constants.buttonWidth),
            goForwardBttn.centerYAnchor.constraint(equalTo: headerBox.centerYAnchor),
            goForwardBttn.rightAnchor.constraint(equalTo: headerBox.rightAnchor, constant: -Constants.inset),
            
            wkWebView.widthAnchor.constraint(equalTo: view.widthAnchor),
            wkWebView.topAnchor.constraint(equalTo: headerBox.bottomAnchor),
            wkWebView.bottomAnchor.constraint(equalTo: view.bottomAnchor)
        ])
    }
    
    private func setupBttnActions() {
        goBackBttn.action = #selector(setupGoBackButtonAction)
        goHomeBttn.action = #selector(setupGoHomeButtonAction)
        goForwardBttn.action = #selector(setupGoForwardButtonAction)
    }
    
    private func setupBttnContent() {
        guard
            let backButtonTitle = content?.backButtonTitle,
            let homeButtonTitle = content?.homeButtonTitle,
            let forwardButtonTitle = content?.forwardButtonTitle
        else { return }
        
        goBackBttn.title = backButtonTitle
        goHomeBttn.title = homeButtonTitle
        goForwardBttn.title = forwardButtonTitle
    }
    
    private func goToURL(_ url: URL?) {
        DispatchQueue.main.async() {
            guard let url = url else { return }
            self.wkWebView.load(URLRequest(url: url))
        }
    }
    
    // MARK: - Actions
    
    @objc private func setupGoBackButtonAction() {
        interactor.request(Models.GoBack.Request())
    }
    
    @objc private func setupGoHomeButtonAction() {
        interactor.request(Models.GoHome.Request())
    }
    
    @objc private func setupGoForwardButtonAction() {
        interactor.request(Models.GoForward.Request())
    }
}

// MARK: - DisplayLogic

extension ViewController: DisplayLogic {
    func display(_ viewModel: Models.InitialData.ViewModel) {
        content = viewModel.content
        goToURL(viewModel.url)
    }
    
    func display(_ viewModel: Models.GoBack.ViewModel) {
        wkWebView.goBack()
    }
    
    func display(_ viewModel: Models.GoHome.ViewModel) {
        goToURL(viewModel.url)
    }
    
    func display(_ viewModel: Models.GoForward.ViewModel) {
        wkWebView.goForward()
    }
}

//MARK: WKNavigationDelegate

extension ViewController: WKNavigationDelegate {
    func webView(_ webView: WKWebView, didFinish navigation: WKNavigation!) {
        goBackBttn.isEnabled = webView.backForwardList.backList.isEmpty ? false : true
        goForwardBttn.isEnabled = webView.backForwardList.forwardList.isEmpty ? false : true
    }
}
