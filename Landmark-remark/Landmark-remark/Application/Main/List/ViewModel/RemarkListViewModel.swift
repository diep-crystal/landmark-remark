//
//  RemardListViewModel.swift
//  Landmark-remark
//
//  Created by Diep Nguyen on 3/28/19.
//  Copyright © 2019 Diep Nguyen. All rights reserved.
//

final class RemarkListViewModel {

    var objectList: DataBinding<[LocationModel]>?
    
    init() {
        objectList = DataBinding()
    }
    
    func numberOfItems() -> Int {
        return objectList?.value?.count ?? 0
    }
    
    func itemAt(index: Int) -> LocationModel? {
        
        guard let items = objectList?.value, index >= 0 && index < items.count else {
            return nil
        }
        
        return items[index]
    }
}
