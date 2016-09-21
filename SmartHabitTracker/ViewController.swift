//
//  ViewController.swift
//  SmartHabitTracker
//
//  Created by Daniel Lohse on 9/16/16.
//  Copyright © 2016 Superstudio. All rights reserved.
//

import UIKit

class ViewController: UIViewController, ActionChosenDelegate, UITableViewDelegate, UITableViewDataSource {

    var items: [String] = ["1"]
    let cellIdentifier = "actionTableCell"
    var delegate : AppDelegate = UIApplication.shared.delegate as! AppDelegate
    
    //Mark properties
    @IBOutlet weak var actionTable: UITableView!
    
    override func viewDidLoad() {
        super.viewDidLoad()
    }
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return delegate.dayActions.count;
    }

    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = self.actionTable.dequeueReusableCell(withIdentifier: cellIdentifier)! as! ActionTableViewCell
        
//        cell.textLabel?.text = delegate.items[indexPath.row]
        
        let imageName = delegate.dayActions[indexPath.row].actionName
        
        let image: UIImage = UIImage(named: imageName)!
        
        cell.actionSticker.image = image

        
        return cell
    }
    
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {

        print("You selected cell #\(indexPath.row)!")
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
    
    @IBAction func userDidChooseAction(_ selectedAction: Int){
        
        let indexPath = IndexPath(row: delegate.dayActions.count - 1, section: 0)

        delegate.dayActions.append(Action(actionName: delegate.actions[selectedAction].actionName))
        self.actionTable.beginUpdates()
        self.actionTable.insertRows(at: [indexPath], with: .automatic)
        self.actionTable.endUpdates()        
    }
}

