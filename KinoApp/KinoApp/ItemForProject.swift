//
//  ItemForProject.swift
//  KinoApp
//
//  Created by Seidaly Rustem on 29.01.2023.
//

import Foundation
import UIKit


struct itemForProject {
    
    struct Keys {
        static let token = "8256e00a40719ca61292b5b333cb66c6"
    }
    
    struct Identifiers {
        static let categoryCollectionViewCell = "CategoryCollectionViewCell"
        static let trendingCollectionViewCell = "TrendingCollectionViewCell"
        static let categoryTableViewCell = "CategoryTableViewCell"
        static let movieCollectionViewCell = "MovieCollectionViewCell"
    }
    struct Values {
        static let urlList = [URLs.trendingUrl, URLs.nowPlaing, URLs.topRated, URLs.popular, URLs.upcoming]
    }
    struct Colors {
        
    }
    
    
    struct Links {
        static let apiMainUrl = "https://api.themoviedb.org/3/"
        static let imageUrl = "https://image.tmdb.org/t/p/w500/"  //add + poster path
    }

    struct URLs {
        static let trendingUrl = "\(Links.apiMainUrl)trending/movie/day?api_key=\(Keys.token)"
        static let nowPlaing = "\(Links.apiMainUrl)movie/now_playing?api_key=\(Keys.token)"
        static let topRated = "\(Links.apiMainUrl)movie/top_rated?api_key=\(Keys.token)"
        static let upcoming = "\(Links.apiMainUrl)movie/upcoming?api_key=\(Keys.token)&page=5"
        static let popular = "\(Links.apiMainUrl)movie/popular?api_key=\(Keys.token)&page=5"
        static let cinemaListApi = "https://kino.kz/_next/data/y-lBqskKB_O4Qcg15-qDk/cinemas.json"
    }
}



    enum Category: String, CaseIterable {
        case nowPlaing = "🔥All"
        case topRated = "🎞️Streaming"
        case upcoming = "📺OnTV"
        case popular = "🍿In Theaters"
    }

class Cinema {
    let name: String
    let image: UIImage?
    let address: String
    
    init(name: String, image: UIImage?, address: String) {
        self.name = name
        self.image = image
        self.address = address
    }
}

class Cinemas: UITableViewCell {
    
    var cinemas: Cinema! {
        didSet {
            self.updateUI()
        }
    }
    
    let name = UILabel()
    let image = UIImageView()
    let address = UILabel()
    
    
    override init(style: UITableViewCell.CellStyle, reuseIdentifier: String?) {
        super.init(style: style, reuseIdentifier: reuseIdentifier)
        self.contentView.addSubview(image)
        image.snp.makeConstraints { make in
            make.width.equalTo(100)
            make.height.equalTo(100)
            make.left.equalTo(15)
            make.top.equalTo(10)
            make.bottom.equalTo(-5)
        }
        image.contentMode = .scaleAspectFit
        self.contentView.addSubview(name)
        name.snp.makeConstraints { make in
            make.left.equalTo(image.snp.right).offset(10)
            make.top.equalTo(10)
        }
        self.contentView.addSubview(address)
        address.font = UIFont(name: "Helvetica", size: 10)
        address.textColor = UIColor(red: 136/255, green: 136/255, blue: 136/255, alpha: 1)
        address.snp.makeConstraints { make in
            make.top.equalTo(name.snp.bottom).offset(10)
            make.left.equalTo(image.snp.right).offset(10)
        }
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    func updateUI(){
        name.text = cinemas.name
        image.image = cinemas.image
        address.text = cinemas.address
    }
}







