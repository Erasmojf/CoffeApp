//
//  OrderTotalView.swift
//  PedidodeCafe
//
//  Created by Erasmo  on 12/09/24.
//

import SwiftUI

struct OrderTotalView: View {
    let total: Double
    
    var body: some View {
        HStack(alignment: .center) {
            Spacer()
            Text(String(format: "$%.2f", self.total)).font(.title)
                .foregroundColor(.green)
                Spacer()
        }.padding(10)
    }
}

#Preview {
    OrderTotalView(total: 45.67)
}
