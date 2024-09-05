//
//  OrderListViewModel.swift
//  PedidodeCafe
//
//  Created by Erasmo  on 05/09/24.
//

import Foundation

class OrderListViewModel: ObservableObject {
    @Published var orders = [OrderViewModel]()
    
    init() { fetchOrders() }
    
    func fetchOrders() {
        Webservice().getAllOrders { orders in
            if let orders = orders {
                self.orders = orders.map(OrderViewModel.init)
            }
        }
    }
}

class OrderViewModel {
    let id = UUID()
    
    var order: Order
    
    init(order: Order) {
        self.order = order
    }
    
    var name: String {
        return self.order.name
    }
    
    var size: String {
        return self.order.size
    }
    
    var coffeName: String {
        return self.order.coffeName
    }
    
    var total: Double {
        return self.order.total
    }
}
