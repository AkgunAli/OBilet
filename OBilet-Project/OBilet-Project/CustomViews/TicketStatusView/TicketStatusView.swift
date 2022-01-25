//
//  TicketStatusView.swift
//  OBilet-Project
//
//  Created by Ali Akgün on 25.01.2022.
//

import Foundation
import UIKit
final class TicketStatusView: UIView{
    
    private static let NIB_NAME = "TicketStatusView"
    @IBOutlet var view: UIView!
    @IBOutlet weak var leftButton: UIButton!
    @IBOutlet weak var rightButton: UIButton!
    
    @IBOutlet weak var rightButtonView: UIView!
    @IBOutlet weak var rightButtonMainView: UIView!
    
    @IBOutlet weak var leftButtonView: UIView!
    @IBOutlet weak var leftButtonMainView: UIView!
    
    @IBOutlet weak var leftButtonImage: UIImageView!
    @IBOutlet weak var rightButtonImage: UIImageView!
    
    override func awakeFromNib() {
        initWithNib()
    }

    private func initWithNib() {
        Bundle.main.loadNibNamed(TicketStatusView.NIB_NAME, owner: self, options: nil)
        view.translatesAutoresizingMaskIntoConstraints = false
        addSubview(view)
        setupLayout()
    }
    @IBAction func leftButtonAction(_ sender: UIButton) {
        changeButtonUI(sender: sender)
    }
    @IBAction func rightButtonAction(_ sender: UIButton) {
        changeButtonUI(sender: sender)
    }
    func changeButtonUI(sender:UIButton){
        switch sender {
        case  leftButton:
            leftButtonView.backgroundColor = UIColor(hexString: "2F4EB4")
            leftButton.setTitleColor(UIColor.white, for: .normal)
            leftButtonImage.tintColor = UIColor.white
            
            rightButtonView.backgroundColor = UIColor(hexString: "FAFAFA")
            rightButton.setTitleColor(UIColor(hexString: "5D686E"), for: .normal)
            rightButtonImage.tintColor = UIColor(hexString: "5D686E")
        case  rightButton:
            rightButtonView.backgroundColor = UIColor(hexString: "2F4EB4")
            rightButton.setTitleColor(UIColor.white, for: .normal)
            rightButtonImage.tintColor = UIColor.white

            leftButtonView.backgroundColor = UIColor(hexString: "FAFAFA")
            leftButton.setTitleColor(UIColor(hexString: "5D686E"), for: .normal)
            leftButtonImage.tintColor = UIColor(hexString: "5D686E")
        default:
            print("")
        }
        
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


extension UIColor {
    convenience init(hexString: String) {
        let hex = hexString.trimmingCharacters(in: CharacterSet.alphanumerics.inverted)
        var int = UInt64()
        Scanner(string: hex).scanHexInt64(&int)
        let a, r, g, b: UInt64
        switch hex.count {
        case 3: // RGB (12-bit)
            (a, r, g, b) = (255, (int >> 8) * 17, (int >> 4 & 0xF) * 17, (int & 0xF) * 17)
        case 6: // RGB (24-bit)
            (a, r, g, b) = (255, int >> 16, int >> 8 & 0xFF, int & 0xFF)
        case 8: // ARGB (32-bit)
            (a, r, g, b) = (int >> 24, int >> 16 & 0xFF, int >> 8 & 0xFF, int & 0xFF)
        default:
            (a, r, g, b) = (255, 0, 0, 0)
        }
        self.init(red: CGFloat(r) / 255, green: CGFloat(g) / 255, blue: CGFloat(b) / 255, alpha: CGFloat(a) / 255)
    }
}
