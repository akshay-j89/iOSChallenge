//
//  ItemsViewModel.swift
//  AkshayAssignment
//
//  Created by Akshay Jain on 01/12/20.
//  Copyright © 2020 Akshay Jain. All rights reserved.
//

import UIKit
import ObjectMapper

class ItemsViewModel: NSObject {
    var onSuccessWithCategoryData: (([CategoryModel]) -> Void)?
    var onSuccessWithThemeData: (([ThemeModel]) -> Void)?
    var onSuccessWithTrendingData: (([TrendingModel]) -> Void)?
    var onSuccessWithTrendingDataTwo: (([TrendingModel]) -> Void)?
    var categoryArray: [CategoryModel] = []
    var themeArray: [ThemeModel] = []
    var trendingArray: [TrendingModel] = []
    var trendingArraySectionTwo: [TrendingModel] = []

    func createAndParseData(){
        
        createCategoryData()
        createThemeData()
        createTrendingData()
        self.ItemModelDataReceived(data: self.categoryArray)
        
        
    }
    func createCategoryData(){
        // create Data
        var categoryArray = [[String: Any]]()
        // Create a dictionary and add it to the array.
        let dictionary1: [String: Any] = ["title": "Stocks","thumbnail":"https://images.freeimages.com/images/large-previews/ddb/corn-field-2-1368926.jpg","colorBg":"#A4A4FD"]
        let dictionary2: [String: Any] = ["title": "ETF's","thumbnail":"https://images.freeimages.com/images/large-previews/6a5/dragon-fly-on-the-river-1394126.jpg","colorBg":"#4E4FCF"]
        
        let dictionary3: [String: Any] = ["title": "Crypto","thumbnail":"https://images.freeimages.com/images/large-previews/035/young-golden-retriever-1404848.jpg","colorBg":"#FED73D"]
        
        
        categoryArray.append(dictionary1)
        categoryArray.append(dictionary2)
        categoryArray.append(dictionary3)
        
        
        // Parse Data
        
        for obj in categoryArray {
            let categoryModelData = Mapper<CategoryModel>().map(JSONObject: obj)!
            self.categoryArray.append(categoryModelData)
        }
        
    }
    func createThemeData(){
        // create Data
        var themeArray = [[String: Any]]()
        // Create a dictionary and add it to the array.
        let dictionary1: [String: Any] = ["title": "Diversity & Inclusion","thumbnail":"https://images.freeimages.com/images/large-previews/ddb/corn-field-2-1368926.jpg"]
        let dictionary2: [String: Any] = ["title": "Bold Biotech","thumbnail":"https://images.freeimages.com/images/large-previews/6a5/dragon-fly-on-the-river-1394126.jpg"]
        
        let dictionary3: [String: Any] = ["title": "Crypto Central","thumbnail":"https://images.freeimages.com/images/large-previews/035/young-golden-retriever-1404848.jpg"]
        
        let dictionary4: [String: Any] = ["title": "She Runs it","thumbnail":"https://images.freeimages.com/images/large-previews/035/young-golden-retriever-1404848.jpg"]
        
        let dictionary5: [String: Any] = ["title": "Clean and Green","thumbnail":"https://images.freeimages.com/images/large-previews/035/young-golden-retriever-1404848.jpg"]
        
        let dictionary6: [String: Any] = ["title": "Cannabis - ness","thumbnail":"https://images.freeimages.com/images/large-previews/035/young-golden-retriever-1404848.jpg"]
        
        let dictionary7: [String: Any] = ["title": "Power it","thumbnail":"https://images.freeimages.com/images/large-previews/6a5/dragon-fly-on-the-river-1394126.jpg"]
        
        let dictionary8: [String: Any] = ["title": "Art and Fasion","thumbnail":"https://images.freeimages.com/images/large-previews/035/young-golden-retriever-1404848.jpg"]
        
        let dictionary9: [String: Any] = ["title": "Fun and Fitness","thumbnail":"https://images.freeimages.com/images/large-previews/035/young-golden-retriever-1404848.jpg"]
        
        let dictionary10: [String: Any] = ["title": "Home is where the heart it","thumbnail":"https://images.freeimages.com/images/large-previews/035/young-golden-retriever-1404848.jpg"]
        
        
        themeArray.append(dictionary1)
        themeArray.append(dictionary2)
        themeArray.append(dictionary3)
        themeArray.append(dictionary4)
        themeArray.append(dictionary5)
        themeArray.append(dictionary6)
        themeArray.append(dictionary7)
        themeArray.append(dictionary8)
        themeArray.append(dictionary9)
        themeArray.append(dictionary10)
        
        // Parse Data
        
        for obj in themeArray {
            let themeModelData = Mapper<ThemeModel>().map(JSONObject: obj)!
            self.themeArray.append(themeModelData)
        }
        
    }
    func createTrendingData(){
        // create Data
        var trendingArray = [[String: Any]]()
        // Create a dictionary and add it to the array.
        let dictionary1: [String: Any] = ["title": "Medifast", "subTitle":"MEDI","thumbnail":"https://images.freeimages.com/images/large-previews/ddb/corn-field-2-1368926.jpg","value":50.23]
        let dictionary2: [String: Any] = ["title": "Pinterest", "subTitle":"PINS","thumbnail":"https://images.freeimages.com/images/large-previews/ddb/corn-field-2-1368926.jpg","value":-4.77]
        
        let dictionary3: [String: Any] = ["title": "Stack Technologies", "subTitle":"WORK","thumbnail":"https://images.freeimages.com/images/large-previews/ddb/corn-field-2-1368926.jpg","value":-5.98]
        
        let dictionary4: [String: Any] = ["title": "Aqua Water", "subTitle":"AQUA","thumbnail":"https://images.freeimages.com/images/large-previews/b85/bay-lrt-station-1626400.jpg","value":60.53]
        
        var trendingArraySectionTwo = [[String: Any]]()

        let dictionary5: [String: Any] = ["title": "Stack Technologies", "subTitle":"WORK","thumbnail":"https://images.freeimages.com/images/large-previews/ddb/corn-field-2-1368926.jpg","value":-5.98]
              
        let dictionary6: [String: Any] = ["title": "Aqua Water", "subTitle":"AQUA","thumbnail":"https://images.freeimages.com/images/large-previews/b85/bay-lrt-station-1626400.jpg","value":60.53]
        
        
        trendingArray.append(dictionary1)
        trendingArray.append(dictionary2)
        trendingArray.append(dictionary3)
        trendingArray.append(dictionary4)
        trendingArray.append(dictionary5)
        trendingArray.append(dictionary6)
        trendingArraySectionTwo.append(dictionary5)
        trendingArraySectionTwo.append(dictionary6)

        
        // Parse Data
        
        for obj in trendingArray {
            let themeModelData = Mapper<TrendingModel>().map(JSONObject: obj)!
            self.trendingArray.append(themeModelData)
        }
        for obj in trendingArraySectionTwo {
            let themeModelData = Mapper<TrendingModel>().map(JSONObject: obj)!
            self.trendingArraySectionTwo.append(themeModelData)
        }
    }
    func getCategoryData(){
        onSuccessWithCategoryData?(self.categoryArray)
        
    }
    func getThemeData(){
        onSuccessWithThemeData?(self.themeArray)
        
    }
    func getTrendingData(){
        onSuccessWithTrendingData?(self.trendingArray)
        onSuccessWithTrendingDataTwo?(self.trendingArraySectionTwo)

    }
    
    private func ItemModelDataReceived(data: [CategoryModel]) {
        onSuccessWithCategoryData?(data)
    }
    
}
