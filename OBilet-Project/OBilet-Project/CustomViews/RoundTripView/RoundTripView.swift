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
    @IBOutlet weak var contentView: UIView!
    @IBOutlet weak var dateInput: UITextField!
    @IBOutlet weak var dayDescriptionLabel: UILabel!
    
    @IBOutlet weak var dayCountLabel: UILabel!
    @IBOutlet weak var monthLabel: UILabel!
    @IBOutlet weak var dayTextLabel: UILabel!
    
    var imageBool : Bool = false
    var datePicker = UIDatePicker()
    let dateFormater: DateFormatter = DateFormatter()
    var stringFromDate: String = ""
    var isTomorrow = false
    var dayDescription : String?
    override func awakeFromNib() {
        initWithNib()
    }

    private func initWithNib() {
        Bundle.main.loadNibNamed(RoundTripView.NIB_NAME, owner: self, options: nil)
        view.translatesAutoresizingMaskIntoConstraints = false
        addSubview(view)
        setupLayout()
        imageView.isHidden = imageBool
        setDatePickerUI()
        dayDescriptionLabel.text = dayDescription
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
        getCurrentDate(isTomorrow: isTomorrow, date: Date())
    }
    @objc func datePickerDone() {
        dateInput.resignFirstResponder()
    }
    @objc func dateChanged() {
        getCurrentDate(isTomorrow: false, date: datePicker.date)
    }
    func getCurrentDate(isTomorrow : Bool , date : Date){
        var month = ""
        var dayCount = ""
        var dayText = ""
        
        if isTomorrow {
            dateFormater.dateFormat = "MMMM"
            month = dateFormater.string(from: Date.tomorrow)
            dateFormater.dateFormat = "d"
            dayCount = dateFormater.string(from: Date.tomorrow)
            dateFormater.dateFormat = "EEEE"
            dayText = dateFormater.string(from: Date.tomorrow)
        } else {
            dateFormater.dateFormat = "MMMM"
            month = dateFormater.string(from: date)
            dateFormater.dateFormat = "d"
            dayCount = dateFormater.string(from: date)
            dateFormater.dateFormat = "EEEE"
            dayText = dateFormater.string(from: date)
        }
        dayCountLabel.text =  dayCount
        monthLabel.text =  month
        dayTextLabel.text =  dayText
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
