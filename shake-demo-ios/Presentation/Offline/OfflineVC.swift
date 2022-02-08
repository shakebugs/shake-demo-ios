//
//  OfflineVC.swift
//  shake-demo-ios
//
//  Created by Sanjin Grahovar Sadiković on 30.12.2021..
//

import Foundation
import UIKit
import Shake

class OfflineVC: UIViewController, UIGestureRecognizerDelegate, UITextViewDelegate{
    @IBOutlet weak var linkTextView: UITextView!
    
//    @IBOutlet weak var linkTextView: UITextView!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        linkTextView.delegate = self
                
        var attributes = [NSAttributedString.Key: Any]()
        attributes[.foregroundColor] = UIColor(named: "shake_url_color")
        attributes[.underlineColor] = UIColor(named: "shake_url_color")
        attributes[.underlineStyle] = NSUnderlineStyle.single.rawValue
        attributes[.strokeWidth] = -2
        
        linkTextView.linkTextAttributes = attributes
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
