//
//  TicketDetailView.swift
//  OBilet-Project
//
//  Created by Ali Akgün on 28.01.2022.
//

import UIKit

class TicketDetailView: UITableViewCell {
    let nibName = "TicketDetailView"

    @IBOutlet weak var destinationLabel: UILabel!
    @IBOutlet weak var destinationValue: UILabel!

    @IBOutlet weak var departureLabel: UILabel!
    @IBOutlet weak var departureValue: UILabel!

    @IBOutlet weak var stationDescription: UILabel!
    @IBOutlet weak var ticketAmount: UILabel!
    
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }
    
}
