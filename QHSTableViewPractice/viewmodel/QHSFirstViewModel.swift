//
//  QHSFirstViewModel.swift
//  QHSTableViewPractice
//
//  Created by david on 2017/3/24.
//  Copyright © 2017年 Charles. All rights reserved.
//

import UIKit

class QHSFirstViewModel: NSObject {

    private(set) var arrCellViewModels: Array<QHSFirstCellViewModel> = []
    
    func updateViewModel() {
        for _ in 0..<10 {
            arrCellViewModels.append(QHSFirstCellViewModel().updateViewModel())
        }
    }
    
    
}

class QHSFirstCellViewModel: NSObject {
    
    private(set) var isExpand: Bool = false

    func updateViewModel() -> QHSFirstCellViewModel {
        return self
    }
    
    func updateExpandStatus() {
        self.isExpand = !self.isExpand
    }

}
