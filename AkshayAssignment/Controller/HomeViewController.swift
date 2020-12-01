//
//  HomeViewController.swift
//  AkshayAssignment
//
//  Created by Akshay Jain on 01/12/20.
//  Copyright © 2020 Akshay Jain. All rights reserved.
//

import UIKit
import ObjectMapper
import HMSegmentedControl
class HomeViewController: UIViewController {
    // MARK:- UI Elements
    
    // MARK:- Main View
    /// Main Container View
    let containerView:UIView = {
        let view = UIView()
        view.clipsToBounds = true
        view.translatesAutoresizingMaskIntoConstraints = false
        return view
    }()
    
    let segmentBackgroundView:UIView = {
        let view = UIView()
        view.clipsToBounds = true
        view.translatesAutoresizingMaskIntoConstraints = false
        return view
    }()
    
    // MARK:- Collection  View
    
    
    ///  Collection  view
    lazy var itemsCollectionView:UICollectionView = {
        let layout: UICollectionViewFlowLayout = UICollectionViewFlowLayout()
        layout.sectionInset = UIEdgeInsets(top: 20, left: 10, bottom: 10, right: 10)
        layout.scrollDirection = .vertical
        layout.itemSize = CGSize(width: 60, height: 60)
        let collectionView = UICollectionView.init(frame: .zero, collectionViewLayout: layout)
        collectionView.backgroundColor = .clear
        collectionView.dataSource = self
        collectionView.delegate = self
        collectionView.translatesAutoresizingMaskIntoConstraints = false
        return collectionView
    }()
    
    var segmentControl = HMSegmentedControl()
    private var itemViewModel: ItemsViewModel!
    
    var categoryArray: [CategoryModel] = []
    var themeArray: [ThemeModel] = []
    var trendingArray: [TrendingModel] = []
    var trendingArraySectionTwo: [TrendingModel] = []
    
    var selectedIndex = 0
    
    private func registerCells(){
        itemsCollectionView.register(CategoryCollectionViewCell.self, forCellWithReuseIdentifier: CategoryCollectionViewCell.reuseIdentifier)
        
        itemsCollectionView.register(ThemeCollectionViewCell.self, forCellWithReuseIdentifier: ThemeCollectionViewCell.reuseIdentifier)
        
        itemsCollectionView.register(TrendingCollectionViewCell.self, forCellWithReuseIdentifier: TrendingCollectionViewCell.reuseIdentifier)
        
        itemsCollectionView.register(HeaderTrendingCollectionViewCell.self, forSupplementaryViewOfKind:UICollectionView.elementKindSectionHeader, withReuseIdentifier:  HeaderTrendingCollectionViewCell.reuseIdentifier)
        
        
    }
    override func viewDidLoad() {
        super.viewDidLoad()
        setupUIElements()
        registerCells()
        itemViewModel = ItemsViewModel()
        setupViewModel()
        createAndGetData()
        setupUI()
        
        
        // Do any additional setup after loading the view.
    }
    func createAndGetData() { // for api call or data creation
        itemViewModel.createAndParseData()
    }
    func  setupViewModel(){
        itemViewModel.onSuccessWithCategoryData = {[weak self] data in
            guard let strongSelf = self else {return}
            strongSelf.categoryArray = data
            DispatchQueue.main.async {
                strongSelf.itemsCollectionView.reloadData()
            }
        }
        itemViewModel.onSuccessWithThemeData = {[weak self] data in
            guard let strongSelf = self else {return}
            strongSelf.themeArray = data
            DispatchQueue.main.async {
                strongSelf.itemsCollectionView.reloadData()
            }
        }
        itemViewModel.onSuccessWithTrendingData = {[weak self] data in
            guard let strongSelf = self else {return}
            strongSelf.trendingArray = data
        }
        itemViewModel.onSuccessWithTrendingDataTwo = {[weak self] data in
            guard let strongSelf = self else {return}
            strongSelf.trendingArraySectionTwo = data
            DispatchQueue.main.async {
                strongSelf.itemsCollectionView.reloadData()
            }
        }
        
    }
    func topSafeAreaInset() -> CGFloat {
        if #available(iOS 11.0, *) {
            let window = UIApplication.shared.windows[0]
            let topPadding = window.safeAreaInsets.top
            return topPadding
        }else {
            return 0
        }
    }
    func setupUIElements(){
        self.view.addSubview(containerView)
        NSLayoutConstraint.activate([
            containerView.topAnchor.constraint(equalTo: self.view.topAnchor),
            containerView.leadingAnchor.constraint(equalTo: self.view.leadingAnchor),
            containerView.trailingAnchor.constraint(equalTo: self.view.trailingAnchor),
            containerView.bottomAnchor.constraint(equalTo: self.view.bottomAnchor)
        ])
        
        containerView.addSubview(segmentBackgroundView)
        NSLayoutConstraint.activate([
            segmentBackgroundView.topAnchor.constraint(equalTo: containerView.topAnchor, constant: 20 + self.topSafeAreaInset()),
            segmentBackgroundView.leadingAnchor.constraint(equalTo: containerView.leadingAnchor),
            segmentBackgroundView.trailingAnchor.constraint(equalTo: containerView.trailingAnchor),
            segmentBackgroundView.heightAnchor.constraint(equalToConstant: 60)
        ])
        
        
        containerView.addSubview(itemsCollectionView)
        NSLayoutConstraint.activate([
            itemsCollectionView.topAnchor.constraint(equalTo: segmentBackgroundView.bottomAnchor),
            itemsCollectionView.leadingAnchor.constraint(equalTo: containerView.leadingAnchor),
            itemsCollectionView.trailingAnchor.constraint(equalTo: containerView.trailingAnchor),
            itemsCollectionView.bottomAnchor.constraint(equalTo: containerView.bottomAnchor)
        ])
        
        
    }
    func setupUI(){
        self.navigationItem.title = "Explore";
        
        segmentControl = HMSegmentedControl(sectionTitles: [
            "Category",
            "Theme",
            "Trending"
        ])
        
        segmentControl.frame = CGRect(x: 0, y: 0, width: self.view.frame.size.width, height: 60)
        segmentControl.addTarget(self, action: #selector(segmentedControlChangedValue(segmentedControl:)), for: .valueChanged)
        segmentControl.selectionIndicatorHeight = 2.0
        segmentControl.selectionStyle = .fullWidthStripe
        segmentControl.type = .text
        segmentControl.selectionIndicatorLocation = .bottom
        segmentControl.selectionIndicatorColor = UIColor(red: 110/255.0, green: 166/255, blue: 56/255, alpha: 1.0)
        segmentBackgroundView.addSubview(segmentControl)
    }
    @objc func segmentedControlChangedValue(segmentedControl: HMSegmentedControl) {
        print("Selected index \(segmentedControl.selectedSegmentIndex)")
        selectedIndex = Int(segmentedControl.selectedSegmentIndex)
        if selectedIndex == 0 {
            itemViewModel.getCategoryData()
        }
        else if selectedIndex == 1 {
            itemViewModel.getThemeData()
            
        }else {
            itemViewModel.getTrendingData()
            
        }
    }
    
    /*
     // MARK: - Navigation
     
     // In a storyboard-based application, you will often want to do a little preparation before navigation
     override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
     // Get the new view controller using segue.destination.
     // Pass the selected object to the new view controller.
     }
     */
    
}
extension HomeViewController: UICollectionViewDataSource, UICollectionViewDelegate, UICollectionViewDelegateFlowLayout {
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        if selectedIndex == 0 {
            let cell = collectionView.dequeueReusableCell(withReuseIdentifier: CategoryCollectionViewCell.reuseIdentifier, for: indexPath) as! CategoryCollectionViewCell
            cell.loadCell(object: categoryArray[indexPath.row])
            return cell
        }
        else if selectedIndex == 1 {
            let cell = collectionView.dequeueReusableCell(withReuseIdentifier: ThemeCollectionViewCell.reuseIdentifier, for: indexPath) as! ThemeCollectionViewCell
            cell.loadCell(object: themeArray[indexPath.row])
            return cell
        } else  {
            let cell = collectionView.dequeueReusableCell(withReuseIdentifier: TrendingCollectionViewCell.reuseIdentifier, for: indexPath) as! TrendingCollectionViewCell
            cell.loadCell(object: trendingArray[indexPath.row])
            return cell
        }
        
    }
    
    func collectionView(_ collectionView: UICollectionView,layout collectionViewLayout: UICollectionViewLayout, sizeForItemAt indexPath: IndexPath) -> CGSize {
        if selectedIndex == 0 {
            
            return CGSize(width: (itemsCollectionView.frame.size.width - 10), height: 100);
        }
        else if selectedIndex == 1 {
            return CGSize(width: (itemsCollectionView.frame.size.width/2 - 30), height: 160);
            
        }
        else {
            return CGSize(width: (itemsCollectionView.frame.size.width - 10), height: 70);
        }
    }
    
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        if selectedIndex == 0 {
            return categoryArray.count
        }
        else if selectedIndex == 1 {
            return themeArray.count
        }
        else {
            if section == 1 {
                return trendingArray.count
            }else {
                return trendingArraySectionTwo.count
            }
        }
    }
    
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, referenceSizeForHeaderInSection section: Int) -> CGSize {
        if selectedIndex == 2 {
            return CGSize(width: (itemsCollectionView.frame.size.width - 10), height: 30);
        }
        else{
            return CGSize(width: (itemsCollectionView.frame.size.width - 10), height: 0);
        }
        
    }
    func collectionView(_ collectionView: UICollectionView, viewForSupplementaryElementOfKind kind: String, at indexPath: IndexPath) -> UICollectionReusableView {
        let  header: HeaderTrendingCollectionViewCell = collectionView.dequeueReusableSupplementaryView(ofKind: kind, withReuseIdentifier: "HeaderTrendingCollectionViewCell", for: indexPath) as! HeaderTrendingCollectionViewCell
        
        if (kind == UICollectionView.elementKindSectionHeader) {
            if indexPath.section == 1 {
                header.loadCell(title: "Top Gainers")
            }
            else {
                header.loadCell(title: "Top Sellers")
            }
        }
        return header
        
    }
    
    func numberOfSections(in collectionView: UICollectionView) -> Int {
        if selectedIndex == 2 {
            return 2
        }
        else {
            return 1
        }
    }
    
    
    func collectionView(_ collectionView: UICollectionView, didSelectItemAt indexPath: IndexPath){
        
    }
    
    
    
    func collectionView(_ collectionView: UICollectionView, willDisplay cell: UICollectionViewCell, forItemAt indexPath: IndexPath) {
        
    }
}
