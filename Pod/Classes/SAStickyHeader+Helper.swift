//
//  SAStickyHeaderView+Helper.swift
//  SAStickyHeaderExample
//
//  Created by shams ahmed on 07/11/2015.
//  Copyright © 2015 SA. All rights reserved.
//

import Foundation

// Source: http://www.alloc-init.com/2015/10/if-let-assignment/
infix operator ?= { associativity right precedence 90 }

internal func ?=<T>(inout left: T, right: T?) {
    if let value = right {
        left = value
    }
}

internal func ?=<T>(inout left: T?, right: T?) {
    if let value = right {
        left = value
    }
}
