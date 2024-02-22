//
//  UserInteractionDelegate.swift
//  CyberSolitaire_SpriteKit
//
//  Created by Christian Muth on 24.03.15.
//  Copyright (c) 2015 Christian Muth. All rights reserved.
//

import Foundation

@objc protocol UserInteractionProtocolDelegate {
    
    var listOfUserInteractions: [Int] {get set}
    var userInteractionId: Int {get set}

    func setUserInteractionDisabledForDuration(_ duration: TimeInterval, actionId: Int)
    func enableUndoRedo()
    func disableUndoRedo()
    
}
