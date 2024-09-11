//
//  ContentView.swift
//  PedidodeCafe
//
//  Created by Erasmo  on 05/09/24.
//

import SwiftUI

struct ContentView: View {
  @ObservedObject private var orderListVM = OrderListViewModel()
    
    var body: some View {
        NavigationView {
            OrderListView(orders: self.orderListVM.orders)
                .navigationTitle("Coffe Orders")
        }
    }
}

#Preview {
    ContentView()
}
