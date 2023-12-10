//
//  ProductDummyData.swift
//  Assignment27-swiftUI-data-flow
//
//  Created by Luka Gazdeliani on 09.12.23.
//

import SwiftUI

final class ProductsViewModel: ObservableObject {
    @Published var products = [
        Product(name: "Apple", stock: 20, quantity: 0, price: 0.5, image: Image(.apple)),
        Product(name: "Orange", stock: 30, quantity: 0, price: 0.9, image: Image(.orange)),
        Product(name: "Banana", stock: 15, quantity: 0, price: 0.8, image: Image(.banana)),
        Product(name: "Grapes", stock: 20, quantity: 0, price: 0.6, image: Image(.grapes)),
        Product(name: "Carrot", stock: 15, quantity: 0, price: 0.4, image: Image(.carrot)),
        Product(name: "Pear", stock: 30, quantity: 0, price: 0.5, image: Image(.pear)),
        Product(name: "StrawBerry", stock: 40, quantity: 0, price: 0.3, image: Image(.strawberry)),
        Product(name: "Bell Pepper", stock: 20, quantity: 0, price: 0.4, image: Image(.bellPepper)),
        Product(name: "Pepper", stock: 20, quantity: 0, price: 0.4, image: Image(.pepper)),
        Product(name: "Cucumber", stock: 30, quantity: 0, price: 0.6, image: Image(.cucumber)),
        Product(name: "Kiwi", stock: 10, quantity: 0, price: 0.8, image: Image(.kiwi)),
        Product(name: "Grapes", stock: 20, quantity: 0, price: 0.6, image: Image(.grapes)),
        Product(name: "Melon", stock: 10, quantity: 0, price: 2.5, image: Image(.melon)),
        Product(name: "Mushroom", stock: 30, quantity: 0, price: 0.4, image: Image(.mushroom)),
        Product(name: "Onion", stock: 20, quantity: 0, price: 0.6, image: Image(.onion)),
        Product(name: "Pomegranate", stock: 15, quantity: 0, price: 1.5, image: Image(.pomegranate)),
        Product(name: "Tomato", stock: 30, quantity: 0, price: 0.6, image: Image(.tomato)),
        Product(name: "Watermelon", stock: 5, quantity: 0, price: 3.5, image: Image(.watermelon)),
        Product(name: "Potato", stock: 40, quantity: 0, price: 0.5, image: Image(.potato)),
    ]
    
    var totalQuantity: Int {
        products.reduce(0) { partialResult, product in
            partialResult + product.quantity
        }
    }
    
    var totalPrice: Double {
        products.reduce(0) { partialResult, product in
            partialResult + product.price * Double(product.quantity)
        }
    }
    
    func increaseQuantity(product: Product) {
        if product.stock > 0 {
            product.quantity += 1
            product.stock -= 1
        }
    }
    
    func decreaseQuantity(product: Product) {
        if product.quantity > 0 {
            product.quantity -= 1
            product.stock += 1
        }
    }
    
    func applyDiscount() {
        products.map { $0.price *= 0.8 }
    }
    
    func removeDiscount() {
        products.map { $0.price *= 1.25 }
    }
}
