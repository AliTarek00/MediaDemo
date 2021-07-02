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
    private static let topViewController = UIViewController.topViewController
    
    public static func startLoading()
    {
        DispatchQueue.main.async
        {
            self.topViewController?.showLoader()
        }
    }
    
    public static func stopLoading()
    {
        DispatchQueue.main.async
        {
            self.topViewController?.hideLoader()
        }
    }
}
