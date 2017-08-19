//
//  CreateAccountVC.swift
//  Smack
//
//  Created by Sanjay Vekariya on 8/19/17.
//  Copyright © 2017 Sanjay Vekariya. All rights reserved.
//

import UIKit

class CreateAccountVC: UIViewController {

    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
    }
    
    @IBAction func closedPressed(_ sender: Any) {
        performSegue(withIdentifier: UNWIND, sender: nil)
    }
}
