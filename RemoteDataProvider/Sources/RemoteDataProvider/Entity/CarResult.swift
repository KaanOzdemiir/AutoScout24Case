//
//  CarResult.swift
//  
//
//  Created by Kaan Ozdemir on 12.03.2023.
//

import Foundation

public struct CarResult: Decodable {
    public var id: Int?
    public var make, model: String?
    public var price: Int?
    public var firstRegistration: String?
    public var mileage: Int?
    public var fuel: String?
    public var images: [CarImage]?
    public var description: String?
    public var modelline: String?
    public var seller: Seller?
    public var colour: String?
}

// MARK: - Image
public struct CarImage: Decodable {
    public var url: String
}

// MARK: - Seller
public struct Seller: Decodable {
    public var type, phone, city: String
}
