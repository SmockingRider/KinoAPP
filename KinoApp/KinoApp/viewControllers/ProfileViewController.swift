//
//  ProfileViewController.swift
//  KinoApp
//
//  Created by Seidaly Rustem on 12.02.2023.
//

import UIKit

final class ProfileViewController: UIViewController {
    
    private lazy var mainPicture: UIImageView = {
        let imageView = UIImageView()
        imageView.image = UIImage(named: "ico")
        imageView.clipsToBounds = true
        imageView.transform = CGAffineTransform(scaleX: 4, y: 4)
        return imageView
    }()
    
    private lazy var signButton: UIButton = {
        let button = UIButton(type: .system)
        button.backgroundColor = .systemGray2
        button.setTitleColor(.white, for: .normal)
        button.setTitle("Sign", for: .normal)
        button.layer.cornerRadius = 20
        button.titleLabel?.font = UIFont(name: "Helvetica Neue", size: 20)
        return button
    }()
    
    override func viewDidLoad() {
        super.viewDidLoad()

        view.backgroundColor = .systemBackground
        
        setupViews()
        setupConstraints()
    }
}

//MARK: - Setup view and Constraints methods

private extension ProfileViewController {
    
    func setupViews(){
        view.addSubview(mainPicture)
        view.addSubview(signButton)
        
    }
    func setupConstraints() {
        mainPicture.snp.makeConstraints { make in
            make.centerX.centerY.equalToSuperview()
            make.width.equalToSuperview().dividedBy(10)
            make.height.equalToSuperview().dividedBy(25)
        }
        signButton.snp.makeConstraints { make in
            make.centerX.equalToSuperview()
            make.top.equalTo(mainPicture.snp.bottom).offset(70)
            make.width.equalTo(100)
            make.height.equalTo(40)
        }
    }
}
