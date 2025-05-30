//
//  SeeAllItemsController.swift
//  VRMOVIE+
//
//  Created by Mamed Hacıyev on 22.02.2025.
//

import UIKit

final class SeeAllItemsController: BaseViewController {
    private lazy var loadingView: UIActivityIndicatorView = {
        let view = UIActivityIndicatorView(style: .large)
        view.color = .white
        view.tintColor = .white
        view.hidesWhenStopped = true
        view.backgroundColor = .backgroundMain
        view.translatesAutoresizingMaskIntoConstraints = false
        return view
    }()
    
    private lazy var allMoviesCollectionView: UICollectionView = {
        let layout = UICollectionViewFlowLayout()
        layout.scrollDirection = .vertical
        layout.minimumInteritemSpacing = 4
        layout.minimumLineSpacing = 4
        layout.sectionInset = UIEdgeInsets(top: 0, left: 8, bottom: 4, right: 8)
        let collectionView = UICollectionView(frame: .zero, collectionViewLayout: layout)
        collectionView.register(ImageCollectionViewCell.self, forCellWithReuseIdentifier: "ImageCollectionViewCell")
        collectionView.delegate = self
        collectionView.dataSource = self
        collectionView.backgroundColor = .clear
        collectionView.showsHorizontalScrollIndicator = false
        collectionView.translatesAutoresizingMaskIntoConstraints = false
        return collectionView
    }()
    
    private let viewModel: SeeAllItemsViewModel?
    private var isPageLoaded: Bool = true
    
    deinit {
        viewModel?.requestCallback = nil
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        configureViewModel()
        
        viewModel?.getInitialList()
    }
    
    fileprivate func configureNavigationBar() {
        guard let title = viewModel?.getNavBarTitle() else { return }
        navigationItem.configureNavigationBar(text: title)
        navigationController?.navigationBar.tintColor = .primaryHighlight
    }
    
    init(viewModel: SeeAllItemsViewModel?) {
        self.viewModel = viewModel
        super.init(nibName: nil, bundle: nil)
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    fileprivate func configureViewModel() {
        viewModel?.requestCallback = { [weak self] state in
            guard let self = self else {return}
            DispatchQueue.main.async {
                switch state {
                case .loading:
                    self.loadingView.startAnimating()
                case .loaded:
                    self.loadingView.stopAnimating()
                case .success:
                    self.allMoviesCollectionView.reloadData()
                case .morePageLoading:
                    self.isPageLoaded = false
                case .morePageLoaded:
                    self.isPageLoaded = true
                case .error(message: let message):
                    self.showMessage(title: message)
                }
            }
        }
    }


    override func configureView() {
        configureNavigationBar()
        
        self.view.backgroundColor = .backgroundMain
        view.addSubViews(loadingView, allMoviesCollectionView)
        view.bringSubviewToFront(loadingView)
    }
    
    override func configureConstraint() {
        loadingView.anchor(
            top: view.safeAreaLayoutGuide.topAnchor,
            leading: view.leadingAnchor,
            bottom: view.bottomAnchor,
            trailing: view.trailingAnchor,
            padding: .init(all: 0)
        )
        
        allMoviesCollectionView.anchor(
            top: view.safeAreaLayoutGuide.topAnchor,
            leading: view.leadingAnchor,
            bottom: view.bottomAnchor,
            trailing: view.trailingAnchor,
            padding: .init(all: 0)
        )
    }
        
    override func configureTargets() {
        
    }
}

extension SeeAllItemsController: UICollectionViewDelegate, UICollectionViewDataSource, UICollectionViewDelegateFlowLayout {
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        viewModel?.getAllItems() ?? 0
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        guard let cell = collectionView.dequeueReusableCell(withReuseIdentifier: "ImageCollectionViewCell", for: indexPath) as? ImageCollectionViewCell else {
            return UICollectionViewCell()
        }
        let item = viewModel?.getAllItemsProtocol(index: indexPath.row)
        cell.configureCell(model: item)
        return cell
    }
    
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, sizeForItemAt indexPath: IndexPath) -> CGSize {
        return CGSize(width: (collectionView.bounds.width-28)/4, height: (collectionView.bounds.width-28)/8*3)
    }
    
    func collectionView(
        _ collectionView: UICollectionView,
        didSelectItemAt indexPath: IndexPath) {
            let mediaType = viewModel?.getMediatype()
            switch mediaType {
            case .movie:
                guard let item = viewModel?.getItem(index: indexPath.item) else { return }
                viewModel?.showMovieDetail(mediaType: .movie, id: item)
            case .tvShow:
                guard let item = viewModel?.getItem(index: indexPath.item) else { return }
                viewModel?.showMovieDetail(mediaType: .tvShow, id: item)
            case .none:
                return
            }
        }
    
    func scrollViewDidScroll(_ scrollView: UIScrollView) {
        let position = scrollView.contentOffset.y
        if position > (allMoviesCollectionView.contentSize.height - 150 - scrollView.frame.size.height) && isPageLoaded == true {
            viewModel?.loadMorePage()
        }
    }
}
