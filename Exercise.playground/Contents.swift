import Cocoa

enum InventoryError: Error {
  case outOfStock, invalidCategory, expiredProduct
}

extension String {
  
}

protocol Discountable {
  func applyDiscount(_ percentage: Double)
}

class Product: Discountable {
  let name: String
  let category: String
  let price: Double
  let quantity: Int
  
  init(name: String, category: String, price: Double, quantity: Int) {
    self.name = name
    self.category = category
    self.price = price
    self.quantity = quantity
  }
  
  func applyDiscount(_ percentage: Double) {
    
  }
  
  func productInfo() -> String {
    "it's a \(name) from \(category) with \(price) and \(quantity)"
  }
  
  
}


class PerishableProduct: Product {
  
  let expirationDate: Date
  
  init(expirationDate: Date, name: String, category: String, price: Double, quantity: Int) {
    self.expirationDate = expirationDate
    super.init(name: name, category: category, price: price, quantity: quantity)
  }
  
  override func applyDiscount(_ percentage: Double) {
    
  }
  
  override func productInfo() -> String {
    "it's a \(name) from \(category) with \(price) and \(quantity)"
  }
}


class InventoryManager {
  func sellProduct(_ product: Product, quantity: Int) throws {
    
  }
}

class Box<T> {
  let prod
}
