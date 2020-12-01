//
//  TrendingCollectionViewCell.swift
//  AkshayAssignment
//
//  Created by Akshay Jain on 01/12/20.
//  Copyright © 2020 Akshay Jain. All rights reserved.
//

import UIKit
import SDWebImage
class TrendingCollectionViewCell: UICollectionViewCell {
    
    @objc static let reuseIdentifier = "TrendingCollectionViewCell"
    
    let containerView:UIView = {
        let view = UIView()
        view.backgroundColor = .clear
        view.translatesAutoresizingMaskIntoConstraints = false
        return view
    }()
    
    let imgThumbnail:UIImageView = {
        let view = UIImageView()
        view.backgroundColor = .clear
        view.contentMode = .scaleAspectFill
        view.translatesAutoresizingMaskIntoConstraints = false
        return view
    }()
    
    
    let titleLabel: UILabel = {
        let label = UILabel()
        label.numberOfLines = 2
        label.contentMode = .center
        label.textAlignment = .left
        label.textColor = .black
        label.font = UIFont.boldSystemFont(ofSize: 20)
        label.translatesAutoresizingMaskIntoConstraints = false
        return label
    }()
    
    let subTitleLabel: UILabel = {
        let label = UILabel()
        label.numberOfLines = 0
        label.contentMode = .center
        label.textAlignment = .left
        label.textColor = .black
        label.font = UIFont.systemFont(ofSize: 16)
        label.translatesAutoresizingMaskIntoConstraints = false
        return label
    }()
    let valueLabel: UILabel = {
        let label = UILabel()
        label.numberOfLines = 0
        label.contentMode = .center
        label.textAlignment = .center
        label.textColor = .white
        label.font = UIFont.systemFont(ofSize: 16)
        label.translatesAutoresizingMaskIntoConstraints = false
        return label
    }()
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        self.setUpUIElements()
        
    }
    
    required init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    private func setUpUIElements() {
        
        self.backgroundColor = UIColor.clear
        self.contentView.backgroundColor = UIColor.clear
        
        self.contentView.addSubview(containerView)
        
        NSLayoutConstraint.activate([
            containerView.topAnchor.constraint(equalTo: contentView.topAnchor),
            containerView.leadingAnchor.constraint(equalTo: contentView.leadingAnchor),
            containerView.trailingAnchor.constraint(equalTo: contentView.trailingAnchor),
            containerView.bottomAnchor.constraint(equalTo: contentView.bottomAnchor)
        ])
        
        containerView.addSubview(imgThumbnail)
        
        NSLayoutConstraint.activate([
            imgThumbnail.leadingAnchor.constraint(equalTo: containerView.leadingAnchor, constant: 15),
            imgThumbnail.centerYAnchor.constraint(equalTo: containerView.centerYAnchor, constant: 0),
            imgThumbnail.heightAnchor.constraint(equalToConstant: 50),
            imgThumbnail.widthAnchor.constraint(equalToConstant: 50)
            
        ])
        
        
        containerView.addSubview(titleLabel)
        
        NSLayoutConstraint.activate([
            titleLabel.topAnchor.constraint(equalTo: containerView.topAnchor,constant: 5),
            titleLabel.leadingAnchor.constraint(equalTo: imgThumbnail.trailingAnchor, constant: 15),
            titleLabel.trailingAnchor.constraint(equalTo: containerView.trailingAnchor, constant: 90),
            titleLabel.heightAnchor.constraint(equalToConstant: 30),
            
        ])
        containerView.addSubview(subTitleLabel)
        
        NSLayoutConstraint.activate([
            subTitleLabel.topAnchor.constraint(equalTo: titleLabel.bottomAnchor,constant: 0),
            subTitleLabel.leadingAnchor.constraint(equalTo: imgThumbnail.trailingAnchor, constant: 15),
            subTitleLabel.trailingAnchor.constraint(equalTo: containerView.trailingAnchor, constant: 90),
            subTitleLabel.heightAnchor.constraint(equalToConstant: 20),
            
        ])
        
        containerView.addSubview(valueLabel)
        
        NSLayoutConstraint.activate([
            valueLabel.trailingAnchor.constraint(equalTo: containerView.trailingAnchor,constant: -10),
            valueLabel.centerYAnchor.constraint(equalTo: containerView.centerYAnchor, constant: 0),
            valueLabel.widthAnchor.constraint(equalToConstant: 80),
            valueLabel.heightAnchor.constraint(equalToConstant: 30),
            
            
        ])
        
        
    }
    
    override func layoutSubviews() {
        super.layoutSubviews()
        self.valueLabel.layoutIfNeeded()
        self.valueLabel.layer.cornerRadius = 3.0
        self.valueLabel.clipsToBounds = true
        self.imgThumbnail.layoutIfNeeded()
        self.imgThumbnail.clipsToBounds = true
        
        self.imgThumbnail.roundCorners(.allCorners, radius: self.imgThumbnail.frame.size.height/2)
        
        
    }
    
    func loadCell(object: TrendingModel) {
        
        if let img = object.thumbnail {
            if let url = URL(string: img){
                self.imgThumbnail.sd_cancelCurrentAnimationImagesLoad()
                self.imgThumbnail.sd_setImage(with: url, placeholderImage: UIImage(named: ""), options: [], completed: nil)
            }
            else {
                self.imgThumbnail.image = UIImage(named: "")
            }
        }
        
        
        titleLabel.text = object.title
        subTitleLabel.text = object.subTitle
        
        if object.value < 0 {
            self.valueLabel.backgroundColor = UIColor(hexString: "#FA696B")
        }else {
            self.valueLabel.backgroundColor = UIColor(hexString: "#3FDBB4")
        }
        self.valueLabel.text = "\(object.value)%"
        
        
    }
}


