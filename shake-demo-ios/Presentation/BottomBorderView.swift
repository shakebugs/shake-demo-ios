//
//  BottomBorderView.swift
//  shake-demo-ios
//
//  Created by Sanjin Grahovar Sadiković on 05.11.2021..
//

import Foundation
import UIKit
import Shake

class BottomBorderView: UIView{
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        commonInit()
    }

    required init?(coder aDecoder: NSCoder) {
        super.init(coder: aDecoder)
        commonInit()
    }

    func commonInit(){
        let border = CALayer()
        border.backgroundColor = UIColor(named: "shake_border_color")?.cgColor
        border.frame = CGRect(x: 0, y: self.frame.height - 1.0, width: self.frame.width + 10, height: 1.0)
        self.layer.addSublayer(border)
    }
    
    @objc func handleTap(sender: UITapGestureRecognizer) {
        Shake.show(.home)
    }
}
