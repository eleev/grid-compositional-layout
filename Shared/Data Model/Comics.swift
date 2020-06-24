//
//  Comics.swift
//  Shared
//
//  Created by Astemir Eleev on 24.06.2020.
//  Copyright © 2020 Astemir Eleev, Inc. All rights reserved.
//

import Foundation

struct Comics: Identifiable {
    
    // MARK: - Properties
    
    var id: UUID = .init()
    
    var imageName: String
    var caption: String
    var comment: String
    
    // MARK: - Initializers
    
    init(imageName: String, caption: String, comment: String) {
        self.caption = caption
        self.comment = comment
        self.imageName = imageName
    }
    
    init?(dictionary: [String : String]) {
        guard let image = dictionary["Cover"],  let caption = dictionary["Caption"], let comment = dictionary["Comment"] else {
            debugPrint(#function + " one of the data properties from ComicData.plist could not be unwrapped or is nil")
            return nil
        }
        self.init(imageName: image, caption: caption, comment: comment)
    } 
}
