//
//  PassengerSelectionView.swift
//  OBilet-Project
//
//  Created by Ali Akgün on 26.01.2022.
//

import Foundation
import UIKit
final class PassengerSelectionView: UIView{
    
    private static let NIB_NAME = "PassengerSelectionView"
    @IBOutlet var view: UIView!
    override func awakeFromNib() {
        initWithNib()
    }

    private func initWithNib() {
        Bundle.main.loadNibNamed(PassengerSelectionView.NIB_NAME, owner: self, options: nil)
        view.translatesAutoresizingMaskIntoConstraints = false
        addSubview(view)
        setupLayout()
    }

    
    private func setupLayout() {
        NSLayoutConstraint.activate(
            [
                view.topAnchor.constraint(equalTo: topAnchor),
                view.leadingAnchor.constraint(equalTo: leadingAnchor),
                view.bottomAnchor.constraint(equalTo: bottomAnchor),
                view.trailingAnchor.constraint(equalTo: trailingAnchor),
            ]
        )
    }
}
