//
//  ContentView.swift
//  PedidodeCafe
//
//  Created by Erasmo  on 05/09/24.
//

import SwiftUI

struct ContentView: View {
  @ObservedObject private var orderListVM = OrderListViewModel()
    
    @State private var showModal: Bool = false
    
    var body: some View {
        NavigationView {
            OrderListView(orders: self.orderListVM.orders)
                .navigationTitle("Coffee Orders")
                .navigationBarItems(leading: Button(action: reloadOrders) {
                    Image(systemName: "arrow.clockwise")
                        .foregroundColor(.white)
                }, trailing: Button(action: showAddCoffeOrderView) {
                    Image(systemName: "plus")
                        .foregroundColor(.white)
                })
            
                .sheet(isPresented: self.$showModal) {
                    AddCoffeeOrderView(isPresented: self.$showModal)
                }
        }
    }
    
    private func reloadOrders() {
        self.orderListVM.fetchOrders()
    }
    
    private func showAddCoffeOrderView() {
        self.showModal = true
    }
}

#Preview {
    ContentView()
}
