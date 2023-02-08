//
//  CategoryTableViewCell.swift
//  KinoApp
//
//  Created by Seidaly Rustem on 29.01.2023.
//

import UIKit

final class CategoryTableViewCell: UITableViewCell {

    var movieList: [MovieModel] = []
    
    var movieListAll: [[MovieModel]] = []


    private lazy var movieCollectionView: UICollectionView = {
        let layout = UICollectionViewFlowLayout()
        layout.scrollDirection = .horizontal
        let collectionView = UICollectionView(frame: .zero, collectionViewLayout: layout)
        collectionView.register(MovieCollectionViewCell.self, forCellWithReuseIdentifier: itemForProject.Identifiers.movieCollectionViewCell)
        collectionView.showsVerticalScrollIndicator = false
        return collectionView
    }()
    
    
    override init(style: UITableViewCell.CellStyle, reuseIdentifier: String?) {
        super.init(style: style, reuseIdentifier: reuseIdentifier)
        
        movieCollectionView.delegate = self
        movieCollectionView.dataSource = self
            
        setupViews()
        setupConstraints()
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    func configure(with movieList: [MovieModel]) {
        self.movieList = movieList
        DispatchQueue.main.async {
            self.movieCollectionView.reloadData()
        }
    }
}

//MARK: -  CollectionViewDataSorce methods

extension CategoryTableViewCell: UICollectionViewDataSource {
    
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return movieList.count
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        let cell = collectionView.dequeueReusableCell(withReuseIdentifier: itemForProject.Identifiers.movieCollectionViewCell, for: indexPath) as! MovieCollectionViewCell
        cell.clipsToBounds = true
        cell.configure(with: movieList[indexPath.row])
        return cell
    }
}

//MARK: - CollectionViewDelegate methods

extension CategoryTableViewCell: UICollectionViewDelegateFlowLayout {
    
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, sizeForItemAt indexPath: IndexPath) -> CGSize {
        let height = collectionView.frame.size.height
        return CGSize(width: height/2, height: height)
    }
}

//MARK: - Setup views and constraints

private extension CategoryTableViewCell {
    
    func setupViews() {
        contentView.addSubview(movieCollectionView)
    }
    
    func setupConstraints() {
        movieCollectionView.snp.makeConstraints { make in
            make.edges.equalToSuperview()
        }
    }
}






