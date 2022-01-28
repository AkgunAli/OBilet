//
//  ViewController.swift
//  OBilet-Project
//
//  Created by Ali Akgün on 25.01.2022.
//

import UIKit

class ViewController: UIViewController {
    @IBOutlet weak var navigationBar: NavigationBar!
    let viewModel = TicketSearchVM ()
    @IBOutlet weak var ticketStatus: TicketStatusView!{
        didSet{
            ticketStatus.hiddenArray = [roundTripStackView ,passengerSelectionView,roadDateView]
        }
    }
    @IBOutlet weak var fromWherePicker: RoadCityView!{
        didSet{
            fromWherePicker.setUI(source: viewModel.fromWhereArray , placeholderText: "İstanbul Avrupa", image: UIImage(named: "location-empty")!)
        }
    }
    @IBOutlet weak var toWherePicker: RoadCityView!{
        didSet{
//            toWherePicker.source = [ "test3","test4"]
//            toWherePicker.placeholderText = "Ankara"
            toWherePicker.setUI(source: viewModel.toWhereArray, placeholderText: "İstanbul Avrupa", image: UIImage(named: "location-full")!)

        }
    }
    @IBOutlet weak var roadDateView: RoadDateView!
    @IBOutlet weak var roundTripStackView: UIStackView!
    @IBOutlet weak var roundTripDepartureView: RoundTripView!{
        didSet{
            roundTripDepartureView.isTomorrow = false
            roundTripDepartureView.dayDescription = "Gidiş"

        }
    }
    @IBOutlet weak var roundTripReturnView: RoundTripView!{
        didSet{
            roundTripReturnView.imageBool = true
            roundTripReturnView.isTomorrow = true
            roundTripReturnView.dayDescription = "Dönüş"
        }
    }
    @IBOutlet weak var passengerSelectionView: PassengerSelectionView!{
        didSet{
            passengerSelectionView.setUI(source: viewModel.passengerAddArray, placeholderText: "Yolcu Ekle")
        }
    }
    @IBOutlet weak var findTicketButton: UIButton!{
        didSet{
            findTicketButton.setTitle("Bileti Bul", for: UIControl.State.normal)
        }
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        viewModel.getBusLocations(completion: {
            DispatchQueue.main.async {
                self.fromWherePicker.source = self.viewModel.fromWhereArray
                self.toWherePicker.source = self.viewModel.toWhereArray

            }
        })
    }

    @IBAction func findTicketButtonAction(_ sender: Any) {
        guard  let selectedBusParentIdFromWhere = fromWherePicker.selectedBusParentId,
               let selectedBusParentIdToWhere = toWherePicker.selectedBusParentId else { return }

        print("roadDateView.datePicker.date",roadDateView.datePicker.date)
        viewModel.getBusJourneys(originId:selectedBusParentIdFromWhere, destinationId: selectedBusParentIdToWhere, departureDate: roadDateView.selectedDate(), completion: {
            DispatchQueue.main.async {
                let vc = self.storyboard?.instantiateViewController(withIdentifier: "TicketResultScreenVC") as! TicketResultScreenVC
                vc.viewModel.busJourneysResponse = self.viewModel.busJourneysResponse
                vc.viewModel.selectedJourneyDate = self.roadDateView.selectedDate(isDetailDate: true)
                vc.modalPresentationStyle = .fullScreen
                self.present(vc, animated: true, completion: nil)
            }
        })
    }
    
    @IBAction func changeButtonAction(_ sender: Any) {
        guard  let fromWherePickerIndex = fromWherePicker.selectedIndex,
               let toWherePickerIndex = toWherePicker.selectedIndex else { return }
        toWherePicker.setNewPicker(index: fromWherePickerIndex)
        fromWherePicker.setNewPicker(index: toWherePickerIndex)
    }
}

