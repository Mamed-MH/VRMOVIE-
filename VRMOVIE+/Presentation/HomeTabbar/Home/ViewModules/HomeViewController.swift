//
//  HomeViewController.swift
//  VRMOVIE+
//
//  Created by Mamed Hacıyev on 3.02.2025.
//

import UIKit

class HomeViewController: UIViewController {
    private lazy var backgroundImageView: UIImageView = {
        let imageView = UIImageView()
        imageView.image = UIImage(named: "background")
        imageView.contentMode = .scaleAspectFill
        imageView.alpha = 1.0
        imageView.translatesAutoresizingMaskIntoConstraints = false
        return imageView
    }()
    
    private lazy var collectionView: UICollectionView = {
        let layout = createCompositionalLayout()
        let collectionView = UICollectionView(frame: .zero, collectionViewLayout: layout)
        collectionView.backgroundColor = .clear
        collectionView.register(MovieCell.self, forCellWithReuseIdentifier: "MovieCell")
        collectionView.register(CategoryCell.self, forCellWithReuseIdentifier: "CategoryCell")
        collectionView.register(SectionHeaderView.self,
                              forSupplementaryViewOfKind: UICollectionView.elementKindSectionHeader,
                              withReuseIdentifier: "HeaderView")
        collectionView.delegate = self
        collectionView.dataSource = self
        collectionView.translatesAutoresizingMaskIntoConstraints = false
        return collectionView
    }()
    
    private let viewModel = HomeViewModel()
    private var categoryCollectionViews: [UICollectionView] = []
    private var headerViews: [SectionHeaderView] = []
    

    init(categoryCollectionViews: [UICollectionView], headerViews: [SectionHeaderView]) {
        self.categoryCollectionViews = categoryCollectionViews
        self.headerViews = headerViews
        super.init(nibName: nil, bundle: nil)
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented. Use init(categoryCollectionViews:headerViews:) instead.")
    }

    
    override func viewDidLoad() {
        super.viewDidLoad()
        setupUI()
    }
    
    private func setupUI() {
        view.backgroundColor = .black
        view.addSubview(backgroundImageView)
        view.addSubview(collectionView)
        
        NSLayoutConstraint.activate([
            backgroundImageView.topAnchor.constraint(equalTo: view.topAnchor),
            backgroundImageView.leadingAnchor.constraint(equalTo: view.leadingAnchor),
            backgroundImageView.trailingAnchor.constraint(equalTo: view.trailingAnchor),
            backgroundImageView.bottomAnchor.constraint(equalTo: view.bottomAnchor),
            
            collectionView.topAnchor.constraint(equalTo: view.safeAreaLayoutGuide.topAnchor),
            collectionView.leadingAnchor.constraint(equalTo: view.leadingAnchor),
            collectionView.trailingAnchor.constraint(equalTo: view.trailingAnchor),
            collectionView.bottomAnchor.constraint(equalTo: view.safeAreaLayoutGuide.bottomAnchor)
        ])
        
        view.sendSubviewToBack(backgroundImageView)
    }
    
    private func createCompositionalLayout() -> UICollectionViewCompositionalLayout {
        return UICollectionViewCompositionalLayout { [weak self] sectionIndex, _ in
            return self?.createSection(for: sectionIndex)
        }
    }
    
    private func createSection(for sectionIndex: Int) -> NSCollectionLayoutSection {
        let itemSize = NSCollectionLayoutSize(widthDimension: .fractionalWidth(1),
                                            heightDimension: .fractionalHeight(1))
        let item = NSCollectionLayoutItem(layoutSize: itemSize)
        item.contentInsets = NSDirectionalEdgeInsets(top: 5, leading: 5, bottom: 5, trailing: 5)
        
        let groupSize = NSCollectionLayoutSize(widthDimension: .fractionalWidth(0.45),
                                             heightDimension: .absolute(200))
        let group = NSCollectionLayoutGroup.horizontal(layoutSize: groupSize, subitems: [item])
        
        let section = NSCollectionLayoutSection(group: group)
        section.orthogonalScrollingBehavior = .continuous
        section.contentInsets = NSDirectionalEdgeInsets(top: 10, leading: 10, bottom: 10, trailing: 10)
        
        let headerSize = NSCollectionLayoutSize(widthDimension: .fractionalWidth(1),
                                              heightDimension: .absolute(50))
        let header = NSCollectionLayoutBoundarySupplementaryItem(layoutSize: headerSize,
                                                               elementKind: UICollectionView.elementKindSectionHeader,
                                                               alignment: .top)
        section.boundarySupplementaryItems = [header]
        
        return section
    }
}

extension HomeViewController: UICollectionViewDelegate, UICollectionViewDataSource, UICollectionViewDelegateFlowLayout {
    func numberOfSections(in collectionView: UICollectionView) -> Int {
        if collectionView == self.collectionView {
            return viewModel.sections.count
        }
        return 1
    }
    
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        if collectionView == self.collectionView {
            return 5
        } else {
            let sectionIndex = categoryCollectionViews.firstIndex(of: collectionView) ?? 0
            return viewModel.sections[sectionIndex].categories.count
        }
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        if collectionView == self.collectionView {
            let cell = collectionView.dequeueReusableCell(withReuseIdentifier: "MovieCell", for: indexPath) as! MovieCell
            cell.configure(with: "Movie \(indexPath.item + 1)")
            return cell
        } else {
            let cell = collectionView.dequeueReusableCell(withReuseIdentifier: "CategoryCell", for: indexPath) as! CategoryCell
            let sectionIndex = categoryCollectionViews.firstIndex(of: collectionView) ?? 0
            let section = viewModel.sections[sectionIndex]
            let category = section.categories[indexPath.item]
            let isSelected = viewModel.isSelectedCategory(at: sectionIndex, categoryIndex: indexPath.item)
            cell.configure(with: category, isSelected: isSelected, sectionColor: section.color)
            return cell
        }
    }
    
    func collectionView(_ collectionView: UICollectionView, viewForSupplementaryElementOfKind kind: String, at indexPath: IndexPath) -> UICollectionReusableView {
        if kind == UICollectionView.elementKindSectionHeader {
            let header = collectionView.dequeueReusableSupplementaryView(ofKind: kind,
                                                                        withReuseIdentifier: "HeaderView",
                                                                        for: indexPath) as! SectionHeaderView
            let isActive = viewModel.getSelectedCategory(for: indexPath.section) >= 0
            header.configure(with: viewModel.sections[indexPath.section].title, isActive: isActive)
            
            if categoryCollectionViews.count <= indexPath.section {
                let categoryLayout = UICollectionViewFlowLayout()
                categoryLayout.scrollDirection = .horizontal
                categoryLayout.minimumInteritemSpacing = 10
                
                let categoryCV = UICollectionView(frame: .zero, collectionViewLayout: categoryLayout)
                categoryCV.tag = indexPath.section
                categoryCV.backgroundColor = .clear
                categoryCV.showsHorizontalScrollIndicator = false
                categoryCV.register(CategoryCell.self, forCellWithReuseIdentifier: "CategoryCell")
                categoryCV.delegate = self
                categoryCV.dataSource = self
                categoryCV.translatesAutoresizingMaskIntoConstraints = false
                
                categoryCollectionViews.append(categoryCV)
                header.addSubview(categoryCV)
                
                NSLayoutConstraint.activate([
                    categoryCV.leadingAnchor.constraint(equalTo: header.leadingAnchor, constant: 120),
                    categoryCV.trailingAnchor.constraint(equalTo: header.trailingAnchor),
                    categoryCV.centerYAnchor.constraint(equalTo: header.centerYAnchor),
                    categoryCV.heightAnchor.constraint(equalToConstant: 30)
                ])
            }
            
            headerViews.append(header)
            return header
        }
        return UICollectionReusableView()
    }
    
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, sizeForItemAt indexPath: IndexPath) -> CGSize {
        if collectionView != self.collectionView {
            let sectionIndex = categoryCollectionViews.firstIndex(of: collectionView) ?? 0
            let category = viewModel.sections[sectionIndex].categories[indexPath.item]
            let width = category.size(withAttributes: [.font: UIFont.systemFont(ofSize: 14)]).width + 40
            return CGSize(width: width, height: 30)
        }
        return CGSize(width: 0, height: 0)
    }
    
    func collectionView(_ collectionView: UICollectionView, didSelectItemAt indexPath: IndexPath) {
        if collectionView != self.collectionView {
            let sectionIndex = categoryCollectionViews.firstIndex(of: collectionView) ?? 0
            viewModel.updateSelectedCategory(at: sectionIndex, to: indexPath.item)
            collectionView.reloadData()
            
            if let header = self.collectionView.supplementaryView(forElementKind: UICollectionView.elementKindSectionHeader, at: IndexPath(item: 0, section: sectionIndex)) as? SectionHeaderView {
                header.configure(with: viewModel.sections[sectionIndex].title, isActive: true)
            }
            
            for (index, _) in viewModel.sections.enumerated() where index != sectionIndex {
                if let header = self.collectionView.supplementaryView(forElementKind: UICollectionView.elementKindSectionHeader, at: IndexPath(item: 0, section: index)) as? SectionHeaderView {
                    header.configure(with: viewModel.sections[index].title, isActive: false)
                }
            }
        }
    }
}

