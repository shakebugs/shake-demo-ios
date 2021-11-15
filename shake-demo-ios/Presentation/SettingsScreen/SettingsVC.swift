//
//  SettingsVC.swift
//  shake-demo-ios
//
//  Created by Sanjin Grahovar Sadiković on 02.11.2021..
//

import Foundation
import UIKit
import Shake

class SettingsVC: UIViewController, UITextViewDelegate{
    
    @IBOutlet weak var shakingOutlet: UISwitch!
    @IBOutlet weak var screenshotOutlet: UISwitch!
    @IBOutlet weak var floatingOutlet: UISwitch!
    
    @IBOutlet weak var feedbackTypeOutlet: UISwitch!
    @IBOutlet weak var emailOutlet: UISwitch!
    @IBOutlet weak var inspectOutlet: UISwitch!
    @IBOutlet weak var textView: UITextView!
    
    @IBOutlet weak var attachScreenshotOutlet: UISwitch!
    
    
    @IBAction func shakingAction(_ sender: Any) {
        if(shakingOutlet.isOn){
            Shake.configuration.isInvokedByShakeDeviceEvent = true
        }
        else {
            Shake.configuration.isInvokedByShakeDeviceEvent = false
        }
    }
    
    @IBAction func screenshotAction(_ sender: Any) {
        if(screenshotOutlet.isOn){
            Shake.configuration.isInvokedByScreenshot = true
        }
        else {
            Shake.configuration.isInvokedByScreenshot = false
        }
    }
    
    @IBAction func floatingAction(_ sender: Any) {
        if(floatingOutlet.isOn){
            Shake.configuration.isFloatingReportButtonShown = true
        }
        else {
            Shake.configuration.isFloatingReportButtonShown = false
        }
    }
    
    
    
    @IBAction func feedbackTypeAction(_ sender: Any) {
        if(feedbackTypeOutlet.isOn){
            Shake.configuration.isFeedbackTypeEnabled = true
        }
        else {
            Shake.configuration.isFeedbackTypeEnabled = false
        }
    }
    
    @IBAction func emailAction(_ sender: Any) {
        if(emailOutlet.isOn){
            Shake.configuration.isEmailFieldEnabled = true
        }
        else {
            Shake.configuration.isEmailFieldEnabled = false
        }
    }
    
    @IBAction func inspectAction(_ sender: Any) {
        if(inspectOutlet.isOn){
            Shake.configuration.isInspectScreenEnabled = true
        }
        else {
            Shake.configuration.isInspectScreenEnabled = false
        }
    }
    
    @IBAction func attachScreenshotAction(_ sender: Any) {
        if(attachScreenshotOutlet.isOn){
            Shake.configuration.isScreenshotIncluded = true
        }
        else {
            Shake.configuration.isScreenshotIncluded = false
        }
    }
 
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        
        
        if(Shake.configuration.isInvokedByShakeDeviceEvent == true){
            shakingOutlet.isOn = true
        }
        else{
            shakingOutlet.isOn = false
        }
        
        if(Shake.configuration.isInvokedByScreenshot == true){
            screenshotOutlet.isOn = true
        }
        else{
            screenshotOutlet.isOn = false
        }
        
        if(Shake.configuration.isFloatingReportButtonShown == true){
            floatingOutlet.isOn = true
        }
        else{
            floatingOutlet.isOn = false
        }
        
        if(Shake.configuration.isFeedbackTypeEnabled == true){
            feedbackTypeOutlet.isOn = true
        }
        else{
            feedbackTypeOutlet.isOn = false
        }
        
        if(Shake.configuration.isEmailFieldEnabled == true){
            emailOutlet.isOn = true
        }
        else{
            emailOutlet.isOn = false
        }
        
        if(Shake.configuration.isInspectScreenEnabled == true){
            inspectOutlet.isOn = true
        }
        else{
            inspectOutlet.isOn = false
        }
        
        if(Shake.configuration.isScreenshotIncluded == true){
            attachScreenshotOutlet.isOn = true
        }
        else{
            attachScreenshotOutlet.isOn = false
        }
        
        textView.delegate = self
        
        var attributes = [NSAttributedString.Key: Any]()
        attributes[.foregroundColor] = UIColor(named: "shake_url_color")
        attributes[.underlineColor] = UIColor(named: "shake_url_color")
        attributes[.underlineStyle] = NSUnderlineStyle.single.rawValue
        attributes[.strokeWidth] = -2

        textView.linkTextAttributes = attributes
        
    }
    
    func textView(_ textView: UITextView, shouldInteractWith URL: URL, in characterRange: NSRange, interaction: UITextItemInteraction) -> Bool {
        print("URL: \(URL.absoluteString)")
        
        return true
    }
}
