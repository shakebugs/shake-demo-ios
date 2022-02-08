//
//  ShakingVC.swift
//  shake-demo-ios
//
//  Created by Sanjin Grahovar Sadiković on 02.11.2021..
//

import Foundation
import UIKit

class ShakingVC: UIViewController, UITextViewDelegate{
    
    @IBOutlet weak var textView: UITextView!
    @IBOutlet weak var stepsTextView: UITextView!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        textView.delegate = self
        stepsTextView.delegate = self
                
        var attributes = [NSAttributedString.Key: Any]()
        attributes[.foregroundColor] = UIColor(named: "shake_url_color")
        attributes[.underlineColor] = UIColor(named: "shake_url_color")
        attributes[.underlineStyle] = NSUnderlineStyle.single.rawValue
        attributes[.strokeWidth] = -2
        
        textView.linkTextAttributes = attributes
        stepsTextView.linkTextAttributes = attributes
            
        print("ShakingVC did load")
    }
    
    func textView(_ textView: UITextView, shouldInteractWith URL: URL, in characterRange: NSRange, interaction: UITextItemInteraction) -> Bool {
        print("URL: \(URL.absoluteString)")
        
        if(URL.absoluteString == "http://www.shakebugs.com"){
            let baseUrl : String = URL.absoluteString
            let moreUrl : String = "/?utm_source=ios_demo_app"
            let newUrl = Foundation.URL(string: baseUrl + moreUrl)
            
            UIApplication.shared.open(newUrl!)
        }
        
        else if(URL.absoluteString == "http://www.shk.sh/demo"){
            UIApplication.shared.open(URL)
        }
        
        return false
    }
}

