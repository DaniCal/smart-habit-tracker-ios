//
//  ViewController.swift
//  SmartHabitTracker
//
//  Created by Daniel Lohse on 9/16/16.
//  Copyright © 2016 Superstudio. All rights reserved.
//

import UIKit

class ViewController: UIViewController, ActionChosenDelegate, UITableViewDelegate, UITableViewDataSource {

    let cellIdentifier = "actionTableCell"
    var appDelegate : AppDelegate = UIApplication.shared.delegate as! AppDelegate
    
    @IBOutlet weak var actionTable: UITableView!
    
    override func viewDidLoad() {
        super.viewDidLoad()
    }
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return appDelegate.dayActions.count;
    }

    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = self.actionTable.dequeueReusableCell(withIdentifier: cellIdentifier)! as! ActionTableViewCell
        
        let imageName = appDelegate.dayActions[indexPath.row].actionName
        let image: UIImage = UIImage(named: imageName)!
        cell.actionSticker.image = image

        return cell
    }
    
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
    }
    
    
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        if (segue.identifier == "showChooseActionView"){
            let chooseActionVC:ChooseActionViewController = segue.destination  as! ChooseActionViewController
            chooseActionVC.delegate = self
        }
    }
    
    //#ACTIONS
    
    @IBAction func userDidChooseAction(_ selectedAction: Int){
        
        let indexPath = IndexPath(row: appDelegate.dayActions.count - 1, section: 0)
        let actionName = appDelegate.actions[selectedAction].actionName
        appDelegate.dayActions.append(Action(actionName: actionName))
        self.actionTable.beginUpdates()
        self.actionTable.insertRows(at: [indexPath], with: .automatic)
        self.actionTable.endUpdates()        
    }
}

