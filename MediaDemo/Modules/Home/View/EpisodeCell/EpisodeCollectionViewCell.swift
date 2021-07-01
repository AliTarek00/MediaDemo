//
//  EpisodeCollectionViewCell.swift
//  MediaDemo
//
//  Created by Ali Tarek on 7/1/21.
//

import UIKit

class EpisodeCollectionViewCell: UICollectionViewCell, Configurable
{
    // MARK: Outlets
    
    @IBOutlet weak var imageViewCover: UIImageView!
    @IBOutlet weak var labelChannelName: UILabel!
    @IBOutlet weak var labelEpisodeName: UILabel!
    
    // MARK: Init
    
    override func awakeFromNib()
    {
        super.awakeFromNib()
    }
    
    // MARK: Methods
    
    func configure(with model: EpisodeViewModel)
    {
        imageViewCover.setImage(from: model.imageCoverURL)
        labelChannelName.text = model.channel
        labelEpisodeName.text = model.title
    }
}

