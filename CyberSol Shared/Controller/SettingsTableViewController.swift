//
//  SettingsTableViewController.swift
//  CyberSolitaire
//
//  Created by Christian Muth on 08.10.18.
//  Copyright © 2018 Christian Muth. All rights reserved.
//


#if os(iOS)
import UIKit
#endif

#if os(OSX)
import AppKit
#endif




// Konstanten für SwiftyPlistManger
let settingsListName = "SettingsList"

let playTonesKey = "playTones"
let permitUndoRedoKey = "permitUndoRedo"
let permitCheatingKey = "permitCheating"

// verschoben in den GameViewController
/*
// settings variables, die alle Spiele betreffen
var playTones = true
var permitUndoRedo = true
var permitCheating = true
*/
#if os(iOS)
class SettingsTableViewController: UITableViewController,UIPopoverControllerDelegate {
 
    @IBOutlet weak var settingsTonesSwitch: UISwitch!
    @IBOutlet weak var settingsPermitCheating: UISwitch!
    @IBOutlet weak var settingsPermitUndoRedo: UISwitch!
    @IBOutlet weak var VersionLabel: UILabel!
    @IBOutlet weak var settingsDoneButton: UIButton!
    
    @IBAction func settingsTonesChanged(_ sender: Any) {
        playTones = !playTones
    }
    
    @IBAction func settingsPermitCheating(_ sender: Any) {
        permitCheating = !permitCheating
    }

    @IBAction func settingsPermitUndoRedo(_ sender: Any) {
        permitUndoRedo = !permitUndoRedo
    }
    
    @IBAction func settingsDone(_ sender: Any) {
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        settingsDoneButton.backgroundColor = UIColor.white
        settingsDoneButton.layer.cornerRadius = 5
        settingsDoneButton.layer.borderWidth = 1
        settingsDoneButton.layer.borderColor = UIColor.black.cgColor
        
        let versionText = "CyberSolitaire Version: " + CyberSolitaireVersion
        VersionLabel.text = versionText
        
        readSettingList()
        settingsTonesSwitch.setOn(playTones, animated: false)
        settingsPermitCheating.setOn(permitCheating, animated: false)
        settingsPermitUndoRedo.setOn(permitUndoRedo, animated: false)

        // Uncomment the following line to preserve selection between presentations
        // self.clearsSelectionOnViewWillAppear = false

    }

    // MARK: - Table view data source

    override func numberOfSections(in tableView: UITableView) -> Int {
        return 2
    }

    override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        switch section {
        case 0:
            return 1
        case 1:
            return 2
        default:
            fatalError("darf nicht vorkommen")
        }
    }

}

#endif

#if os(OSX)
class SettingsViewController: NSViewController {
    
    @IBOutlet weak var audioOnOffSwitch: NSSwitch!
    @IBOutlet weak var permitCheatingSwitch: NSSwitch!
    @IBOutlet weak var permitUndoSwitch: NSSwitch!
    @IBOutlet weak var allSettingsDone: NSButton!

    @IBAction func audioOnOffSwitch(_ sender: NSSwitch) {
        playTones = !playTones
    }
    
    @IBAction func permitCheatingSwitch(_ sender: NSSwitch) {
        permitCheating = !permitCheating
    }
    
    @IBAction func permitUndoSwitch(_ sender: Any) {
        permitUndoRedo = !permitUndoRedo
    }
    
    @IBAction func allSettingsDone(_ sender: NSButton) {
        writeSettingsList()
        dismiss(self)
    }
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        readSettingList()
        
        if playTones {
            audioOnOffSwitch.state = NSSwitch.StateValue.on
        }
        else {
            audioOnOffSwitch.state = NSSwitch.StateValue.off
        }
        
        if permitCheating {
            permitCheatingSwitch.state = NSSwitch.StateValue.on
        }
        else {
            permitCheatingSwitch.state = NSSwitch.StateValue.off
        }

        if permitUndoRedo {
            permitUndoSwitch.state = NSSwitch.StateValue.on
        }
        else {
            permitUndoSwitch.state = NSSwitch.StateValue.off
        }

        // Uncomment the following line to preserve selection between presentations
        // self.clearsSelectionOnViewWillAppear = false

    }


    
}


#endif


func readSettingList() {
    playTones = SwiftyPlistManager.shared.fetchValue(for: playTonesKey, fromPlistWithName: settingsListName) as! Bool
    permitCheating = SwiftyPlistManager.shared.fetchValue(for: permitCheatingKey, fromPlistWithName: settingsListName) as! Bool
    permitUndoRedo = SwiftyPlistManager.shared.fetchValue(for: permitUndoRedoKey, fromPlistWithName: settingsListName) as! Bool
}

func writeSettingsList() {
    SwiftyPlistManager.shared.save(playTones, forKey: playTonesKey, toPlistWithName: settingsListName) { (err) in
        if err != nil {
            logSwiftyPlistManager(err)
        }
    }
    SwiftyPlistManager.shared.save(permitCheating, forKey: permitCheatingKey, toPlistWithName: settingsListName) { (err) in
        if err != nil {
            logSwiftyPlistManager(err)
        }
    }
    SwiftyPlistManager.shared.save(permitUndoRedo, forKey: permitUndoRedoKey, toPlistWithName: settingsListName) { (err) in
        if err != nil {
            logSwiftyPlistManager(err)
        }
    }
}


