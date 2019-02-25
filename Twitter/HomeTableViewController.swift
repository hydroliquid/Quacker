//
//  HomeTableViewController.swift
//  Quacker
//
//  Created by MICHAEL BENTON on 2/21/19.
//  Copyright © 2019 Dan. All rights reserved.
//

import UIKit

class HomeTableViewController: UITableViewController
{

    var quackArray = [NSDictionary]()
    var numberOfQuacks: Int!
    
    let myRefreshControl = UIRefreshControl()
    
    override func viewDidLoad()
    {
        super.viewDidLoad()
        loadQuacks()
        
        myRefreshControl.addTarget(self, action: #selector(loadQuacks), for: .valueChanged)
        tableView.refreshControl = myRefreshControl
    }
    
    override func viewDidAppear(_ animated: Bool) {
        super.viewDidAppear(animated)
        self.loadQuacks()
    }
    
    @objc func loadQuacks()
    {
        numberOfQuacks = 20
        let myUrl = "https://api.twitter.com/1.1/statuses/home_timeline.json"
        let myParams = ["count": numberOfQuacks]
        
        TwitterAPICaller.client?.getDictionariesRequest(url: myUrl, parameters: myParams,
            success: { (quacks: [NSDictionary]) in
                
                self.quackArray.removeAll()
                for quack in quacks {
                    self.quackArray.append(quack)
                }
                self.tableView.reloadData()
                self.myRefreshControl.endRefreshing()
                
        }, failure: { (Error) in
            print("Could not retreive quack")
        })
    }
    
    func loadMoreQuacks()
    {
        let myUrl = "https://api.twitter.com/1.1/statuses/home_timeline.json"
        numberOfQuacks = numberOfQuacks+20
        let myParams = ["count": numberOfQuacks]
        
        TwitterAPICaller.client?.getDictionariesRequest(url: myUrl, parameters: myParams,
            success: { (quacks: [NSDictionary]) in
                 self.quackArray.removeAll()
                 for quack in quacks {
                       self.quackArray.append(quack)
                 }
                 self.tableView.reloadData()
                 self.myRefreshControl.endRefreshing()
                                                            
        }, failure: { (Error) in
            print("Could not retreive quack")
        })
        
    }
    
    override func tableView(_ tableView: UITableView, willDisplay cell: UITableViewCell, forRowAt indexPath: IndexPath) {
        if indexPath.row + 1 == quackArray.count {
            loadMoreQuacks()
        }
    }
    

    @IBAction func onLogout(_ sender: Any)
    {
        TwitterAPICaller.client?.logout()
        self.dismiss(animated: true, completion: nil)
        UserDefaults.standard.set(false, forKey: "userLoggedIn")
    }
    
    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "quackCell", for: indexPath) as! QuackCellTableViewCell
        
        let user = quackArray[indexPath.row]["user"] as! NSDictionary
        
        cell.userName.text = user["name"] as? String
        cell.quackTextContent.text = quackArray[indexPath.row]["text"] as? String
        
        let imageUrl = URL(string: (user["profile_image_url_https"] as? String)!)
        let data = try? Data(contentsOf: imageUrl!)
        
        if let imageData = data {
            cell.userImageView.image = UIImage(data: imageData)
        }
        
        cell.setFavorite(isFavorited: quackArray[indexPath.row]["favorited"] as! Bool)
        cell.quackId = quackArray[indexPath.row]["id"] as! Int
        cell.setRequacked(isRequacked: quackArray[indexPath.row]["retweeted"] as! Bool)
        
        return cell
    }
    
    
    // MARK: - Table view data source

    override func numberOfSections(in tableView: UITableView) -> Int
    {
        // #warning Incomplete implementation, return the number of sections
        
        
        return 1
    }

    override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int
    {
        // #warning Incomplete implementation, return the number of rows
        return quackArray.count
    }

}
