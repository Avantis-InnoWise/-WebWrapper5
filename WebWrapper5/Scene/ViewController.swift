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
        static let threezero = 30.0
        static let eightzero = 80.0
        static let onetwozero = 120.0
    }
    
    // MARK: - Properties
    
    private let interactor: BusinessLogic
    
    private var content: Models.Content? {
        didSet {
            setupContent()
        }
    }
    
    // MARK: - UI Properties
    
    private let bckBtn = Button()
    private let hmBtn = Button()
    private let frwrdBtn = Button()
    private let bx = BoxView()
    private let wkWbVw = WKWebView()
    
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
        configureView()
        startSettings()
    }
    
    // MARK: - Private Methods
    
    private func startSettings() {
        fetch()
    }
    
    private func configureView() {
        setupWkWebView()
        setupSubviews()
        setupActions()
    }
    
    private func setupWkWebView() {
        wkWbVw.navigationDelegate = self
        wkWbVw.translatesAutoresizingMaskIntoConstraints = false
    }
    
    private func setupSubviews() {
        view.addSubviews([bx, wkWbVw])
        bx.addSubviews([bckBtn, hmBtn, frwrdBtn])
        
        NSLayoutConstraint.activate([
            bx.widthAnchor.constraint(equalTo: view.widthAnchor),
            bx.topAnchor.constraint(equalTo: view.topAnchor),
            
            bckBtn.widthAnchor.constraint(equalToConstant: Constants.eightzero),
            bckBtn.centerYAnchor.constraint(equalTo: bx.centerYAnchor),
            bckBtn.leftAnchor.constraint(equalTo: bx.leftAnchor, constant: Constants.threezero),
            
            hmBtn.widthAnchor.constraint(equalToConstant: Constants.onetwozero),
            hmBtn.centerXAnchor.constraint(equalTo: view.centerXAnchor),
            hmBtn.centerYAnchor.constraint(equalTo: bx.centerYAnchor),
            
            frwrdBtn.widthAnchor.constraint(equalToConstant: Constants.eightzero),
            frwrdBtn.centerYAnchor.constraint(equalTo: bx.centerYAnchor),
            frwrdBtn.rightAnchor.constraint(equalTo: bx.rightAnchor, constant: -Constants.threezero),
            
            wkWbVw.widthAnchor.constraint(equalTo: view.widthAnchor),
            wkWbVw.topAnchor.constraint(equalTo: bx.bottomAnchor),
            wkWbVw.bottomAnchor.constraint(equalTo: view.bottomAnchor)
        ])
    }
    
    private func setupActions() {
        bckBtn.action = #selector(setupBackButtonAction)
        hmBtn.action = #selector(setupHomeButtonAction)
        frwrdBtn.action = #selector(setupForwardButtonAction)
    }
    
    private func setupContent() {
        guard
            let bckTtl = content?.bckTtl,
            let hmTtl = content?.hmTtl,
            let frwrdTtl = content?.frwrdTtl
        else { return }
        
        bckBtn.title = bckTtl
        hmBtn.title = hmTtl
        frwrdBtn.title = frwrdTtl
    }
    
    private func open(_ url: URL?) {
        DispatchQueue.main.async() {
            guard let url = url else { return }
            self.wkWbVw.load(URLRequest(url: url))
        }
    }
    
    // MARK: - Actions
    
    @objc private func setupBackButtonAction() {
        back()
    }
    
    @objc private func setupHomeButtonAction() {
        home()
    }
    
    @objc private func setupForwardButtonAction() {
        forward()
    }
    
    // MARK: Interactor Methods
    
    func fetch() {
        interactor.request(Models.InitialData.Request())
    }
    
    func back() {
        interactor.request(Models.GoBack.Request())
    }
    
    func home() {
        interactor.request(Models.GoHome.Request())
    }
    
    func forward() {
        interactor.request(Models.GoForward.Request())
    }
}

// MARK: - DisplayLogic

extension ViewController: DisplayLogic {
    func display(_ viewModel: Models.InitialData.ViewModel) {
        content = viewModel.content
        open(viewModel.baseURL)
    }
    
    func display(_ viewModel: Models.GoBack.ViewModel) {
        wkWbVw.goBack()
    }
    
    func display(_ viewModel: Models.GoHome.ViewModel) {
        open(viewModel.url)
    }
    
    func display(_ viewModel: Models.GoForward.ViewModel) {
        wkWbVw.goForward()
    }
}

//MARK: WKNavigationDelegate

extension ViewController: WKNavigationDelegate {
    func webView(_ webView: WKWebView, didFinish navigation: WKNavigation!) {
        bckBtn.isEnabled = webView.backForwardList.backList.isEmpty ? false : true
        frwrdBtn.isEnabled = webView.backForwardList.forwardList.isEmpty ? false : true
    }
}
