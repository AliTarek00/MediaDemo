//
//  UIViewExtension.swift
//  Almol Admin
//
//  Created by Ali Tarek on 10/10/20.
//  Copyright © 2020 Almol. All rights reserved.
//

import UIKit

extension UIView
{
    static var identifier: String
    {
        return "\(self)"
    }
    
    func setView(hidden: Bool)
    {
        UIView.transition(with: self, duration: 0.5, options: .transitionCrossDissolve, animations: {
            self.isHidden = hidden
        })
    }
}
