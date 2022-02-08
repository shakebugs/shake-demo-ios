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
    @IBOutlet weak var blackboxOutlet: UISwitch!
    @IBOutlet weak var thresholdSlider: UISlider!
    
    let defaults = UserDefaults.standard


    @IBAction func sliderValueChanged(_ sender: UISlider) {
        let currentValue = Int(thresholdSlider.value)

        defaults.set(currentValue, forKey: "shakingThreshold")
        Shake.configuration.shakingThreshold = defaults.float(forKey: "shakingThreshold")

        print("Threshold current value: \(currentValue)")

    }
    
    @IBAction func shakingAction(_ sender: Any) {
        if(shakingOutlet.isOn){
            Shake.configuration.isInvokedByShakeDeviceEvent = true
            defaults.set(true, forKey: "isInvokedByShakeDeviceEvent")
        }
        else {
            Shake.configuration.isInvokedByShakeDeviceEvent = false
            defaults.set(false, forKey: "isInvokedByShakeDeviceEvent")
        }
    }
    
    @IBAction func screenshotAction(_ sender: Any) {
        if(screenshotOutlet.isOn){
            Shake.configuration.isInvokedByScreenshot = true
            defaults.set(true, forKey: "isInvokedByScreenshot")
        }
        else {
            Shake.configuration.isInvokedByScreenshot = false
            defaults.set(false, forKey: "isInvokedByScreenshot")
        }
    }
    
    @IBAction func floatingAction(_ sender: Any) {
        if(floatingOutlet.isOn){
            Shake.configuration.isFloatingReportButtonShown = true
            defaults.set(true, forKey: "isFloatingReportButtonShown")
        }
        else {
            Shake.configuration.isFloatingReportButtonShown = false
            defaults.set(false, forKey: "isFloatingReportButtonShown")
        }
    }
    
    
    
    @IBAction func feedbackTypeAction(_ sender: Any) {
        if(feedbackTypeOutlet.isOn){
            Shake.configuration.isFeedbackTypeEnabled = true
            defaults.set(true, forKey: "isFeedbackTypeEnabled")
        }
        else {
            Shake.configuration.isFeedbackTypeEnabled = false
            defaults.set(false, forKey: "isFeedbackTypeEnabled")
        }
    }
    
    @IBAction func emailAction(_ sender: Any) {
        if(emailOutlet.isOn){
            Shake.configuration.isEmailFieldEnabled = true
            defaults.set(true, forKey: "isEmailFieldEnabled")
        }
        else {
            Shake.configuration.isEmailFieldEnabled = false
            defaults.set(false, forKey: "isEmailFieldEnabled")
        }
    }
    
    @IBAction func inspectAction(_ sender: Any) {
        if(inspectOutlet.isOn){
            Shake.configuration.isInspectScreenEnabled = true
            defaults.set(true, forKey: "isInspectScreenEnabled")
        }
        else {
            Shake.configuration.isInspectScreenEnabled = false
            defaults.set(false, forKey: "isInspectScreenEnabled")
        }
    }
    
    @IBAction func attachScreenshotAction(_ sender: Any) {
        if(attachScreenshotOutlet.isOn){
            Shake.configuration.isScreenshotIncluded = true
            defaults.set(true, forKey: "isScreenshotIncluded")
        }
        else {
            Shake.configuration.isScreenshotIncluded = false
            defaults.set(false, forKey: "isScreenshotIncluded")
        }
    }
    
 
    @IBAction func blackboxAction(_ sender: Any) {
        if(blackboxOutlet.isOn){
            Shake.configuration.isBlackBoxEnabled = true
            defaults.set(true, forKey: "isBlackBoxEnabled")
        }
        else {
            Shake.configuration.isBlackBoxEnabled = false
            defaults.set(false, forKey: "isBlackBoxEnabled")
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
            print("Button shown")
        }
        else{
            floatingOutlet.isOn = false
            print("Button not shown")
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
        
        if(Shake.configuration.isBlackBoxEnabled == true){
            blackboxOutlet.isOn = true
        }
        else{
            blackboxOutlet.isOn = false
        }
        
        textView.delegate = self
        
        var attributes = [NSAttributedString.Key: Any]()
        attributes[.foregroundColor] = UIColor(named: "shake_url_color")
        attributes[.underlineColor] = UIColor(named: "shake_url_color")
        attributes[.underlineStyle] = NSUnderlineStyle.single.rawValue
        attributes[.strokeWidth] = -2

        textView.linkTextAttributes = attributes
        
        if defaults.object(forKey: "shakingThreshold") != nil{
            thresholdSlider.value = defaults.float(forKey: "shakingThreshold")
            Shake.configuration.shakingThreshold = defaults.float(forKey: "shakingThreshold")
        }
        
        
        
    }
    
    func textView(_ textView: UITextView, shouldInteractWith URL: URL, in characterRange: NSRange, interaction: UITextItemInteraction) -> Bool {
        print("URL: \(URL.absoluteString)")
        
        return true
    }
}
