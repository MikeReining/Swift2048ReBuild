// Playground - noun: a place where people can play

import UIKit

var str = "Hello, playground"

enum TileObject {
    case Empty
    case Tile(Int)
}

var newTile: TileObject

newTile = .Empty
newTile = .Tile(10) // Associated data type

