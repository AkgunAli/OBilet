//
//  ViewController.swift
//  OBilet-Project
//
//  Created by Ali Akgün on 25.01.2022.
//

import UIKit

class ViewController: UIViewController {
    @IBOutlet weak var navigationBar: NavigationBar!
    @IBOutlet weak var ticketStatus: TicketStatusView!{
        didSet{
            ticketStatus.hiddenArray = [roundTripStackView ,passengerSelectionView,roadDateView]
        }
    }
    @IBOutlet weak var fromWherePicker: RoadCityView!{
        didSet{
            fromWherePicker.placeholderText = "İstanbul Avrupa"
            fromWherePicker.source = [ "test1","test2"]
        }
    }
    @IBOutlet weak var toWherePicker: RoadCityView!{
        didSet{
            toWherePicker.source = [ "test3","test4"]
            toWherePicker.placeholderText = "Ankara"
        }
    }
    @IBOutlet weak var roadDateView: RoadDateView!
    @IBOutlet weak var roundTripStackView: UIStackView!
    @IBOutlet weak var roundTripDepartureView: RoundTripView!
    @IBOutlet weak var roundTripReturnView: RoundTripView!{
        didSet{
            roundTripReturnView.imageBool = true
        }
    }
    @IBOutlet weak var passengerSelectionView: PassengerSelectionView!
    
    override func viewDidLoad() {
        super.viewDidLoad()
    }

    @IBAction func findTicketButtonAction(_ sender: Any) {
    }
}

