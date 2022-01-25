//
//  RoadDateView.swift
//  OBilet-Project
//
//  Created by Ali Akgün on 26.01.2022.
//

import Foundation
import UIKit

final class RoadDateView: UIView{
    
    private static let NIB_NAME = "RoadDateView"
    
    @IBOutlet var view: UIView!
    @IBOutlet weak var todayButton: UIButton!
    @IBOutlet weak var tomorrowButton: UIButton!
    @IBOutlet weak var dateLabel: UILabel!
    @IBOutlet weak var dateInput: UITextField!
    @IBOutlet weak var componentImage: UIImageView!
    var datePicker : UIDatePicker!

    override func awakeFromNib() {
        initWithNib()
    }
    
    private func initWithNib() {
        Bundle.main.loadNibNamed(RoadDateView.NIB_NAME, owner: self, options: nil)
        view.translatesAutoresizingMaskIntoConstraints = false
        addSubview(view)
        setupLayout()
        setDatePickerUI()
    }
    
    func setDatePickerUI(){
        datePicker = UIDatePicker.init(frame: CGRect(x: 0, y: 0, width: view.bounds.size.width, height: 200))
        datePicker.addTarget(self, action: #selector(self.dateChanged), for: .allEvents)
        dateInput.inputView = datePicker
        dateInput.tintColor = .clear
        let doneButton = UIBarButtonItem.init(title: "Done", style: .done, target: self, action: #selector(self.datePickerDone))
        let toolBar = UIToolbar.init(frame: CGRect(x: 0, y: 0, width: view.bounds.size.width, height: 44))
        toolBar.setItems([UIBarButtonItem(barButtonSystemItem: UIBarButtonItem.SystemItem.flexibleSpace, target: nil, action: nil), doneButton], animated: true)
        dateInput.inputAccessoryView = toolBar
    }

    @objc func datePickerDone() {
        dateInput.resignFirstResponder()
    }

    @objc func dateChanged() {
        dateInput.text = "\(datePicker.date)"
    }
    
    @IBAction func todayButtonAction(_ sender: Any) {
        
    }
    @IBAction func tomorrowButtonAction(_ sender: Any) {
        
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
