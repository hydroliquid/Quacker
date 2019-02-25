//
//  QuackViewController.swift
//  Twitter
//
//  Created by Js on 2/24/19.
//  Copyright © 2019 Dan. All rights reserved.
//

import UIKit

class QuackViewController: UIViewController
{
    @IBOutlet weak var quackTextView: UITextView!
    
    override func viewDidLoad()
    {
        super.viewDidLoad()
        quackTextView.becomeFirstResponder()
        // Do any additional setup after loading the view.
    }

    @IBAction func cancel(_ sender: Any)
    {
        dismiss(animated: true, completion: nil)
    }
    @IBAction func quack(_ sender: Any)
    {
        if(!quackTextView.text.isEmpty)
        {
            TwitterAPICaller.client?.postQuack(quackString: quackTextView.text,
            success: {
                self.dismiss(animated: true, completion: nil)
            }, failure: {
                (error) in print("Error posting quack \(error)")
                self.dismiss(animated: true, completion: nil)
                
            })
        }else{
            self.dismiss(animated: true, completion: nil)
        }
    }
}
