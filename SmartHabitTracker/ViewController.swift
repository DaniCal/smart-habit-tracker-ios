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
        return delegate.items.count;
    }

    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell:UITableViewCell = self.actionTable.dequeueReusableCell(withIdentifier: cellIdentifier)! as UITableViewCell
        
        cell.textLabel?.text = delegate.items[indexPath.row]
        
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
        
        let indexPath = IndexPath(row: delegate.items.count - 1, section: 0)

        self.delegate.items.append(String(selectedAction))
        self.actionTable.beginUpdates()
        self.actionTable.insertRows(at: [indexPath], with: .automatic)
        self.actionTable.endUpdates()        
    }
}

