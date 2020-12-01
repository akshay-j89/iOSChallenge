//
//  HeaderTrendingCollectionViewCell.swift
//  AkshayAssignment
//
//  Created by Akshay Jain on 01/12/20.
//  Copyright © 2020 Akshay Jain. All rights reserved.
//

import UIKit
class HeaderTrendingCollectionViewCell: UICollectionViewCell {
    
    @objc static let reuseIdentifier = "HeaderTrendingCollectionViewCell"
    
    let containerView:UIView = {
        let view = UIView()
        view.backgroundColor = .clear
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
        
        
        
        
        containerView.addSubview(titleLabel)
        
        NSLayoutConstraint.activate([
            titleLabel.topAnchor.constraint(equalTo: containerView.topAnchor),
            titleLabel.leadingAnchor.constraint(equalTo: containerView.leadingAnchor, constant: 10),
            titleLabel.trailingAnchor.constraint(equalTo: containerView.trailingAnchor,constant: 10),
            titleLabel.centerYAnchor.constraint(equalTo: containerView.centerYAnchor, constant: 0),
            
            
        ])
        
    }
    
    override func layoutSubviews() {
        super.layoutSubviews()
        self.containerView.layoutIfNeeded()
        self.containerView.layer.cornerRadius = self.containerView.frame.size.height/2
        self.containerView.clipsToBounds = true
        
    }
    
    func loadCell(title: String) {
        
        titleLabel.text = title
    }
}
