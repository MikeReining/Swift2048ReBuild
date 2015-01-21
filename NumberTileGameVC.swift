//
//  NumberTileGameVC.swift
//  Swift2048ReBuild
//
//  Created by Michael Reining on 1/20/15.
//  Copyright (c) 2015 Mike Reining. All rights reserved.
//

import UIKit

class NumberTileGameVC: UIViewController {
    var dimension: Int // number of tiles in both directions
    var threshold: Int // value of winning tile
    var board: GameBoardView?
    var model: GameModel?
    var scoreView: ScoreViewProtocol?
    
    // Draw gameboard programatically
    var boardWidth: CGFloat = 230 // width of gameboard
    let thinPadding: CGFloat = 3.0
    let thickPadding: CGFloat = 6.0
    let viewPadding: CGFloat = 10.0
    
    init(dimension d: Int, threshold t: Int) {
        dimension = d > 2 ? d : 2
        threshold = t > 8 ? t : 8
        super.init(nibName: nil, bundle: nil)
        model = GameModel(dimension: dimension, threshold: threshold, delegate: GameModelProtocol.self)
        view.backgroundColor = UIColor.whiteColor()
        setupSwipeControls()
    }

    required init(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    func setupSwipeControls() {
        let upSwipe = UISwipeGestureRecognizer(target: self, action: Selector("up:"))
        upSwipe.numberOfTouchesRequired = 1
        upSwipe.direction = UISwipeGestureRecognizerDirection.Up
        view.addGestureRecognizer(upSwipe)
        
        let downSwipe = UISwipeGestureRecognizer(target: self, action: Selector("down"))
        downSwipe.numberOfTouchesRequired = 1
        downSwipe.direction = UISwipeGestureRecognizerDirection.Down
        view.addGestureRecognizer(downSwipe)
        
        let leftSwipe = UISwipeGestureRecognizer(target: self, action: Selector("left"))
        leftSwipe.numberOfTouchesRequired = 1
        leftSwipe.direction = UISwipeGestureRecognizerDirection.Left
        view.addGestureRecognizer(leftSwipe)
        
        let rightSwipe = UISwipeGestureRecognizer(target: self, action: Selector("right"))
        rightSwipe.numberOfTouchesRequired = 1
        rightSwipe.direction = UISwipeGestureRecognizerDirection.Right
        view.addGestureRecognizer(rightSwipe)
    }
    
    func setupGame() {
        let vcHeight = view.bounds.size.height
        let vcWidth = view.bounds.size.width
    }
    
    // View Controller
    override func viewDidLoad() {
        super.viewDidLoad()
        
    }
    
}