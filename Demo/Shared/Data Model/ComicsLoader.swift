//
//  ComicsLoader.swift
//  Shared
//
//  Created by Astemir Eleev on 24.06.2020.
//  Copyright © 2020 Astemir Eleev, Inc. All rights reserved.
//

import Foundation

struct ComicsLoader {
    
    // MARK: - Properties
    
    static let dataSource = "ComicsData"
    static let type = "plist"
    
    // MARK: - Methods
    
    static func covers(duplicationFactor: Int = 0) -> [Comics] {
        var covers = [Comics]()
        
        guard let url = Bundle.main.url(forResource: dataSource, withExtension: type), let coverDict = NSArray(contentsOf: url) as? [[String : String]] else {
            
            debugPrint(#function + " could not find Comics asset catalog or something went wrong" )
            return covers
        }
        
        for dictPair in coverDict {
            if let comicCover = Comics(dictionary: dictPair) {
                covers += [comicCover]
            }
        }
        
        for _ in 0..<duplicationFactor {
            covers.forEach { comics in
                var copy = comics
                copy.id = .init()
                covers += [copy]
            }
        }
        
        return covers
    }
}
