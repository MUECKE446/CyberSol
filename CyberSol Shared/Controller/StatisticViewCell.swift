//
//  StatisticViewCell.swift
//  CyberSolitaire
//
//  Created by Christian Muth on 03.11.18.
//  Copyright © 2018 Christian Muth. All rights reserved.
//


#if os(iOS)

import UIKit

class StatisticViewCell: UITableViewCell {

    @IBOutlet weak var gameNameLabel: UILabel!
    @IBOutlet weak var totalGamesLabel: UILabel!
    @IBOutlet weak var totalWonLabel: UILabel!
    @IBOutlet weak var totalLostLabel: UILabel!
    @IBOutlet weak var totalTimeLabel: UILabel!
    @IBOutlet weak var deleteThisStatisticButton: UIButton!
    
}


#endif

#if os(OSX)

import AppKit

class StatisticViewCell: NSTableCellView {
    
    @IBOutlet weak var gameNameLabel: NSTextField!
    
    @IBOutlet weak var totalGamesSingle: NSTextField!
    @IBOutlet weak var totalGamesSingleWon: NSTextField!
    @IBOutlet weak var totalGamesSingleLost: NSTextField!
    @IBOutlet weak var totalTimeSingle: NSTextField!
    
    
    @IBAction func deleteGamesStatistic(_ sender: NSButton) {
    }
    
    
    
}

#endif
