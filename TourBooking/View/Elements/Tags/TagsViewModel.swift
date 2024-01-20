//
//  TagsViewModel.swift
//  TourBooking
//
//  Created by Elena Kim on 1/14/24.
//

import SwiftUI

class TagsViewModel: ObservableObject{
    @Published var rows: [[Tag]] = []
    @Published var tags: [Tag]
    
    init(tagsString: [String]){
        self.tags = tagsString.map { Tag(name: $0) }
        getTagsRows()
    }
    
    func getTagsRows(){
        var rows: [[Tag]] = []
        var currentRow: [Tag] = []
        var totalWidth: CGFloat = 0
        
        let screenWidth = UIScreen.screenWidth
        let tagSpaceing: CGFloat = 8 + 20
        
        if !tags.isEmpty{
            for index in 0 ..< tags.count{
                self.tags[index].size = tags[index].name.getSize(for: 16, weight: .medium)
            }
            tags.sort { $0.size < $1.size }
            tags.forEach { tag in
                
                totalWidth += (tag.size + tagSpaceing)
                
                if totalWidth > screenWidth {
                    totalWidth = (tag.size + tagSpaceing)
                    rows.append(currentRow)
                    currentRow.removeAll()
                    currentRow.append(tag)
                } else {
                    currentRow.append(tag)
                }
            }
            
            if !currentRow.isEmpty {
                rows.append(currentRow)
                currentRow.removeAll()
            }
            
            self.rows = rows
        } else {
            self.rows = []
        }
    }
}
