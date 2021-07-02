//
//  ChannelCollectionViewCell.swift
//  MediaDemo
//
//  Created by Ali Tarek on 7/1/21.
//

import UIKit

enum CourseCellSize
{
    static let height = 315
    static let width = 200
    static let imageHeight = 300
}

enum SeriesCellSize
{
    static let height = 215
    static let width = 340
    static let imageHeight = 200
}

class ChannelCollectionViewCell: UICollectionViewCell, Configurable
{
    // MARK: Outlets
    
    @IBOutlet weak var imageViewCover: UIImageView!
    @IBOutlet weak var labelEpisodeName: UILabel!
    
    @IBOutlet weak var constraintImageHeight: NSLayoutConstraint!

    // MARK: Init
    
    override func awakeFromNib()
    {
        super.awakeFromNib()
    }
    
    // MARK: Methods
    
    func configure(with model: ChannelViewModel)
    {
        imageViewCover.setImage(from: model.imageCoverURL)
        labelEpisodeName.text = model.title
        setImageHeight(to: model.constraintImageHeight)
    }
    
    private func setImageHeight(to value: Int)
    {
        constraintImageHeight.constant = CGFloat(value)
        layoutIfNeeded()
    }
}
