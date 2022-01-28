//
//  TicketResultScreenVC.swift
//  OBilet-Project
//
//  Created by Ali Akgün on 28.01.2022.
//

import UIKit

class TicketResultScreenVC: UIViewController{
    let viewModel = TicketResultScreenVM ()
    @IBOutlet weak var navigationBar: NavigationBar!{
        didSet{
            navigationBar.setDelegate(vc: self)
            navigationBar.titleRotationText = (viewModel.busJourneysResponse?.first?.originLocation ?? "" ) + " - " + ( viewModel.busJourneysResponse?.first?.destinationLocation ?? "")
            navigationBar.titleTimeText = viewModel.selectedJourneyDate ?? ""
            navigationBar.isTitleHidden = false
        }
    }
    @IBOutlet weak var tableView: UITableView!
    override func viewDidLoad() {
        super.viewDidLoad()
        tableView.dataSource = self
        tableView.delegate = self
        self.tableView.register(UINib(nibName: TicketDetailView().nibName, bundle: nil), forCellReuseIdentifier: TicketDetailView().nibName)
        navigationBar.isLeftButtonHidden = false
        tableView.tableFooterView = UIView()
    }
}

extension TicketResultScreenVC : UITableViewDelegate,UITableViewDataSource {
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return viewModel.busJourneysResponse?.count ?? 0
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "TicketDetailView", for:indexPath) as! TicketDetailView
        cell.destinationValue.text = convertDateFormat(viewModel.busJourneysResponse?[indexPath.row].journey?.departure  ?? "")
        cell.departureValue.text = convertDateFormat(viewModel.busJourneysResponse?[indexPath.row].journey?.arrival ?? "")
        cell.stationDescription.text = (viewModel.busJourneysResponse?[indexPath.row].journey?.origin ?? "") + " - " +
            (viewModel.busJourneysResponse?[indexPath.row].journey?.destination ?? "")
        cell.ticketAmount.text = replaceAmount(String(format: "%.02f", viewModel.busJourneysResponse?[indexPath.row].journey?.originalPrice ?? 0)) + " " + currentlyMoney(money: viewModel.busJourneysResponse?[indexPath.row].journey?.currency ?? "")
        return cell
    }
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        return 100.0
    }

}
extension TicketResultScreenVC {
    func convertDateFormat(_ inputDate: String) -> String {

         let olDateFormatter = DateFormatter()
         olDateFormatter.dateFormat = "yyyy-MM-dd'T'HH:mm:ss"
         let oldDate = olDateFormatter.date(from: inputDate)
         let convertDateFormatter = DateFormatter()
         convertDateFormatter.dateFormat = "h:mm"
         return convertDateFormatter.string(from: oldDate!)
    }
    
    func currentlyMoney(money: String) -> String {
        switch money {
        case "TRY":
            return "TL"
        default:
        return ""
        }
    }
    func replaceAmount(_ str:String) -> String {
        return str.replacingOccurrences(of: ".", with: ",", options: .literal, range: nil)
    }
}
