//
//  SelectGameTableViewController-macOS.swift
//  CyberSol macOS
//
//  Created by Christian Muth on 05.03.24.
//

import Cocoa

class SelectGameTableViewController_macOS: NSViewController, NSTableViewDelegate, NSTableViewDataSource {

    
    struct GameWithDescription {
        var gameName : String
        var gameDescription : Dictionary<String,String>
    }
    
    var gamesWithDescriptionCanBeSelected : [GameWithDescription] = []

    @IBOutlet weak var tableView: NSTableView!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do view setup here.
        
        // fülle die Tabelle
        let allGames = getAllGames()
        for game in allGames {
            for (name,value) in game {
                let gameDescription = value["gameDescription"] as! Dictionary<String,String>
                let gameWithDescription = GameWithDescription(gameName: name, gameDescription: gameDescription)
                gamesWithDescriptionCanBeSelected.append(gameWithDescription)
            }
        }
        
        // sortiere in Aufsteigender Folge der Game-Namen
        gamesWithDescriptionCanBeSelected.sort(by: {$0.gameName < $1.gameName}) // dabei wird das Array neu sortiert
        
        
        // Uncomment the following line to preserve selection between presentations
        // self.clearsSelectionOnViewWillAppear = false

        // Uncomment the following line to display an Edit button in the navigation bar for this view controller.
        // self.navigationItem.rightBarButtonItem = self.editButtonItem
        
        tableView.delegate = self
        tableView.dataSource = self
        
    }

    
    override var representedObject: Any? {
        didSet {
            // update the view, if already loaded.
        }
    }
    
    // MARK: - Table view data source

    func numberOfRows(in tableView: NSTableView) -> Int {
        return gamesWithDescriptionCanBeSelected.count
    }
    
    func tableView(_ tableView: NSTableView, viewFor tableColumn: NSTableColumn?, row: Int) -> NSView? {
        guard let userCell = tableView.makeView(withIdentifier: NSUserInterfaceItemIdentifier(rawValue: "SelectGameCustomCell"), owner: self) as? SelectGameCustomCell else {
            return nil
        }
        let gameName = gamesWithDescriptionCanBeSelected[row].gameName

        userCell.gameNameLabel.stringValue = gameName
       
        return userCell
    }
    
    
    
    
}
