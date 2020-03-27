//
//  MainViewModel.swift
//  iOSTest
//
//  Created by abdul on 27/03/20.
//  Copyright © 2020 abdul. All rights reserved.
//

import Foundation

protocol DataDelegate: class {
    func didFinish()
}

class MainViewModel {
    
    weak var dataDelegate:DataDelegate?
    
    var table1Data = [EmployeeData]()
    var table2Data = [EmployeeData]()
    
    init() {
        
    }
    
    func populateData() {
        // read the json and assign it to the model
        if let path = Bundle.main.path(forResource: "Data", ofType: "json") {
            do {
                let fileUrl = URL(fileURLWithPath: path)
                // Getting data from JSON file using the file URL
                let data = try Data(contentsOf: fileUrl, options: .mappedIfSafe)
                let jsonDecoder = JSONDecoder()
                let responseModel = try jsonDecoder.decode(EmployeeModel.self, from: data)
                mainupulateData(baseModel: responseModel)
            } catch {
                // Handle error here
                print("Error getting data from file - \(error.localizedDescription)")
            }
        }
    }
    
    func mainupulateData(baseModel:EmployeeModel) {
        for item in baseModel.data ?? [] {
            if table1Data.count != 20 {
               table1Data.append(item)
            }else {
                table2Data.append(item)
            }
        }
        
        dataDelegate?.didFinish()
    }
    
    
}
