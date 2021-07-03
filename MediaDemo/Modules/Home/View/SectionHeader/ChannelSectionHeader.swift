//
//  ChannelSectionHeader.swift
//  MediaDemo
//
//  Created by Ali Tarek on 7/1/21.
//

import UIKit

class ChannelSectionHeader: UICollectionReusableView, Configurable
{
    // MARK:- Outlets
    
    @IBOutlet weak var imageViewIcon: UIImageView!
    @IBOutlet weak var labelTitle: UILabel!
    @IBOutlet weak var labelSubTitle: UILabel!
    
    // MARK:- Class Methods
    
    override func awakeFromNib()
    {
        super.awakeFromNib()
        
        labelTitle.adjustsFontSizeToFitWidth = true
        labelTitle.minimumScaleFactor = 0.5
    }
    
    // MARK:- Methods
    
    func configure(with model: ChannelSectionHeaderViewModel)
    {
        if model.imageIconURL != ""
        {
            
            imageViewIcon.setImage(from: model.imageIconURL, placeholder: #imageLiteral(resourceName: "booster"))
        }
        else
        {
            imageViewIcon.image = #imageLiteral(resourceName: "booster")
        }
        labelTitle.text = model.title
        labelSubTitle.text = model.subTitle
    }
}
