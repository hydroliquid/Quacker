//
//  QuackCellTableViewCell.swift
//  Quacker
//
//  Created by MICHAEL BENTON on 2/21/19.
//  Copyright © 2019 Dan. All rights reserved.
//

import UIKit

class QuackCellTableViewCell: UITableViewCell
{

    @IBOutlet weak var userImageView: UIImageView!
    @IBOutlet weak var userName: UILabel!
    @IBOutlet weak var quackTextContent: UILabel!
    @IBOutlet weak var favButton: RoundUIButton!
    @IBOutlet weak var requackButton: RoundUIButton!
    
    
    var favorited: Bool = false
    var quackId: Int = -1
    var requacked: Bool = false
    
    @IBAction func favQuack(_ sender: Any)
    {
        let toBeFvorited = !favorited
        
        if(toBeFvorited)
        {
            TwitterAPICaller.client?.favoriteQuack(quackId: quackId, success: { self.setFavorite(isFavorited: true)}, failure: { (error) in
                print("Favorite did not succeed: \(error)")
            })
        }else
        {
            TwitterAPICaller.client?.unfavoriteQuack(quackId: quackId, success: { self.setFavorite(isFavorited: false)}, failure: {(error) in print("Unfavorite did not succeed: \(error)")
                
            })
        }
    }
    
    func setFavorite(isFavorited: Bool)
    {
        favorited = isFavorited
        if(favorited)
        {
            favButton.setImage(UIImage(named: "favor-icon-red"), for: UIControl.State.normal)
        }
        else{
            favButton.setImage(UIImage(named: "favor-icon"), for: UIControl.State.normal)
        }
    }
    
    @IBAction func reQuack(sender: Any)
    {
        TwitterAPICaller.client?.requack(quackId: quackId,
            success:
            {self.setRequacked(isRequacked: true)},failure:{(error) in print("Error in requacking: \(error)")
            })
    }
    
    func setRequacked(isRequacked: Bool)
    {
        requacked = isRequacked
        
        if(requacked)
        {
            requackButton.setImage(UIImage(named: "retweet-icon-green"), for: UIControl.State.normal)
            requackButton.isEnabled = false
        }
        else
        {
            requackButton.setImage(UIImage(named: "retweet-icon"), for: UIControl.State.normal)
            requackButton.isEnabled = true
        }
    }
    

    
    override func awakeFromNib()
    {
        super.awakeFromNib()
        // Initialization code
    }

    override func setSelected(_ selected: Bool, animated: Bool)
    {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }

}
