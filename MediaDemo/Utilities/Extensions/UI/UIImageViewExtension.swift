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
    func setImage(from imageURL: String?)
    {
        guard let imageURL = imageURL,
              let url = URL(string: imageURL) else { return }
        kf.setImage(with: url)
    }
}
