//
// PlaceViewController.swift
// KinoApp
//
// Created by Seidaly Rustem on 29.01.2023.
//

import UIKit
import SnapKit

class PlaceViewController: UIViewController {
    
    private let scrollView = UIScrollView()
    private let contentView = UIView()
    
    private let categoryList = Category.allCases
    
    private lazy var placeSearchBar: UISearchBar = {
        let serchBar = UISearchBar()
        serchBar.searchBarStyle = .minimal
        serchBar.placeholder = "Search"
        return serchBar
    }()
    
    private lazy var categoryCollectionView: UICollectionView = {
        let layout = UICollectionViewFlowLayout()
        layout.scrollDirection = .horizontal
        let collectionView = UICollectionView(frame: .zero, collectionViewLayout: layout)
        collectionView.register(CategoryCollectionViewCell.self, forCellWithReuseIdentifier: itemForProject.Identifiers.categoryCollectionViewCell)
        collectionView.showsHorizontalScrollIndicator = false
        return collectionView
    }()
    
    let cinema = CinemasList()
    var tableView = UITableView()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        categoryCollectionView.dataSource = self
        categoryCollectionView.delegate = self
        
        tableView.register(Cinemas.self, forCellReuseIdentifier: "cell")
        
        tableView.delegate = self
        tableView.dataSource = self
        
        view.backgroundColor = .systemBackground
        
        setupViews()
        setupConstraints()
        

    }
}
    //MARK: - Collection view DataSource methods
    
    extension PlaceViewController: UICollectionViewDataSource {
        
        func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
            if collectionView == categoryCollectionView {
                return categoryList.count
            }
            return 5
        }
        
        func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
            let cell = collectionView.dequeueReusableCell(withReuseIdentifier: itemForProject.Identifiers.categoryCollectionViewCell, for: indexPath) as! CategoryCollectionViewCell
            cell.configure(with: categoryList[indexPath.row].rawValue)
            cell.backgroundColor = .systemGray6
            cell.layer.cornerRadius = 5
            cell.clipsToBounds = true
            return cell
        }
    }
    
    
    //MARK: - Collection view Delegate methods
    
    extension PlaceViewController: UICollectionViewDelegateFlowLayout {
        
        func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, sizeForItemAt indexPath: IndexPath) -> CGSize {
            if collectionView == categoryCollectionView {
                let label = UILabel()
                label.text = categoryList[indexPath.row].rawValue
                label.sizeToFit()
                return CGSize(width: label.frame.size.width + 30, height: collectionView.frame.size.height - 10)
            }
            let height = collectionView.frame.size.height
            return CGSize(width: view.frame.size.width * 0.75, height: height)
        }
    }
    
    
    //MARK: - Table view DataSours methods
    
    extension PlaceViewController: UITableViewDataSource {
        
        func numberOfSections(in tableView: UITableView) -> Int {
            return 1
        }
        
        func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
            return cinema.cinemas.count
        }
        
        func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
            let cell = tableView.dequeueReusableCell(withIdentifier: "cell", for: indexPath) as! Cinemas
            cell.cinemas = cinema.cinemas[indexPath.row]
            cell.backgroundColor = .systemBackground
            return cell
        }
    }
    
    
    //MARK: - MARK: - Table view delegate methods
    
    extension PlaceViewController: UITableViewDelegate {
        
        func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
            return view.frame.size.height * 0.1
        }
    }
    

    //MARK: - Setup views and Constraints
    
    private extension PlaceViewController {
        
        func setupViews(){
            view.addSubview(scrollView)
            scrollView.addSubview(contentView)
            contentView.addSubview(placeSearchBar)
            contentView.addSubview(categoryCollectionView)
            contentView.addSubview(tableView)
        }
        
        func setupConstraints() {
            scrollView.snp.makeConstraints { make in
                make.edges.equalToSuperview()
            }
            
            contentView.snp.makeConstraints { make in
                make.top.bottom.equalToSuperview()
                make.leading.trailing.equalTo(view).inset(15)
            }
            
            placeSearchBar.snp.makeConstraints { make in
                make.top.leading.trailing.equalToSuperview()
                make.height.equalToSuperview().multipliedBy(0.06)
            }
            
            placeSearchBar.searchTextField.snp.makeConstraints { make in
                make.edges.equalToSuperview()
            }
            
            categoryCollectionView.snp.makeConstraints { make in
                make.top.equalTo(placeSearchBar.snp.bottom).offset(10)
                make.leading.trailing.equalToSuperview()
                make.height.equalToSuperview().multipliedBy(0.055)
            }
            
            tableView.snp.makeConstraints { make in
                make.top.equalTo(categoryCollectionView.snp.bottom).offset(10)
                make.leading.trailing.equalTo(view)
                make.bottom.equalTo(view).multipliedBy(1.5)
            }
        }
    }


