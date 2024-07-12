import Cocoa

enum InventoryError: Error {
  case outOfStock, invalidCategory, expiredProduct
}

extension String {
 
  func isValidCategory() -> Bool {
    let categories = ["Electronics", "Groceries", "Clothing"]
    if categories.contains(self) {
      return true
    }
    return false
  }
}

protocol Discountable {
  func applyDiscount(_ percentage: Double)
}

class Product: Discountable {
  let name: String
  let category: String
  var price: Double
  let quantity: Int
  
  init(name: String, category: String, price: Double, quantity: Int) {
    self.name = name
    self.category = category
    self.price = price
    self.quantity = quantity
  }
  
  func applyDiscount(_ percentage: Double) {
     let discountedPrice = price * (percentage / 100)
    price -= discountedPrice
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
  func sellProduct(_ product: PerishableProduct, quantity: Int) throws {
    
    let categories = ["Electronics", "Groceries", "Clothing"]
    
    if product.quantity < quantity {
      throw InventoryError.outOfStock
    }
    
    if !categories.contains(product.category) {
      throw InventoryError.invalidCategory
    }
    
    let currentDate = Date()
    if product.expirationDate < currentDate {
      throw InventoryError.expiredProduct
    }
  }
}

class Box<T> {
   var items: [T] = []
  
  func addItems(_ item: T) {
    items.append(item)
  }
  
  func removeItem() -> T? {
    return items.isEmpty ?  nil : items.removeLast()
  }

}


