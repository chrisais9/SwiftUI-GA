//
//  City.swift
//  SwiftUI-GA
//
//  Created by 구형모 on 2021/12/12.
//

import SwiftUI

struct City: Equatable {
    
    let location: CGPoint
    
    func distance(to: City) -> CGFloat {
        return sqrt(pow(to.location.x - self.location.x, 2) + pow(to.location.y - self.location.y, 2))
    }
    
    static func ==(lhs: City, rhs: City) -> Bool {
        return lhs.location == rhs.location
    }
}
