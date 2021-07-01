//
//  HomeViewController.swift
//  MediaDemo
//
//  Created by Ali Tarek on 7/1/21.
//

import UIKit

protocol HomeViewProtocol: class
{
    var interactor: HomeInteractorProtocol? { get set }
    
    func display(message: String)

    // Update UI with value returned.
    func displayNewEpisodes(from dataSource: CollectionViewDataSource<EpisodeViewModel, EpisodeCollectionViewCell>)
    
    func displayEpisodes(from dataSource: MultiSectionCollectionViewDataSource<ChannelViewModel, ChannelSectionHeaderViewModel, ChannelCollectionViewCell, ChannelSectionHeader>)
    
    func displayCategories(from dataSource: CollectionViewDataSource<CategoryViewModel, CategoryCollectionViewCell>)
    
}

class HomeViewController: UIViewController
{

    override func viewDidLoad()
    {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
    }
    

    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        // Get the new view controller using segue.destination.
        // Pass the selected object to the new view controller.
    }
    */

}
