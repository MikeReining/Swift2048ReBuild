//
//  AuxillaryModels.swift
//  Swift2048ReBuild
//
//  Created by Michael Reining on 1/20/15.
//  Copyright (c) 2015 Mike Reining. All rights reserved.
//

import Foundation

// Represent tile on board as empty or with Tile of type Int

enum TileObject {
    case Empty
    case Tile(Int)
}

// struct for square gameboard.

struct SquareGameboard<T> {
    let dimension: Int
    var boardArray: [T]
    
    init (dimension d: Int, initialValue: T) {
        dimension = d
        boardArray = [T](count: d*d, repeatedValue: initialValue)
    }
    
    subscript(row: Int, col: Int) -> T {
        get {
            assert(row >= 0 && row < dimension)
            assert(col >= 0 && col < dimension)
            return boardArray[row * dimension + col]
        }
        set {
            assert(row >= 0 && row < dimension)
            assert(row >= 0 && row < dimension)
            return boardArray[row * dimension + col] = newValue
        }
    }
    
    mutating func setAll(item: T) {
        for i in 0..<dimension {
            for j in 0..<dimension {
                self[i,j] = item
            }
        }
    }
}

// An enum representing a movement command issued by the view controller as the result of swiping

struct MoveCommand {
    var direction: MoveDirection
    var completion: (Bool) -> ()
    init(direction: MoveDirection, completion: (Bool) -> ()) {
        self.direction = direction
        self.completion = completion
    }
}

// Possible directions supported by the game model

enum MoveDirection {
    case Up
    case Down
    case Left
    case Right
}

