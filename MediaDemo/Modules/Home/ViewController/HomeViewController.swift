//
//  HomeViewController.swift
//  MediaDemo
//
//  Created by Ali Tarek on 7/1/21.
//

import NVActivityIndicatorView
import JEKScrollableSectionCollectionViewLayout

protocol HomeViewProtocol: class
{
    var interactor: HomeInteractorProtocol? { get set }
    
    func display(message: String)

    // Update UI with value returned.
    func displayNewEpisodes(from dataSource: CollectionViewDataSource<EpisodeViewModel, EpisodeCollectionViewCell>)
    
    func displayChannels(from dataSource: MultiSectionCollectionViewDataSource<ChannelViewModel, ChannelSectionHeaderViewModel, ChannelCollectionViewCell, ChannelSectionHeader>)
    
    func displayCategories(from dataSource: CollectionViewDataSource<CategoryViewModel, CategoryCollectionViewCell>)
    
}

class HomeViewController: UIViewController
{
    // MARK:- Outlets
    
    @IBOutlet weak var newEpisodesCollectionView: UICollectionView!
    @IBOutlet weak var channelsCollectionView: UICollectionView!
    @IBOutlet weak var categoriesCollectionView: UICollectionView!

    @IBOutlet weak var newEpisodesCollectionHeight: NSLayoutConstraint!
    @IBOutlet weak var channelsCollectionHeight: NSLayoutConstraint!
    @IBOutlet weak var categoriesCollectionHeight: NSLayoutConstraint!
    
    // MARK:- Properties
    
    enum collectionViewLayoutProperties
    {
        static let hSpaceBetweenCells: CGFloat = 20.0
        static let vSpaceBetweenCells: CGFloat = 20.0
        static let sectionLeftSpace: CGFloat = 10.0
        static let sectionRightSpace: CGFloat = 10.0
        static let sectionTopSpace: CGFloat = 10.0
        static let sectionBottomSpace: CGFloat = 10.0
    }
    
    var interactor: HomeInteractorProtocol?
    
    // MARK:- View Controller Life Cycle
    
    override func viewDidLoad()
    {
        super.viewDidLoad()
        setup()
    }
    
    // MARK:- Private Methods
    
    private func setup()
    {
        registerCells()
        registerHeaders()
        
        setupNewEpisodesCollectionView()
        setupChannelsCollectionView()
        setupCategoriesCollectionView()
        
        fetchHomeData()
    }
    
    private func registerCells()
    {
        newEpisodesCollectionView.register(cell: EpisodeCollectionViewCell.self)
        channelsCollectionView.register(cell: ChannelCollectionViewCell.self)
        categoriesCollectionView.register(cell: CategoryCollectionViewCell.self)
    }
    
    private func registerHeaders()
    {
        channelsCollectionView.registerHeader(header: ChannelSectionHeader.self)
    }
    
    private func setupNewEpisodesCollectionView()
    {
        setNewEpisodesCollectionViewHeight()
        newEpisodesCollectionView.delegate = self
        newEpisodesCollectionHeight.constant = 0.0
    }
    
    private func setupChannelsCollectionView()
    {
        setupChannelsCollectionLayout()
        channelsCollectionView.delegate = self
        channelsCollectionHeight.constant = 0.0
    }
    
    private func setupCategoriesCollectionView()
    {
        categoriesCollectionView.delegate = self
        categoriesCollectionHeight.constant = 0.0
    }
    
    private func setupNewEpisodesCollectionLayout()
    {
        let layout = JEKScrollableSectionCollectionViewLayout()
        newEpisodesCollectionView.collectionViewLayout = layout
    }
    
    private func setupChannelsCollectionLayout()
    {
        let layout = JEKScrollableSectionCollectionViewLayout()
        layout.headerReferenceSize = CGSize(width: 0, height: 85)
        channelsCollectionView.collectionViewLayout = layout
    }
        
    private func setNewEpisodesCollectionViewHeight()
    {
        let contentHeight = newEpisodesCollectionView.collectionViewLayout.collectionViewContentSize.height
        newEpisodesCollectionHeight.constant = contentHeight
    }

    private func setChannelsCollectionViewHeight()
    {
        let contentHeight = channelsCollectionView.collectionViewLayout.collectionViewContentSize.height
        channelsCollectionHeight.constant = contentHeight
    }
    
    private func setCategoriesCollectionViewHeight()
    {
        let contentHeight = categoriesCollectionView.collectionViewLayout.collectionViewContentSize.height
        categoriesCollectionHeight.constant = contentHeight
    }
    
    private func fetchHomeData()
    {
        interactor?.fetchNewEpisodes()
        interactor?.fetchChannels()
        interactor?.fetchCategories()
    }
    
    // MARK:- Public Methods
    
    func refreshNewEpisodesCollectionView()
    {
        newEpisodesCollectionView.reloadData()
        newEpisodesCollectionView.layoutIfNeeded()
        setNewEpisodesCollectionViewHeight()
    }
        
    func refreshChannelsCollectionView()
    {
        channelsCollectionView.reloadData()
        channelsCollectionView.layoutIfNeeded()
        setChannelsCollectionViewHeight()
    }
    
    func refreshCategoriesCollectionView()
    {
        categoriesCollectionView.reloadData()
        categoriesCollectionView.layoutIfNeeded()
        setCategoriesCollectionViewHeight()
    }
}
