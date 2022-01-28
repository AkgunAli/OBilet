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
    let dateFormater: DateFormatter = DateFormatter()
    var stringFromDate: String = ""
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

    
    @IBAction func todayButtonAction(_ sender: Any) {
        getCurrentDate()
    }
    @IBAction func tomorrowButtonAction(_ sender: Any) {
        stringFromDate = dateFormater.string(from: Date.tomorrow) as String
        dateInput.text = stringFromDate
    }
    
    func setDatePickerUI(){
        datePicker = UIDatePicker.init(frame: CGRect(x: 0, y: 0, width: view.bounds.size.width, height: 200))
        datePicker.addTarget(self, action: #selector(self.dateChanged), for: .allEvents)
        dateInput.inputView = datePicker
        datePicker.timeZone = NSTimeZone.local
        datePicker.locale = Locale(identifier: "tr")
        dateFormater.locale = Locale(identifier: "tr")
        dateFormater.dateFormat = "dd MMMM yyyy EEEE"
        datePicker.datePickerMode = .date
        dateInput.tintColor = .clear
        let doneButton = UIBarButtonItem.init(title: "Tamam", style: .done, target: self, action: #selector(self.datePickerDone))
        let toolBar = UIToolbar.init(frame: CGRect(x: 0, y: 0, width: view.bounds.size.width, height: 44))
        toolBar.setItems([UIBarButtonItem(barButtonSystemItem: UIBarButtonItem.SystemItem.flexibleSpace, target: nil, action: nil), doneButton], animated: true)
        dateInput.inputAccessoryView = toolBar
        getCurrentDate()
    }

    @objc func datePickerDone() {
        dateInput.resignFirstResponder()
    }

    @objc func dateChanged() {
        stringFromDate = dateFormater.string(from: self.datePicker.date) as String
        dateInput.text = stringFromDate
    }
    
    func getCurrentDate(){
        stringFromDate = dateFormater.string(from: Date()) as String
        dateInput.text = stringFromDate
    }
    func selectedDate() -> String {
        dateFormater.dateFormat = "yyyy-MM-dd"
        return dateFormater.string(from:  datePicker.date) as String
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
