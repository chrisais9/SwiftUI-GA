//
//  Route.swift
//  SwiftUI-GA
//
//  Created by 구형모 on 2021/12/12.
//

import SwiftUI

class Route {
    let cities: [City]
    
    var _distance: CGFloat?
    var distance: CGFloat {
        if _distance == nil {
            _distance = calculateDistance()
        }
        return _distance ?? 0.0
    }
    
    init(cities: [City]) {
        self.cities = cities
    }
    
    private func calculateDistance() -> CGFloat {
        var result: CGFloat = 0.0
        var previousCity: City?
        
        cities.forEach { (city) in
            if let previous = previousCity {
                result += previous.distance(to: city)
            }
            previousCity = city
        }
        
        guard let first = cities.first, let last = cities.last else { return result }
        
        return result + first.distance(to: last)
    }
    
    func fitness(withTotalDistance totalDistance: CGFloat) -> CGFloat {
        return 1 - (distance / totalDistance)
    }
}
