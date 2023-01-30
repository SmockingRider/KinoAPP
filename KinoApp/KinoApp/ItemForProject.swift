//
//  ItemForProject.swift
//  KinoApp
//
//  Created by Seidaly Rustem on 29.01.2023.
//

import Foundation
import UIKit


struct itemForProject {
    
    struct Identifiers {
        static let categoryCollectionViewCell = "CategoryCollectionViewCell"
        static let trendingCollectionViewCell = "TrendingCollectionViewCell"
        static let categoryTableViewCell = "CategoryTableViewCell"
    }
    struct Values {
        
    }
    struct Colors {
        
    }
}
    enum Category: String, CaseIterable {
        case all = "🔥All"
        case streaming = "🎞️Streaming"
        case onTV = "📺OnTV"
        case inTheaters = "🍿In Theaters"
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







