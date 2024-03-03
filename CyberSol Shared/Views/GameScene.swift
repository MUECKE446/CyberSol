//
//  GameScene.swift
//  CyberSolitaire_SpriteKit
//
//  Created by Christian Muth on 08.03.15.
//  Copyright (c) 2015 Christian Muth. All rights reserved.
//

import SpriteKit

#if os(iOS)
import UIKit
#endif

#if os(OSX)
import AppKit
#endif



var playableRect = CGRect.zero
var longestDistance = CGFloat(0.0)
let durationForLongestDistance: CGFloat = 1.0
var speedFactor = CGFloat(0.0)

class GameScene: SKScene {

    weak var sceneDelegate: TouchesProtocolDelegate? = nil
    
    #if os(iOS)
    var cardNodes: [CardNode]? = []
    var pileEmptyNodes: [PileEmptyNode]? = []
    #endif
    
    #if os(OSX)
    var cardNodes: [CardNode]? = []
    var pileEmptyNodes: [PileEmptyNode]? = []
    #endif


    
    deinit {
        log.verbose("GameScene deinit")
    }
    
    override func didMove(to view: SKView) {
        //let background = SKSpriteNode(imageNamed: "CyberSol_Background1")
        let background = SKSpriteNode(imageNamed: "BackgroundWildWest")
//        background.setScale(0.5)
        background.yScale = size.height/background.size.height
        background.xScale = size.width/background.size.width
        background.position = CGPoint(x: size.width/2, y: size.height/2)
        background.anchorPoint = CGPoint(x: 0.5, y: 0.5)
        background.zPosition = -1
        addChild(background)
        
        //log.verbose("add Nodes cards:\(cardNodes.count) piles:\(pileEmptyNodes.count)")
        for node in cardNodes! {
            addChild(node)
        }
        for node in pileEmptyNodes! {
            addChild(node)
        }
        //log.verbose("scene moved")
    }
    
    override func update(_ currentTime: TimeInterval) {
         /* Called before each frame is rendered */
     }
  
    #if os(iOS)

    override func touchesBegan(_ touches: Set<UITouch>, with event: UIEvent?) {
        // Aktionen, die nicht auf einer Card oder PileEmpty ausgeführt werden, interesieren nicht
    }
   
    override func touchesEnded(_ touches: Set<UITouch>, with event: UIEvent?) {
        let dict = ["Game":-1]
        sceneDelegate!.tapOnGameWithDictionary(dict)
    }
    
    override func touchesMoved(_ touches: Set<UITouch>, with event: UIEvent?) {
        // Aktionen, die nicht auf einer Card oder PileEmpty ausgeführt werden, interesieren nicht
    }
 
    #endif
    
    #if os(OSX)

    // Mouse-based event handling
    override func mouseDown(with theEvent: NSEvent) {
        // Aktionen, die nicht auf einer Card oder PileEmpty ausgeführt werden, interesieren nicht
    }

    override func mouseUp(with theEvent: NSEvent) {
        //let location = theEvent.location(in: self)
        let dict = ["Game":-1]
        sceneDelegate!.tapOnGameWithDictionary(dict)
    }

    override  func mouseDragged(with theEvent: NSEvent) {
        // Aktionen, die nicht auf einer Card oder PileEmpty ausgeführt werden, interesieren nicht
    }

    #endif
    
 
}
