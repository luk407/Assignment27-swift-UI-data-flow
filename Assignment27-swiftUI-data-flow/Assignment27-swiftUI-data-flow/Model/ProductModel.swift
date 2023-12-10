//
//  ProductModel.swift
//  Assignment27-swiftUI-data-flow
//
//  Created by Luka Gazdeliani on 09.12.23.
//

import SwiftUI

@Observable
final class Product: Identifiable, ObservableObject {
    var id = UUID()
    let name: String
    var stock: Int
    var quantity: Int
    var price: Double
    let image: Image
    
    init(id: UUID = UUID(), name: String, stock: Int, quantity: Int, price: Double, image: Image) {
        self.id = id
        self.name = name
        self.stock = stock
        self.quantity = quantity
        self.price = price
        self.image = image
    }
}
