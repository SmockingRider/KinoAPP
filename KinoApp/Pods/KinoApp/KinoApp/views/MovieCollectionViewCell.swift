//
//  MovieCollectionViewCell.swift
//  KinoApp
//
//  Created by Seidaly Rustem on 04.02.2023.
//

import UIKit

final class MovieCollectionViewCell: UICollectionViewCell {
    
    var apiCaller = APICaller()
    var movieList: [MovieModel] = []
    var allMovieList: [[MovieModel]] = []

    
    private let wholeView = UIView()
    
    private lazy var posterImageView: UIImageView = {
       let imageView = UIImageView()
        imageView.image = UIImage(named: "knives")
        imageView.contentMode = .scaleToFill
        imageView.clipsToBounds = true
        imageView.layer.cornerRadius = 5
        return imageView
    }()
    
    private lazy var movieNameLabel: UILabel = {
        let label = UILabel()
        label.numberOfLines = 2
        label.lineBreakMode = .byWordWrapping
        label.font = UIFont.boldSystemFont(ofSize: label.font.pointSize)
        label.sizeToFit()
        label.textColor = .label
        label.text = "Knives Out 2: Glass Onion"
        return label
    }()
    
    private lazy var genresLabel: UILabel = {
        let label = UILabel()
        label.text = "Comedy, Thriller, History"
        label.font = UIFont.systemFont(ofSize: 15)
        label.sizeToFit()
        label.textColor = .systemGray2
        label.numberOfLines = 2
        label.lineBreakMode = .byWordWrapping
        return label
    }()
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        
        setupViews()
        setupConstraints()
        
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    func configure(with movie: MovieModel) {
        guard let url = URL(string: "\(itemForProject.Links.imageUrl)\(movie.posterPath)") else { fatalError("Incorrect link in the configure!") }
        DispatchQueue.main.async {
            self.posterImageView.kf.setImage(with: url)
            self.movieNameLabel.text = movie.title
        }
    }
}

//MARK: - Setup view and Constraints methods


private extension MovieCollectionViewCell {
    
    func setupViews() {
   
        contentView.addSubview(wholeView)
        wholeView.addSubview(posterImageView)
        wholeView.addSubview(movieNameLabel)
        wholeView.addSubview(genresLabel)
    }
    
    func setupConstraints(){
        wholeView.snp.makeConstraints { make in
            make.edges.equalToSuperview().inset(5)
        }
        
        posterImageView.snp.makeConstraints { make in
            make.top.leading.trailing.equalToSuperview()
            make.height.equalToSuperview().multipliedBy(0.7)
        }
        movieNameLabel.snp.makeConstraints { make in
            make.top.equalTo(posterImageView.snp.bottom)
            make.leading.trailing.equalToSuperview()
            make.height.equalToSuperview().multipliedBy(0.15)
        }
        genresLabel.snp.makeConstraints { make in
            make.top.equalTo(movieNameLabel.snp.bottom)
            make.leading.trailing.bottom.equalToSuperview()
        }
    }
}
