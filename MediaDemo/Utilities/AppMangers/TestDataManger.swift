//
//  TestDataManger.swift
//  MediaDemo
//
//  Created by Ali Tarek on 7/3/21.
//

import Foundation

public class TestDataManager
{
    // MARK:- Methods
    
    class func getJSONData(fromFile fileName: String) -> Data
    {
        guard let path = Bundle.main.path(forResource: fileName, ofType: "json"),
              let data = try? Data(contentsOf: URL(fileURLWithPath: path), options: .mappedIfSafe) else
        {
            return Data()
        }
        return data
    }
}
