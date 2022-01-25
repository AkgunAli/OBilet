//
//  ViewController.swift
//  OBilet-Project
//
//  Created by Ali Akgün on 25.01.2022.
//

import UIKit

class ViewController: UIViewController {
    @IBOutlet weak var navigationBar: NavigationBar!
    @IBOutlet weak var fromWherePicker: RoadCityView!{
        didSet{
            fromWherePicker.source = [ "test1","test2"]
        }
    }
    @IBOutlet weak var toWherePicker: RoadCityView!{
        didSet{
            toWherePicker.source = [ "test3","test4"]
        }
    }
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
    }


}

