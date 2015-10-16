//
//  SectionInfo.swift
//  DiSanFangKu
//
//  Created by xly on 15/9/24.
//  Copyright (c) 2015年 Lily. All rights reserved.
//

import Foundation

// 定义了分节表头的一系列属性、方法
class SectionInfo: NSObject {
    var open: Bool!
    var play: Play!
    var headerView: SectionHeaderView!
    
    var rowHeights = NSMutableArray()
    
    func countOfRowHeights() -> Int {
        return self.rowHeights.count
    }
    
    func objectInRowHeightsAtIndex(idx: Int) -> AnyObject {
        return self.rowHeights[idx]
    }
    
    func insertObject(anObject: AnyObject, inRowHeightsAtIndex: Int) {
        self.rowHeights.insertObject(anObject, atIndex: inRowHeightsAtIndex)
    }
    
    func insertRowHeights(rowHeightArray: NSArray, atIndexes: NSIndexSet) {
        self.rowHeights.insertObjects(rowHeightArray as [AnyObject], atIndexes: atIndexes)
    }
    
    func removeObjectFromRowHeightsAtIndex(idx: Int) {
        self.rowHeights.removeObjectAtIndex(idx)
    }
    
    func removeRowHeightsAtIndexes(indexes: NSIndexSet) {
        self.rowHeights.removeObjectsAtIndexes(indexes)
    }
    
    func replaceObjectInRowHeightsAtIndex(idx: Int, withObject: AnyObject) {
        self.rowHeights[idx] = withObject
    }
    
    func replaceRowHeightsAtIndexes(indexes: NSIndexSet, withRowHeight: NSArray) {
        self.rowHeights.replaceObjectsAtIndexes(indexes, withObjects: withRowHeight as [AnyObject])
    }
}