//
//  SearchLandmarkViewModel.swift
//  Landmark-remark
//
//  Created by Diep Nguyen on 3/28/19.
//  Copyright © 2019 Diep Nguyen. All rights reserved.
//

final class SearchLandmarkViewModel {
    
    var searchList: DataBinding<[LocationModel]>?
    
    var originalList = [LocationModel]()
    
    init() {
        searchList = DataBinding()
    }
    
    //MARK:- Public methods
    func search(inputText: String?) {
        guard let inputText = inputText, !inputText.isEmpty else {
            searchList?.value = originalList
            return
        }
    
        searchList?.value = originalList.map({ (model) -> LocationModel? in
            if let username = model.username?.uppercased(), username.contains(inputText.uppercased()) {
                return model
            }
            
            if let notes = model.note?.uppercased(), notes.contains(inputText.uppercased()) {
                return model
            }
            
            return nil
        }).compactMap({$0})
        
    }
    
    func numberOfItems() -> Int {
        return searchList?.value?.count ?? 0
    }
    
    func itemAt(index: Int) -> LocationModel? {
        guard let searchList = searchList?.value, index >= 0 && index < searchList.count else {
            return nil
        }
        return searchList[index]
    }
}
