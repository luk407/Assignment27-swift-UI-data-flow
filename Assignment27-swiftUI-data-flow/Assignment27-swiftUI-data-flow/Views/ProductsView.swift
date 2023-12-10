//
//  ProductsView.swift
//  Assignment27-swiftUI-data-flow
//
//  Created by Luka Gazdeliani on 09.12.23.
//

import SwiftUI

struct ProductsView: View {
    
    //MARK: Properties
    @ObservedObject private var productsViewModel = ProductsViewModel()
    
    //MARK: Body
    var body: some View {
        VStack {
            HStack {
                Text("Grocery Shop")
                    .bold()
                    .font(.system(size: 30))
                Spacer()
            }
            
            List {
                ForEach(productsViewModel.products) { product in
                    HStack {
                        productImageView(product)
                        productInfoView(product)
                        quantityChangerView(product)
                    }
                    .listRowSeparator(.hidden)
                    .listRowBackground(
                        RoundedRectangle(cornerRadius: 8)
                            .fill(.blue.opacity(0.1))
                            .padding(.vertical, 5))
                }
                .onDelete { index in
                    productsViewModel.products.remove(atOffsets: index)
                }
            }
            .listStyle(.plain)
            
            CartView()
                .environmentObject(productsViewModel)
        }
        .padding()
    }
    
    //MARK: Views
    
    //MARK: Product Image
    func productImageView(_ product: Product) -> some View {
        product.image
            .resizable()
            .frame(width: 60, height: 60)
    }
    
    //MARK: Product Name and Price
    func productInfoView(_ product: Product) -> some View {
        VStack(spacing: 10, content: {
            HStack {
                Text("\(product.name)")
                Spacer()
            }
            HStack {
                Text("Price: $\(String(format: "%.2f", product.price))")
                Spacer()
            }
        })
    }
    
    //MARK: Product Quantity with Increase&Decrease Buttons
    func quantityChangerView(_ product: Product) -> some View {
        HStack(spacing: 10, content: {
            Button {
                productsViewModel.decreaseQuantity(product: product)
            } label: {
                Image(systemName: "minus")
            }
            .buttonStyle(BorderedButtonStyle())
            
            Text("\(product.quantity)")
            
            Button {
                productsViewModel.increaseQuantity(product: product)
            } label: {
                Image(systemName: "plus")
            }
            .buttonStyle(BorderedButtonStyle())
        })
        .frame(width: 130)
    }
}

#Preview {
    ProductsView()
}
