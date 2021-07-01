//
//  UIViewControllerExtension.swift
//  MediaDemo
//
//  Created by Ali Tarek on 7/1/21.
//

import NVActivityIndicatorView

extension UIViewController
{
    static var topViewController: UIViewController?
    {
        if var topController = UIApplication.shared.keyWindow?.rootViewController
        {
            while let presentedViewController = topController.presentedViewController
            {
                topController = presentedViewController
            }
            return topController
        }
        return nil
    }
        
    func setAsAppRoot()
    {
        if let window = UIApplication.shared.keyWindow
        {
            window.rootViewController = self
            window.makeKeyAndVisible()
        }
    }
    
    func openURL(_ url: String)
    {
        guard let userSubscriptionsPanelURL = URL(string: url),
              !userSubscriptionsPanelURL.absoluteString.isEmpty else { return }
        
        UIApplication.shared.open(userSubscriptionsPanelURL, options: [:], completionHandler: nil)
    }
}

