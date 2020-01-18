//
//  LevelSectionsViewModel.swift
//  glide Demo
//
//  Copyright (c) 2019 cocoatoucher user on github.com (https://github.com/cocoatoucher/)
//
//  Permission is hereby granted, free of charge, to any person obtaining a copy
//  of this software and associated documentation files (the "Software"), to deal
//  in the Software without restriction, including without limitation the rights
//  to use, copy, modify, merge, publish, distribute, sublicense, and/or sell
//  copies of the Software, and to permit persons to whom the Software is
//  furnished to do so, subject to the following conditions:

//  The above copyright notice and this permission notice shall be included in all
//  copies or substantial portions of the Software.

//  THE SOFTWARE IS PROVIDED "AS IS", WITHOUT WARRANTY OF ANY KIND, EXPRESS OR
//  IMPLIED, INCLUDING BUT NOT LIMITED TO THE WARRANTIES OF MERCHANTABILITY,
//  FITNESS FOR A PARTICULAR PURPOSE AND NONINFRINGEMENT. IN NO EVENT SHALL THE
//  AUTHORS OR COPYRIGHT HOLDERS BE LIABLE FOR ANY CLAIM, DAMAGES OR OTHER
//  LIABILITY, WHETHER IN AN ACTION OF CONTRACT, TORT OR OTHERWISE, ARISING FROM,
//  OUT OF OR IN CONNECTION WITH THE SOFTWARE OR THE USE OR OTHER DEALINGS IN THE
//  SOFTWARE.
//

import Foundation

struct Levels: Codable {
    let sections: [Section]
}

struct Section: Codable {
    let name: String
    let info: String
    let levels: [Level]
}

struct Level: Codable {
    let file: String
    let textures: String
    let name: String
    let scene: String
    let info: String
    let isSKS: Bool?
}

class LevelSectionsViewModel {
    
    private let sections: [Section]
    let sectionViewModels: [SingleLevelSectionViewModel]
    
    init() {
        guard let url = Bundle.main.url(forResource: "Levels", withExtension: ".json") else {
            print("(error) levels file couldn't be found")
            self.sections = []
            self.sectionViewModels = []
            return
        }
        
        do {
            let jsonData = try Data.init(contentsOf: url, options: Data.ReadingOptions.alwaysMapped)
            let decoder = JSONDecoder()
            
            let levels = try decoder.decode(Levels.self, from: jsonData)
            self.sections = levels.sections
            self.sectionViewModels = sections.map { SingleLevelSectionViewModel(section: $0) }
        } catch {
            print(error)
            self.sections = []
            self.sectionViewModels = []
        }
    }
    
}
