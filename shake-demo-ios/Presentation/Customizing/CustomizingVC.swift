//
//  CustomizingVC.swift
//  shake-demo-ios
//
//  Created by Sanjin Grahovar Sadiković on 02.11.2021..
//

import Foundation
import UIKit

class CustomizingVC: UIViewController, UITextViewDelegate{
    
    @IBOutlet weak var circularView: UIView!
    @IBOutlet weak var urlTextView: UITextView!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        urlTextView.delegate = self
        
        var attributes = [NSAttributedString.Key: Any]()
        attributes[.foregroundColor] = UIColor(named: "shake_url_color")
        attributes[.underlineColor] = UIColor(named: "shake_url_color")
        attributes[.underlineStyle] = NSUnderlineStyle.single.rawValue
        attributes[.strokeWidth] = -2
        
        urlTextView.linkTextAttributes = attributes
    }
    
    func textView(_ textView: UITextView, shouldInteractWith URL: URL, in characterRange: NSRange, interaction: UITextItemInteraction) -> Bool {
        print("URL: \(URL.absoluteString)")
        
        if(URL.absoluteString == "http://www.shakebugs.com/docs"){
            let baseUrl : String = URL.absoluteString
            let moreUrl : String = ""
            let newUrl = Foundation.URL(string: baseUrl + moreUrl)
            
            UIApplication.shared.open(newUrl!)
        }
        
        return false
    }
}
