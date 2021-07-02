//
//  HomeBuilder.swift
//  MediaDemo
//
//  Created by Ali Tarek on 7/1/21.
//

import Foundation

class HomeBuilder
{
    class func buildModule(arroundView view: HomeViewController)
    {
        let presenter = HomePresenter()
        let interactor = HomeInteractor()
        
        view.interactor = interactor
        interactor.presenter = presenter
        presenter.view = view
    }
}
