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
    @IBOutlet weak var favButton: UIButton!
    @IBOutlet weak var requackButton: UIButton!
    
    var favorited: Bool = false
    var quackId: Int = -1
    
    
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
    
    @IBAction func reQuack(_ sender: Any)
    {
        
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
