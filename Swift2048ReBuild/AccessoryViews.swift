//
//  AccessoryViews.swift
//  Swift2048ReBuild
//
//  Created by Michael Reining on 1/20/15.
//  Copyright (c) 2015 Mike Reining. All rights reserved.
//

import UIKit

protocol ScoreViewProtocol {
    func scoreChanged(newScore: Int)
}

class ScoreView: UIView {
    let defaultFrame = CGRectMake(0, 0, 140, 40)
    var label: UILabel
    var score: Int = 0 {
        didSet {
            label.text = "Score: \(score)"
        }
    }
    
    init(backgroundColor: UIColor, textColor: UIColor, font: UIFont, radius: CGFloat) {
        self.label = UILabel(frame: defaultFrame)
        self.label.textAlignment = NSTextAlignment.Center
        super.init(frame: defaultFrame)
        self.backgroundColor = backgroundColor
        self.label.textColor = textColor
        self.label.font = font
        self.layer.cornerRadius = radius
        self.addSubview(label)
    }
    
    required init(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    func scoreChanged(newScore: Int) {
        self.score = newScore
    }
}

class ControlView {
    let defaultFrame = CGRectMake(0, 0, 140, 40)
    // TODO: Implement this
}

