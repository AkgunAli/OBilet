//
//  RoadCityView.swift
//  OBilet-Project
//
//  Created by Ali Akgün on 25.01.2022.
//

import Foundation
import UIKit
final class RoadCityView: UIView{
    
    private static let NIB_NAME = "RoadCityView"
    @IBOutlet var view: UIView!
    @IBOutlet weak var roadCityDescription: UILabel!
    @IBOutlet weak var roadCityInput: UITextField!
    
    var source : [String] = [""]
    let picker = UIPickerView()
    var placeholderText : String?
    override func awakeFromNib() {
        initWithNib()
        picker.delegate = self
        picker.dataSource = self
        createToolbar()
    }

    private func initWithNib() {
        Bundle.main.loadNibNamed(RoadCityView.NIB_NAME, owner: self, options: nil)
        view.translatesAutoresizingMaskIntoConstraints = false
        addSubview(view)
        setupLayout()
        roadCityInput.inputView = picker
        roadCityInput.tintColor = UIColor.clear
        roadCityInput.placeholder = placeholderText
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
    
    func createToolbar() {
        let toolBar = UIToolbar()
        toolBar.sizeToFit()
        
        let doneButton = UIBarButtonItem(title: "Tamam", style: .plain, target: self, action: #selector(self.dismissPicker))
        toolBar.setItems([doneButton], animated: false)
        
        toolBar.isUserInteractionEnabled = true
        roadCityInput.inputAccessoryView = toolBar
    }
    @objc func dismissPicker() {
        view.endEditing(true)
    }
}

extension RoadCityView : UIPickerViewDelegate, UIPickerViewDataSource{
    func numberOfComponents(in pickerView: UIPickerView) -> Int {
        return 1
    }
    
    func pickerView(_ pickerView: UIPickerView, numberOfRowsInComponent component: Int) -> Int {
        return source.count
    }
    
    func pickerView(_ pickerView: UIPickerView, titleForRow row: Int, forComponent component: Int) -> String? {
         return source[row]
    }
    
    func pickerView(_ pickerView: UIPickerView, didSelectRow row: Int, inComponent component: Int) {
        roadCityInput.text = source[row]
    }
}
