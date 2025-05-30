//
//  ViewController.swift
//  FinalTest
//
//  Created by nourhan essam on 30/05/2025.
//

import UIKit

class ViewController: UIViewController {

    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
        
        var obj: NetworkManager!
        obj = NetworkManager()
        obj.getLeagues(sport: "football"){ (result) in
            print(result)
        }
    }
}

