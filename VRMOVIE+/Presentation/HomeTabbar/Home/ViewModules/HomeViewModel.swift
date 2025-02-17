//
//  HomeViewModel.swift
//  VRMOVIE+
//
//  Created by Mamed Hacıyev on 3.02.2025.
//

import Foundation
import UIKit

class HomeViewModel {
    
    struct Section {
        let title: String
        let categories: [String]
        let color: UIColor
    }
    
    
    private(set) var sections: [Section] = [
        Section(title: "Fragman", categories: ["Popüler", "Yayında", "Televizyonda", "Kiralık", "Sinemalarda"], color: .systemPink),
        Section(title: "Popüler", categories: ["Yayında", "Televizyonda", "Sinemalarda"], color: .systemBlue),
        Section(title: "Ana Akım", categories: ["Bugün", "Bu Hafta"], color: .systemGreen)
    ]
    
    private(set) var selectedCategoryIndices: [Int]
    
    init() {
       
        selectedCategoryIndices = Array(repeating: -1, count: sections.count)
        selectedCategoryIndices[2] = 0
    }
    
    func updateSelectedCategory(at sectionIndex: Int, to categoryIndex: Int) {
        guard sectionIndex < selectedCategoryIndices.count else { return }
        
        if selectedCategoryIndices[sectionIndex] == categoryIndex {
            selectedCategoryIndices[sectionIndex] = -1
        } else {
            selectedCategoryIndices[sectionIndex] = categoryIndex
        }
    }
    
    func getSelectedCategory(for sectionIndex: Int) -> Int {
        return selectedCategoryIndices[sectionIndex]
    }
    
    func isSelectedCategory(at sectionIndex: Int, categoryIndex: Int) -> Bool {
        return selectedCategoryIndices[sectionIndex] == categoryIndex
    }
}
