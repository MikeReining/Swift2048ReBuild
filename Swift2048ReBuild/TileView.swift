//
//  TileView.swift
//  Swift2048ReBuild
//
//  Created by Michael Reining on 1/20/15.
//  Copyright (c) 2015 Mike Reining. All rights reserved.
//

import UIKit

class TileView: UIView {

    var delegate: AppearanceProviderProtocol
    var value: Int = 0 {
        didSet {
            backgroundColor = delegate.tileColor(value)
            numberLabel.textColor = delegate.numberColor(value)
            numberLabel.text = "\(value)"
        }
    }
    var numberLabel: UILabel
    
    init(position: CGPoint, width: CGFloat, value: Int, radius: CGFloat, delegate: AppearanceProviderProtocol) {
        self.delegate = delegate
        self.numberLabel = UILabel(frame: CGRectMake(0, 0, width, height))
        self.numberLabel.textAlignment = NSTextAlignment.Center
        self.numberLabel.minimumScaleFactor = 0.5
        self.numberLabel.font = delegate.fontForNumbers()
        
        super.init(frame: CGRectMake(position.x, position.y, width, height))
        addSubview(numberLabel)
        layer.cornerRadius = radius
        
        self.value = value
        backgroundColor = delegate.tileColor(value)
        numberLabel.textColor = delegate.numberColor(value)
        number.text = "\(value)"

    
    }

    required init(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
}
