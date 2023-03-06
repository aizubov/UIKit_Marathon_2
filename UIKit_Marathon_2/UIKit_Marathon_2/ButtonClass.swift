//
//  ButtonClass.swift
//  UIKit_Marathon_2
//
//  Created by user228564 on 3/6/23.
//

import UIKit

class CustomButton: UIButton {
    override func touchesBegan(_ touches: Set<UITouch>, with event: UIEvent?) {
        super.touchesBegan(touches, with: event)
        UIView.animate(withDuration: 0.2, delay: 0,
                       usingSpringWithDamping: 1, initialSpringVelocity: 1,
                       options: .allowUserInteraction) {
            self.transform = CGAffineTransform(scaleX: 0.80, y: 0.80)
        }
    }
    
    override func touchesEnded(_ touches: Set<UITouch>, with event: UIEvent?) {
        super.touchesEnded(touches, with: event)
        UIView.animate(withDuration: 0.2, delay: 0,
                       usingSpringWithDamping: 1, initialSpringVelocity: 1,
                       options: .allowUserInteraction) {
            self.transform = CGAffineTransform.identity
        }
    }
}
