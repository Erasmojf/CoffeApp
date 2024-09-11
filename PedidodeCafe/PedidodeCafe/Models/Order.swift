//
//  Order.swift
//  PedidodeCafe
//
//  Created by Erasmo  on 05/09/24.
//

import Foundation

struct Order: Codable {
    let name: String
    let size: String
    let coffeeName: String
    let total: Double
}
