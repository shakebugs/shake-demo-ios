//
//  FeedbackVC.swift
//  shake-demo-ios
//
//  Created by Sanjin Grahovar Sadiković on 02.11.2021..
//

import Foundation
import UIKit
import Shake

class FeedbackVC: UIViewController, UIGestureRecognizerDelegate{
    
    @IBOutlet weak var feedbackItem: UIView!
    @IBOutlet weak var feedbackCenter: UILabel!
    
    override func viewDidLoad() {
        super.viewDidLoad()
     
        let tapGesture = UITapGestureRecognizer(target: self.feedbackItem, action: #selector(handleTap(sender:)))
        
        tapGesture.delegate = self
        tapGesture.numberOfTapsRequired = 1
        tapGesture.numberOfTouchesRequired = 1
        
        feedbackItem.addGestureRecognizer(tapGesture)
        feedbackItem.isUserInteractionEnabled = true
    }
    
    @objc func handleTap(sender: UITapGestureRecognizer) {
        print("tap")
    }
    
    @objc func feedbackTapped(gesture: UIGestureRecognizer) {
        print("TAP")
        Shake.show(.home)
    }

}
