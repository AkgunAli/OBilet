//
//  NavigationBar.swift
//  OBilet-Project
//
//  Created by Ali Akgün on 25.01.2022.
//

import Foundation
import UIKit

protocol NavigationBarDelegate {
    func setDelegate(vc : UIViewController)
}

final class NavigationBar: UIView, NavigationBarDelegate{
    
    private static let NIB_NAME = "NavigationBar"
    
    @IBOutlet var view: UIView!
    @IBOutlet weak var leftButton: UIButton!
    @IBOutlet weak var titleRotation: UILabel!
//    @IBOutlet private weak var titleLabel: UILabel!
    @IBOutlet weak var titleTime: UILabel!
    
    var vc : UIViewController?
//    var title: String = "" {
//        didSet {
//            titleLabel.text = title
//        }
//    }
//
    var isLeftButtonHidden: Bool {
        set {
            leftButton.isHidden = newValue
        }
        get {
            return leftButton.isHidden
        }
    }
    
    override func awakeFromNib() {
        initWithNib()
    }
    
    private func initWithNib() {
        Bundle.main.loadNibNamed(NavigationBar.NIB_NAME, owner: self, options: nil)
        view.translatesAutoresizingMaskIntoConstraints = false
        addSubview(view)
        setupLayout()
        leftButton.addTarget(self, action: #selector(buttonAction), for: .touchUpInside)
    }
    @objc func buttonAction() {
        self.vc?.dismiss(animated: true, completion: nil)
    }
    
    func setDelegate(vc: UIViewController) {
        self.vc = vc
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
