//
//  AddCoffeeOrderView.swift
//  PedidodeCafe
//
//  Created by Erasmo  on 11/09/24.
//

import SwiftUI

struct AddCoffeeOrderView: View {
    
    @ObservedObject private var addCoffeeOrderVM = AddCoffeeOrderViewModel(webservice: Webservice())
    
    var body: some View {
        NavigationView {
            VStack {
                Form {
                    Section(header: Text("INFORMATION").font(.body)) {
                        TextField("Enter name", text: self.$addCoffeeOrderVM.name)
                    }
                    
                    Section(header: Text("SELECT COFFEE").font(.body)) {
                        ForEach(addCoffeeOrderVM.coffeeList, id: \.name) { coffee in
                            CoffeeCellView(coffee: coffee, selection: self.$addCoffeeOrderVM.coffeeName)
                        }
                    }
                    
                    Section(header: Text("SELECT COFFEE").font(.body), footer: Text("total")) {
                        Picker("", selection: self.$addCoffeeOrderVM.size) {
                            Text("Small").tag("Small")
                            Text("Medium").tag("Medium")
                            Text("Large").tag("Large")
                        }.pickerStyle(SegmentedPickerStyle())
                    }
                }
                
                HStack {
                    Button("Place Order"){
                        
                    }
                }.padding(EdgeInsets(top: 12, leading: 100, bottom: 12, trailing: 100))
                    .foregroundColor(.white)
                    .background(.green)
                    .cornerRadius(12)
            }
            .navigationTitle("Add Order")
        }
    }
}

#Preview {
    AddCoffeeOrderView()
}

struct CoffeeCellView: View {
    let coffee: CoffeeViewModel
    @Binding var selection: String
    
    var body: some View {
        HStack {
            Image(coffee.imageURL)
                .resizable()
                .frame(width: 100, height: 100)
                .cornerRadius(16)
            Text(coffee.name)
                .font(.title)
                .padding([.leading], 20)
            Spacer()
            Image(systemName: self.selection == self.coffee.name ? "checkmark": "").padding()
        }.onTapGesture {
            self.selection = self.coffee.name
        }
    }
}
