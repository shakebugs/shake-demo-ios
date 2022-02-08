//
//  CrashReportingVC.swift
//  shake-demo-ios
//
//  Created by Sanjin Grahovar Sadiković on 02.11.2021..
//

import Foundation
import UIKit
import Shake

class CrashReportingVC: UIViewController, UIGestureRecognizerDelegate, UITextViewDelegate{
    
    @IBOutlet weak var tutorialStepCrash: UIView!
    @IBOutlet weak var stepsTextView: UITextView!
    

    override func viewDidLoad() {
        super.viewDidLoad()
                
        let tapGesture = UITapGestureRecognizer(target: self, action: #selector(handleCrash(sender:)))
        tutorialStepCrash.addGestureRecognizer(tapGesture)
        tutorialStepCrash.isUserInteractionEnabled = true
        
        var attributes = [NSAttributedString.Key: Any]()
        attributes[.foregroundColor] = UIColor(named: "shake_url_color")
        attributes[.underlineColor] = UIColor(named: "shake_url_color")
        attributes[.underlineStyle] = NSUnderlineStyle.single.rawValue
        attributes[.strokeWidth] = -2
        
        // textView.linkTextAttributes = attributes
        stepsTextView.linkTextAttributes = attributes
    }
    
    @objc func handleCrash(sender: UITapGestureRecognizer) {
        fatalError()
    }
    
    func textView(_ textView: UITextView, shouldInteractWith URL: URL, in characterRange: NSRange, interaction: UITextItemInteraction) -> Bool {
        print("URL: \(URL.absoluteString)")
        
        if(URL.absoluteString == "www.shk.sh/demo"){
            let baseUrl : String = URL.absoluteString
            let moreUrl : String = ""
            let newUrl = Foundation.URL(string: baseUrl + moreUrl)
            
            UIApplication.shared.open(newUrl!)
        }
        
        return false
    }
}
