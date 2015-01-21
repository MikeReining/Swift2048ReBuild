//
//  GameModel.swift
//  Swift2048ReBuild
//
//  Created by Michael Reining on 1/20/15.
//  Copyright (c) 2015 Mike Reining. All rights reserved.
//

import UIKit

// Protocol allows Game Model to communicate with View Controller
protocol GameModelProtocol {
    func scoreChanged(score: Int)
    func moveOneTile(from: (Int, Int), to: (Int, Int), value: Int)
    func moveTwoTiles(from: ((Int, Int), (Int, Int)), to: (Int, Int), value: Int)
    func insertTile(location: (Int, Int), value: Int)
}

class GameModel: NSObject {
    let dimension: Int
    let threshold: Int
    let delegate: GameModelProtocol
    var score: Int = 0 {
        didSet {
            delegate.scoreChanged(score)
        }
    }
    var gameboard: SquareGameboard<TileObject>
    var queue: [MoveCommand]
    var timer: NSTimer
    let maxCommands = 100
    let queueDelay = 0.3
    
    init(dimension: Int, threshold: Int, delegate: GameModelProtocol) {
        self.dimension = dimension
        self.threshold = threshold
        self.delegate = delegate
        queue = [MoveCommand]()
        timer = NSTimer()
        gameboard = SquareGameboard(dimension: dimension, initialValue: .Empty)
        super.init()
    }
    
    // Reset the game state
    func reset() {
        score = 0
        queue.removeAll(keepCapacity: true)
    }
    
    // Order the game to perfor a move (because the user swiped their finger).  The queue enforces a delay of a few milliseconds
    func queueMove(direction: MoveDirection, completion: (Bool) -> ()) {
        if queue.count > maxCommands {
            // queue is wedged.  This should actually never happen in practice
            return
        }
        let command = MoveCommand(direction: direction, completion: completion)
        queue.append(command)
        if (!timer.valid) {
            // Timer is not running, so fire the event immediately
            timerFired(timer)
        }
    }
    
    // Inform the game model that the move delay timer fired.  Once the timer fires, the game model tries to execute a single move that changes the game state
    func timerFired(timer: NSTimer) {
        if queue.count == 0 {
            return
        }
        // Go through queue until a valid command is run or the queue is empty
        var changed = false
        while queue.count > 0 {
            let command = queue[0]
            queue.removeAtIndex(0)
            changed = performMove(command.direction)
            command.completion(changed)
            if changed {
                // If the command does not change anything, we immediately run the next one
                break
            }
        }
        if changed {
            self.timer = NSTimer.scheduledTimerWithTimeInterval(queueDelay,
                target: self,
                selector: Selector("timerFired:"),
                userInfo: nil,
                repeats: false)
        }
    }
    
    // Insert a tile with a given value at a position upon the gameboard
    func insertTile(pos: (Int, Int), value: Int) {
        let (x,y) = pos
        switch gameboard [x, y] {
        case .Empty:
            gameboard[x, y] = TileObject.Tile(value)
            delegate.insertTile(pos, value: value)
        case .Tile:
            break
        }
    }
    
    
    
}