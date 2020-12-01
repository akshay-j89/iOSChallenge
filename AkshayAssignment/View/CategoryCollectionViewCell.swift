//
//  CategoryCollectionViewCell.swift
//  AkshayAssignment
//
//  Created by Akshay Jain on 01/12/20.
//  Copyright © 2020 Akshay Jain. All rights reserved.
//

import UIKit
import SDWebImage
class CategoryCollectionViewCell: UICollectionViewCell {
    
    @objc static let reuseIdentifier = "CategoryCollectionViewCell"
    
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
        label.textColor = .white
        label.font = UIFont.boldSystemFont(ofSize: 20)
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
            titleLabel.topAnchor.constraint(equalTo: containerView.topAnchor),
            titleLabel.leadingAnchor.constraint(equalTo: imgThumbnail.trailingAnchor, constant: 15),
            titleLabel.trailingAnchor.constraint(equalTo: containerView.trailingAnchor),
            titleLabel.centerYAnchor.constraint(equalTo: containerView.centerYAnchor, constant: 0),
            
            
        ])
        
    }
    
    override func layoutSubviews() {
        super.layoutSubviews()
        self.containerView.layoutIfNeeded()
        self.containerView.layer.cornerRadius = self.containerView.frame.size.height/2
        self.containerView.clipsToBounds = true
        self.imgThumbnail.layoutIfNeeded()
        self.imgThumbnail.clipsToBounds = true
        
        self.imgThumbnail.roundCorners(.allCorners, radius: self.imgThumbnail.frame.size.height/2)
    }
    
    func loadCell(object: CategoryModel) {
        
        if let img = object.thumbnail {
            if let url = URL(string: img){
                self.imgThumbnail.sd_cancelCurrentAnimationImagesLoad()
                self.imgThumbnail.sd_setImage(with: url, placeholderImage: UIImage(named: ""), options: [], completed: nil)
            }
            else {
                self.imgThumbnail.image = UIImage(named: "")
            }
        }
        if let sColor = object.colorBg, sColor != "" {
            
            self.containerView.backgroundColor = UIColor(hexString: sColor)
        }
        else {
            self.containerView .backgroundColor = .clear
        }
        
        titleLabel.text = object.title
    }
}
