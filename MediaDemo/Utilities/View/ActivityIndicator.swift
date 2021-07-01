//
//  ActivityIndicator.swift
//  Almol Admin
//
//  Created by Ali Tarek on 2/23/21.
//  Copyright © 2021 Almol. All rights reserved.
//

import NVActivityIndicatorView

class ActivityIndicator
{
    private static var indicator: NVActivityIndicatorView!
    
    
    static func startLoading()
    {
        DispatchQueue.main.async
        {
            guard let view = UIApplication.shared.windows.filter({$0.isKeyWindow}).first?.rootViewController?.view else {
                print("can not get current view ")
                return
            }
            let x = ( view.frame.size.width / 2.0 ) - ( 50.0 / 2.0 )
            let y = ( view.frame.size.height / 2.0 ) - ( 50.0 / 2.0 )
            let theFrame = CGRect(x: x, y: y, width: CGFloat(50), height: CGFloat(50))
            
            indicator = NVActivityIndicatorView(frame: theFrame, type: .ballRotateChase, color: .white)
            view.addSubview(indicator)
            view.bringSubviewToFront(indicator)
            view.isUserInteractionEnabled = false
            indicator.startAnimating()
        }
    }
    
    static func stopLoading()
    {
        DispatchQueue.main.async
        {
            guard let view = UIApplication.shared.windows.filter({$0.isKeyWindow}).first?.rootViewController?.view else
            {
                print("can not get current view ")
                return
            }
            
            view.isUserInteractionEnabled = true
            indicator.stopAnimating()
            indicator.removeFromSuperview()
        }
    }
}
