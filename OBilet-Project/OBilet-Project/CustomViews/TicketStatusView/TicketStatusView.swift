//
//  TicketStatusView.swift
//  OBilet-Project
//
//  Created by Ali Akgün on 25.01.2022.
//

import Foundation
import UIKit

enum ButtonStatus {
    case bus
    case plane
}
final class TicketStatusView: UIView{
    
    private static let NIB_NAME = "TicketStatusView"
    @IBOutlet var view: UIView!
    @IBOutlet weak var leftButton: UIButton!
    @IBOutlet weak var rightButton: UIButton!
    @IBOutlet weak var rightButtonView: UIView!
    @IBOutlet weak var leftButtonView: UIView!
    @IBOutlet weak var leftButtonImage: UIImageView!
    @IBOutlet weak var rightButtonImage: UIImageView!
    var selectedButtonStatus : ButtonStatus = ButtonStatus.bus
    var hiddenArray : [UIView] = []
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
            leftButtonView.backgroundColor = UIColor(hexString: ColorConstant.DasboardButtonBlue)
            leftButton.setTitleColor(UIColor.white, for: .normal)
            leftButtonImage.tintColor = UIColor.white

            rightButtonView.backgroundColor = UIColor(hexString: ColorConstant.DasboardButtonGrey)
            rightButton.setTitleColor(UIColor(hexString: ColorConstant.DasboardButtonDarkGrey), for: .normal)
            rightButtonImage.tintColor = UIColor(hexString: ColorConstant.DasboardButtonDarkGrey)
            selectedButtonStatus = .bus
            hiddenArray.forEach { item in
                item.isHidden = item.accessibilityIdentifier == "RoadDateView" ? false : true
            }
        case  rightButton:
            rightButtonView.backgroundColor = UIColor(hexString: ColorConstant.DasboardButtonBlue)
            rightButton.setTitleColor(UIColor.white, for: .normal)
            rightButtonImage.tintColor = UIColor.white

            leftButtonView.backgroundColor = UIColor(hexString: ColorConstant.DasboardButtonGrey)
            leftButton.setTitleColor(UIColor(hexString: ColorConstant.DasboardButtonDarkGrey), for: .normal)
            leftButtonImage.tintColor = UIColor(hexString: ColorConstant.DasboardButtonDarkGrey)
            selectedButtonStatus = .plane
            hiddenArray.forEach { item in
                item.isHidden = item.accessibilityIdentifier != "RoadDateView" ? false : true
            }
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
