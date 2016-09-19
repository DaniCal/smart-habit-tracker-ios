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
    func userDidChooseAction(selectedAction: Int)
}

class ChooseActionViewController : UIViewController, UICollectionViewDataSource, UICollectionViewDelegate{
    
    var delegate : ActionChosenDelegate? = nil
    
    let reuseIdentifier = "chooseActionCell"
    var items = ["1", "2", "3", "4", "5", "6", "7", "8", "9", "10"]
    var selectedAction : Int = -1;
    
    override func viewDidLoad() {
    
    }
    
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return self.items.count
    }
    
    // make a cell for each cell index path
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        
        // get a reference to our storyboard cell
        let cell = collectionView.dequeueReusableCell(withReuseIdentifier: reuseIdentifier, for: indexPath as IndexPath) as! ActionCollectionViewCell
        
        return cell
    }
    
    
    func collectionView(_ collectionView: UICollectionView, didSelectItemAt indexPath: IndexPath) {
        
        selectedAction = indexPath.item
        performSegue(withIdentifier: "showMainView", sender: self)
    }
    
    
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        
        if (delegate != nil){
            if(segue.identifier == "showMainView"){
                delegate!.userDidChooseAction(selectedAction: self.selectedAction)
            }
        }
    }

}
