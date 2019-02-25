//
//  QuackViewController.swift
//  Twitter
//
//  Created by Js on 2/24/19.
//  Copyright © 2019 Dan. All rights reserved.
//

import UIKit
import RSKPlaceholderTextView

class QuackViewController: UIViewController, UITextViewDelegate
{
    @IBOutlet weak var quackTextView: UITextView!
    @IBOutlet weak var charCountLabel: UILabel!
    
    override func viewDidLoad()
    {
        super.viewDidLoad()
        quackTextView.becomeFirstResponder()
        quackTextView.delegate = self
        
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
    
    func textView(_ textView: UITextView, shouldChangeTextIn range: NSRange, replacementText text: String) -> Bool {
        // TODO: Check the proposed new text character count
        // Allow or disallow the new text
        // Set the max character limit
        let characterLimit = 140
        
        // Construct what the new text would be if we allowed the user's latest edit
        let newText = NSString(string: textView.text!).replacingCharacters(in: range, with: text)
        let currenttextCount = newText.count
        
        // TODO: Update Character Count Label
        charCountLabel.text =
            getCharacterAmount(currenttextCount: currenttextCount, characterLimit: characterLimit)
        
        // The new text should be allowed? True/False
        return newText.count < characterLimit
    }
    
    func getCharacterAmount(currenttextCount: Int, characterLimit: Int) -> String
    {
        var leftOver: Int
        leftOver = characterLimit - currenttextCount
        
        return String(leftOver)
    }
}
