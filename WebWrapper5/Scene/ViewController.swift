//
//  ViewController.swift
//  WebWrapper5
//
//  Created by user on 14.04.22.
//

import Cocoa

protocol DisplayLogic: AnyObject {}

final class ViewController: NSViewController {
    
    // MARK: - Properties
    
    private let interactor: BusinessLogic
    
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
    
    private func startSettings() {}
    
    private func configureView() {
        setupSubviews()
        setupLayout()
        setupActions()
    }
    
    private func setupSubviews() {}
    
    private func setupLayout() {}
    
    private func setupActions() {}
    
}

// MARK: - DisplayLogic

extension ViewController: DisplayLogic {}
