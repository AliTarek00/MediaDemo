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
    func setImage(from imageURL: String?, placeholder: UIImage? = nil)
    {
        guard let imageURL = imageURL,
              let encodedURL = imageURL.addingPercentEncoding(withAllowedCharacters: .urlQueryAllowed),
              let url = URL(string: encodedURL) else { return }
        kf.setImage(with: url, placeholder: placeholder)
    }
}
