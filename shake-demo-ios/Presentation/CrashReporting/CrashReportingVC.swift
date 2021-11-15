//
//  CrashReportingVC.swift
//  shake-demo-ios
//
//  Created by Sanjin Grahovar Sadiković on 02.11.2021..
//

import Foundation
import UIKit
import Shake

class CrashReportingVC: UIViewController, UIGestureRecognizerDelegate{
    
    @IBOutlet weak var tutorialStepCrash: UIView!

    override func viewDidLoad() {
        super.viewDidLoad()
                
        let tapGesture = UITapGestureRecognizer(target: self, action: #selector(handleCrash(sender:)))
        tutorialStepCrash.addGestureRecognizer(tapGesture)
        tutorialStepCrash.isUserInteractionEnabled = true
    }
    
    @objc func handleCrash(sender: UITapGestureRecognizer) {
        fatalError()
    }
}
