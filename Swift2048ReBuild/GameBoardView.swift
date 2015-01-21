//
//  GameBoardView.swift
//  Swift2048ReBuild
//
//  Created by Michael Reining on 1/20/15.
//  Copyright (c) 2015 Mike Reining. All rights reserved.
//

import UIKit

class GameBoardView: UIView {
    var dimension: Int
    var tileWidth: CGFloat
    var tilePadding: CGFloat
    var cornerRadios: CGFloat
    var tiles: Dictionary<NSIndexPath, TileView>
    
    let provider = AppearanceProvider()
    
    let tilePopStartScale: CGFloat = 0.1
    let tilePopMaxScale: CGFloat = 1.1
    let tilePopDelay: NSTimeInterval = 0.05
    let tileExpandTime: NSTimeInterval = 0.18
    let tileContractTime: NSTimeInterval = 0.08
    
    let tileMergeStartScale: CGFloat = 1
    let tileMergeExpandTime: NSTimeInterval = 0.08
    let tileMergeContractTime: NSTimeInterval = 0.08
    
    let perSquareSlideDuration: NSTimeInterval = 0.08
    
    init(dimension: Int, tileWidth: CGFloat, tilePadding padding: CGFloat, cornerRadius radius: CGFloat, backgroundColor: UIColor, foregroundColor: UIColor) {
        assert(dimension > 0)
        self.dimension = dimension
        self.tileWidth = tileWidth
        self.tilePadding = padding
        self.cornerRadios = radius
        self.tiles = Dictionary()
        let sideLength = padding + CGFloat(dimension) * (tileWidth + padding)
        super.init(frame: CGRectMake(0, 0, sideLength, sideLength))
        layer.cornerRadius = radius
        setupBackground(backgroundColor, tileColor: foregroundColor)
    }

    required init(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    func setupBackground(backgroundColor: UIColor, tileColor: UIColor) {
        self.backgroundColor = backgroundColor
        var xCursor = tilePadding
        var yCursor: CGFloat
        let bgRadius = (cornerRadios >= 2) ? cornerRadios - 2 : 0
        for i in 0..<dimension {
            yCursor = tilePadding
            for j in 0..<dimension {
                //Draw each tile
                let background = UIView(frame: CGRectMake(xCursor, yCursor, tileWidth, tileWidth))
                background.layer.cornerRadius = bgRadius
                background.backgroundColor = tileColor
                addSubview(background)
                yCursor += tilePadding + tileWidth
            }
            xCursor += tilePadding + tileWidth
        }
    }
    
    // Reset the gameboard
    func reset() {
        for (key, tile) in tiles {
            tile.removeFromSuperview()
        }
        tiles.removeAll(keepCapacity: true)
    }
}

