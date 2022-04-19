//
//  Button.swift
//  WebWrapper5
//
//  Created by user on 15.04.22.
//

import Cocoa

final class Button: NSButton {

    // MARK: - Nested Types

    private enum Constants {
        static let cornerRadius: CGFloat = 8
        static let height: CGFloat = 32
    }

    // MARK: - Initialiaztion

    override init(frame: CGRect = .zero) {
        super.init(frame: frame)
        configureButton()
    }

    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented Button")
    }

    // MARK: - Private Methods

    private func configureButton() {
        bezelStyle = .texturedSquare
        wantsLayer = true
        isBordered = false
        
        setupLayer()
        setupLayout()
    }

    private func setupLayer() {
        layer?.backgroundColor = NSColor.lightGray.cgColor
        layer?.masksToBounds = true
        layer?.cornerRadius = Constants.cornerRadius
    }

    private func setupLayout() {
        translatesAutoresizingMaskIntoConstraints = false
        heightAnchor.constraint(equalToConstant: Constants.height).isActive = true
    }
}
