//
//  BoxView.swift
//  WebWrapper5
//
//  Created by user on 15.04.22.
//

import Foundation
import Cocoa

final class BoxView: NSBox {
    
    // MARK: - Nested Types
    
    private enum Constants {
        static let height: CGFloat = 60.0
        static let borderWidth: CGFloat = 1.0
    }
    
    // MARK: - Initialiaztion
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        setupBoxView()
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }

    // MARK: - Private Methods

    private func setupBoxView() {
        boxType = .custom
        fillColor = .windowBackgroundColor

        setupBorder()
        setupLayout()
    }
    
    private func setupBorder() {
        borderWidth = Constants.borderWidth
    }
    
    private func setupLayout() {
        translatesAutoresizingMaskIntoConstraints = false
        heightAnchor.constraint(equalToConstant: Constants.height).isActive = true
    }
}
