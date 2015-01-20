//
//  NumberTileGameVC.swift
//  Swift2048ReBuild
//
//  Created by Michael Reining on 1/20/15.
//  Copyright (c) 2015 Mike Reining. All rights reserved.
//

import UIKit

class NumberTileGameVC: UIViewController {

    override func viewDidLoad() {
        super.viewDidLoad()
    }
    
    @IBAction func startGameButtonTapped(sender : UIButton) {
        let game = NumberTileGameVC(dimension: 4, threshold: 2048)
        self.presentViewController(game, animated: true, completion: nil)
    }
}