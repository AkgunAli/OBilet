//
//  RoundTripView.swift
//  OBilet-Project
//
//  Created by Ali Akgün on 26.01.2022.
//

import Foundation
import UIKit

final class RoundTripView: UIView{
    
    private static let NIB_NAME = "RoundTripView"
    @IBOutlet var view: UIView!
    @IBOutlet weak var imageView: UIView!
    var imageBool : Bool = false
    override func awakeFromNib() {
        initWithNib()
    }

    private func initWithNib() {
        Bundle.main.loadNibNamed(RoundTripView.NIB_NAME, owner: self, options: nil)
        view.translatesAutoresizingMaskIntoConstraints = false
        addSubview(view)
        setupLayout()
        imageView.isHidden = imageBool
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
