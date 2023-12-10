//
//  ContentView.swift
//  Assignment27-swiftUI-data-flow
//
//  Created by Luka Gazdeliani on 09.12.23.
//

import SwiftUI

struct CartView: View {
    
    //MARK: Properties
    @State private var isTapped = false
    
    @EnvironmentObject var productsViewModel: ProductsViewModel
    
    //MARK: Body
    var body: some View {
        ZStack {
            RoundedRectangle(cornerRadius: 8)
                .frame(height: 100)
                .foregroundStyle(.green.opacity(0.1))
            HStack {
                totalsView
                buttonView
            }
            .padding()
        }
    }
    
    //MARK: Views
    
    //MARK: Total Quantity and Price
    private var totalsView: some View {
        VStack(spacing: 10) {
            HStack {
                Text("Total Quantity: \(productsViewModel.totalQuantity)")
                    .bold()
                    .font(.system(size: 20))
                Spacer()
            }
            HStack {
                Text("Total Price: $\(String(format: "%.2f", productsViewModel.totalPrice))")
                    .bold()
                    .font(.system(size: 20))
                Spacer()
            }
        }
    }
    
    //MARK: Discount Button
    private var buttonView: some View {
        if !isTapped {
            Button {
                isTapped = true
                productsViewModel.applyDiscount()
            } label: {
                Text("-20%")
            }
            .buttonStyle(BorderedButtonStyle())
        } else {
            Button {
                isTapped = false
                productsViewModel.removeDiscount()
            } label: {
                Text("Original Price")
            }
            .buttonStyle(BorderedButtonStyle())
        }
    }
}

#Preview {
    CartView()
}
