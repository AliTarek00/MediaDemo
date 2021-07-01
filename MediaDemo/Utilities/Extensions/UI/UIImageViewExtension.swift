//
//  UIImageViewExtension.swift
//  Almol Admin
//
//  Created by Ali Tarek on 11/27/20.
//  Copyright © 2020 Almol. All rights reserved.
//

import Kingfisher

extension UIImageView
{
    convenience init(assetName: String, scale: UIView.ContentMode = .scaleAspectFit)
    {
        self.init(image: UIImage(named: assetName))
        contentMode = scale
    }
    
    func setImage(from imageURL: String?)
    {
        guard let imageURL = imageURL,
              let encodedURL = imageURL.addingPercentEncoding(withAllowedCharacters: .urlQueryAllowed),
              let url = URL(string: encodedURL) else { return }
        kf.setImage(with: url)
    }
}
