//
//  TBVC.swift
//  Freemoticon
//
//  Created by Mavericks on 21/04/2016.
//  Copyright © 2016 Digital Rethink. All rights reserved.
//

import Foundation
import UIKit


class EmoticonCategoryTableViewController: UITableViewController {
    
    var names = [String]()
    var identities = [String]()
    var backgroundImage = UIImage(named: "emojis-background")
    
    
    override func viewDidLoad() {
        names = ["Faces, Signs & Clothes", "Pale Emojis","Cream White Emojis", "Moderate Brown Emojis","Dark Brown Emojis", "Black Emojis","Animals & Nature","Food & Drink","Activity and Sports","Travel & Places","Objects",
        "Hearts & Symbols", "Country Flags"]
        identities = ["A","B","C","D","E","F","G", "H","I","J","K","L","M"]
        self.tableView.backgroundColor = UIColor(patternImage: self.backgroundImage!).withAlphaComponent(0.2)
        //self.view.backgroundColor = UIColor(patternImage: self.backgroundImage!)
    }
    
    override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return names.count
    }
    
    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "Cell")
        cell?.textLabel!.text = names[indexPath.row]
        cell?.textLabel!.textColor = UIColor.white
        //cell?.detailTextLabel?.text = "D"
        cell?.textLabel?.adjustsFontSizeToFitWidth = true
        cell?.textLabel?.textAlignment = NSTextAlignment.center
        
        cell?.textLabel?.font = UIFont(name: "Heiti TC", size: 60)
        cell?.textLabel?.numberOfLines = 0
        cell?.textLabel?.minimumScaleFactor = 0.1
        cell?.textLabel?.baselineAdjustment = .alignCenters
        cell?.textLabel?.shadowColor = UIColor.black
        cell?.textLabel?.shadowOffset = CGSize(width: 2.0, height: 2.0)
        
        
        return cell!
    }
    
    override func tableView(_ tableView: UITableView, willDisplay cell: UITableViewCell, forRowAt indexPath: IndexPath) {
        cell.backgroundColor = UIColor.clear;
    }

    override func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        
        let vcName = identities[indexPath.row]
        let viewController = storyboard?.instantiateViewController(withIdentifier: vcName)
        self.navigationController?.pushViewController(viewController!, animated: true)
        
    }
}
