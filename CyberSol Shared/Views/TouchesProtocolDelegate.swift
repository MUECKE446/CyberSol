//
//  TouchesProtocol.swift
//  CyberSolitaire_SpriteKit
//
//  Created by Christian Muth on 13.03.15.
//  Copyright (c) 2015 Christian Muth. All rights reserved.
//

import Foundation


enum TouchType {
    case
    touchesBegan,
    touchesEnded,
    touchesMoved
    
}

@objc protocol TouchesProtocolDelegate {
    
    func tapOnGameWithDictionary(_ dict: Dictionary<String, Int>)
    
}
