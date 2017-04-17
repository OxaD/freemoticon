//
//  DarkBrownEmojisViewController.swift
//  Freemoticon
//
//  Created by Mavericks on 24/04/2016.
//  Copyright © 2016 Digital Rethink. All rights reserved.
//

import UIKit

class DarkBrownEmojisViewController: UIViewController, UICollectionViewDataSource, UICollectionViewDelegate {
    
    let reuseIdentifier = "darkBrownEmojisCell" // also enter this string as the cell identifier in the storyboard
    var emoticons = ["👦🏾","👧🏾","👨🏾","👩🏾","👴🏾","👵🏾","👶🏾","👱🏾","👮🏾","👲🏾","👳🏾","👷🏾","👸🏾","💂🏾","🎅🏾","👼🏾","💆🏾","💇🏾",
                     "👰🏾","🙍🏾","🙎🏾","🙅🏾","🙆🏾","💁🏾","🙋🏾","🙇🏾","🙌🏾","🙏🏾","🚶🏾","🏃🏾","💃🏾","💪🏾","👈🏾","👉🏾","☝️🏾","👆🏾",
                     "🖕🏾","👇🏾","✌️🏾","🖖🏾","🤘🏾","🖐🏾","✊🏾","✋🏾","👊🏾","👌🏾","👍🏾","👎🏾","👋🏾","👏🏾","👐🏾","✍🏾","💅🏾","👂🏾",
                     "👃🏾","🚣🏾","🛀🏾","🏄🏾","🏇","🏾","🏊🏾","⛹🏾","🏋🏾","🚴🏾","🚵🏾"]
    
    // tell the collection view how many cells to make
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return self.emoticons.count
    }
    
    // make a cell for each cell index path
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        
        // get a reference to our storyboard cell
        let cell = collectionView.dequeueReusableCell(withReuseIdentifier: reuseIdentifier, for: indexPath) as! MyCollectionViewCell
        
        // Use the outlet in our custom class to get a reference to the UILabel in the cell
        cell.myLabel.text = self.emoticons[indexPath.item]
        cell.backgroundColor = UIColor.white // make cell more visible in our example project
        cell.layer.borderColor = UIColor.lightGray.cgColor
        cell.layer.borderWidth = 1
        cell.layer.cornerRadius = 8
        
        return cell
    }
    
    // MARK: - UICollectionViewDelegate protocol
    
    func collectionView(_ collectionView: UICollectionView, didSelectItemAt indexPath: IndexPath) {
        // handle tap events
        //print("You selected cell #\(indexPath.item)!")
        //print("You selected cell #\(emoticons[indexPath.row])!")
        
        let alertEmoticon = "\(emoticons[indexPath.row])"
        self.copyText(alertEmoticon)
        self.showConfirmCopyAlert(alertEmoticon)
        
    }
    
    func showConfirmCopyAlert (_ copiedText : String) {
        let paragraphStyle = NSMutableParagraphStyle()
        paragraphStyle.firstLineHeadIndent = 0.0
        paragraphStyle.paragraphSpacingBefore = 0.0
        let alertController = UIAlertController(title: "Copied", message: "Ready to paste", preferredStyle: .alert)
        let attributedString = NSAttributedString(string: copiedText, attributes: [
            NSParagraphStyleAttributeName: paragraphStyle,
            NSFontAttributeName : UIFont.systemFont(ofSize: 60),
            NSForegroundColorAttributeName : UIColor.red
            ])
        //let alert = UIAlertController(title: "Title", message: "", preferredStyle: .Alert)
        alertController.setValue(attributedString, forKey: "attributedMessage")
        
        self.present(alertController, animated: true, completion: nil)
        
        
        let delay = 0.1 * Double(NSEC_PER_SEC)
        let time = DispatchTime.now() + Double(Int64(delay)) / Double(NSEC_PER_SEC)
        DispatchQueue.main.asyncAfter(deadline: time, execute: {
            alertController.dismiss(animated: true, completion: nil)
        })
    }
    func copyText(_ textToCopy: String) {
        let pasteBoard = UIPasteboard.general
        pasteBoard.string = textToCopy;
    }
    
    // change the background color when user touches cell
    func collectionView(_ collectionView: UICollectionView, didHighlightItemAt indexPath: IndexPath) {
        let cell = collectionView.cellForItem(at: indexPath)
        cell?.backgroundColor = UIColor.lightGray
    }
    
    // change the background color back when user releases touch
    func collectionView(_ collectionView: UICollectionView, didUnhighlightItemAt indexPath: IndexPath) {
        let cell = collectionView.cellForItem(at: indexPath)
        cell?.backgroundColor = UIColor.white
    }
}
