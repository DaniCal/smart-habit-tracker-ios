//
//  ChooseActionViewController.swift
//  SmartHabitTracker
//
//  Created by Daniel Lohse on 9/17/16.
//  Copyright © 2016 Superstudio. All rights reserved.
//

import Foundation
import UIKit

protocol ActionChosenDelegate {
    func userDidChooseAction(_ selectedAction: Int)
}

class ChooseActionViewController : UIViewController, UICollectionViewDataSource, UICollectionViewDelegate{
    
    var delegate : ActionChosenDelegate? = nil

    var appDelegate : AppDelegate = UIApplication.shared.delegate as! AppDelegate

    let reuseIdentifier = "chooseActionCell"
    var selectedAction : Int = -1;
    
    override func viewDidLoad() {
    
    }
    
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return self.appDelegate.actions.count
    }
    
    // make a cell for each cell index path
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        
        // get a reference to our storyboard cell
        let cell = collectionView.dequeueReusableCell(withReuseIdentifier: reuseIdentifier, for: indexPath as IndexPath) as! ActionCollectionViewCell
        var actions : [Action] = self.appDelegate.actions
        let imageName = actions[indexPath.row].actionName
        
        let image: UIImage = UIImage(named: imageName)!
        
        cell.actionSticker.image = image

        
        return cell
    }
    
    
    func collectionView(_ collectionView: UICollectionView, didSelectItemAt indexPath: IndexPath) {

        selectedAction = indexPath.item
        self.performSegue(withIdentifier: "showMainView", sender: self)
        
    }
    
    
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        
        if (delegate != nil){
            if(segue.identifier == "showMainView"){
                delegate!.userDidChooseAction(self.selectedAction)
            }
        }
    }

}
