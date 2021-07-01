//
//  HomeEnums.swift
//  MediaDemo
//
//  Created by Ali Tarek on 7/1/21.
//

import Foundation

enum HomeAPIError: Error
{
    case emptyNewEpisodes
    case emptyChannels
    case emptyCategories
}

extension HomeAPIError: LocalizedError
{
    var errorDescription: String?
    {
        switch self
        {
        case .emptyNewEpisodes:
            return NSLocalizedString("Empty New Episodes Results, Try Again!", comment: "")
            
        case .emptyChannels:
            return NSLocalizedString("Empty Channels Results, Try Again!", comment: "")

        case .emptyCategories:
            return NSLocalizedString("Empty Categories Results, Try Again!", comment: "")
        }
    }
}
