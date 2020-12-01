//
//  ThemeCollectionViewCell.swift
//  AkshayAssignment
//
//  Created by Akshay Jain on 01/12/20.
//  Copyright © 2020 Akshay Jain. All rights reserved.
//

import UIKit
import SDWebImage
class ThemeCollectionViewCell: UICollectionViewCell {
    
    @objc static let reuseIdentifier = "ThemeCollectionViewCell"
    
    let containerView:UIView = {
        let view = UIView()
        view.backgroundColor = UIColor(hexString: "#FAFBFC")
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
        label.textAlignment = .center
        label.textColor = .black
        label.font = UIFont.boldSystemFont(ofSize: 16)
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
            imgThumbnail.topAnchor.constraint(equalTo: containerView.topAnchor, constant: 10),
            imgThumbnail.centerXAnchor.constraint(equalTo: containerView.centerXAnchor, constant: 0),
            imgThumbnail.heightAnchor.constraint(equalToConstant: 100),
            imgThumbnail.widthAnchor.constraint(equalToConstant: 100)
            
        ])
        
        
        containerView.addSubview(titleLabel)
        
        NSLayoutConstraint.activate([
            titleLabel.topAnchor.constraint(equalTo: imgThumbnail.bottomAnchor, constant: 10),
            titleLabel.leadingAnchor.constraint(equalTo: containerView.leadingAnchor, constant: 5),
            titleLabel.trailingAnchor.constraint(equalTo: containerView.trailingAnchor, constant: 5),
            titleLabel.centerXAnchor.constraint(equalTo: containerView.centerXAnchor, constant: 0),
            titleLabel.heightAnchor.constraint(equalToConstant: 40),
            
            
            
        ])
        
    }
    
    override func layoutSubviews() {
        super.layoutSubviews()
        self.containerView.layoutIfNeeded()
        self.containerView.layer.cornerRadius = 3.0
        self.containerView.clipsToBounds = true
        self.imgThumbnail.layoutIfNeeded()
        self.imgThumbnail.clipsToBounds = true
        
        self.imgThumbnail.roundCorners(.allCorners, radius: self.imgThumbnail.frame.size.height/2)
    }
    
    func loadCell(object: ThemeModel) {
        
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
    }
}
