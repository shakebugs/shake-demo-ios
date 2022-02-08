//
//  CircleView.swift
//  shake-demo-ios
//
//  Created by Sanjin Grahovar Sadiković on 05.11.2021..
//

import Foundation
import UIKit

class CircleView: UIView{
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        commonInit()
    }

    required init?(coder aDecoder: NSCoder) {
        super.init(coder: aDecoder)
        commonInit()
    }

    func commonInit(){
        print(self.bounds)
        let circleView = UIImageView(frame: self.bounds)
        circleView.clipsToBounds = true
        circleView.backgroundColor = self.backgroundColor
        self.backgroundColor = UIColor(white: 1, alpha: 0)
        
        // print("Background color: \(String(describing: self.backgroundColor))")
                 
        circleView.layer.cornerRadius = circleView.frame.size.width/2
        
        addSubview(circleView)
        bringSubviewToFront(circleView)
    }
}
