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
    var allGameNames: [String] = []                                         // alle gameNamen in derselben Ordnung wie sie in de table view angezeigt werden
    

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
 
        // allGameNames beinhaltet jetzt alle Namen in der Reihenfolge der table view
        for value in gamesWithDescriptionCanBeSelected {
            let gameDescription = value
            let gameName = gameDescription.gameName
            allGameNames.append(gameName)
        }
        

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
       
        switch gamesWithDescriptionCanBeSelected[row].gameDescription["difficulty"] {
                case "leicht":
                    userCell.gameNameLabel.backgroundColor = NSColor.systemGreen

                case "mittel":
            userCell.gameNameLabel.backgroundColor = NSColor.systemOrange

                case "schwer":
            userCell.gameNameLabel.backgroundColor = NSColor.systemRed

                default:
                    fatalError("darf nicht vorkommen")
                }
         
        return userCell
    }
    
    func tableView(_ tableView: NSTableView, heightOfRow row: Int) -> CGFloat {
        return 60.00
    }
    
    // MARK: - Table view selection
    
    func tableViewSelectionDidChange(_ notification: Notification) {
        let table = notification.object as! NSTableView
        if table.selectedRow != -1 {
            gameName = gamesWithDescriptionCanBeSelected[table.selectedRow].gameName
            //print("gameName: \(gameName)")
            table.deselectRow(table.selectedRow)
        }
        else {
            //print("no game selected")
        }

    }

    
    // MARK: - Navigation, Segue

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: NSStoryboardSegue, sender: Any?) {
        // Get the new view controller using segue.destination.
        // Pass the selected object to the new view controller.
        if segue.identifier == "PlayGame" {
            // gameName wurde bei der Selection in der Tabelle gesetzt

            _ = self.view.window?.frame
            _ = self.view.frame.origin

            (segue.destinationController as! GameViewController).segueSourceViewController = (segue.sourceController as! SelectGameTableViewController_macOS)
            
        }
        
        
        // TODO: muss wieder raus
        if segue.identifier == "Settings" {
            _ = segue.destinationController as! SettingsViewController
            
//            if let settingsPopoverPresentationController = destinationVC.popoverPresentationController {
//                settingsPopoverPresentationController.delegate = self as UIPopoverPresentationControllerDelegate?
//            }
            
        }
        
        if segue.identifier == "Statistics" {
            //log.info("")
            (segue.destinationController as! StatisticViewController).reArrangedAllGameNames = allGameNames
        }

    }
    
    override func performSegue(withIdentifier identifier: String, sender: Any?) {
        if sender is NSButton {
            if (sender as! NSButton).title == "Einstellungen" {
                performSegue(withIdentifier: "Settings", sender: sender)
            }
            if (sender as! NSButton).title == "Statistik" {
                performSegue(withIdentifier: "Statistics", sender: sender)
            }
        }
        else {
            performSegue(withIdentifier: "PlayGame", sender: sender)
        }
    }

}

