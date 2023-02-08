//
//  InvoiceViewModel.swift
//  MAANOINVOICE
//
//  Created by Mashael Alghunaim on 23/05/1444 AH.
//

import Foundation
class InvoiceViewModel: ObservableObject, Identifiable {
  @Published var invoices: [Invoice]
  private var counter: Int
    struct Invoice: Identifiable {
      let id: Int
      let invoiceNumber: Int
      let date: Date
      let items: [InvoiceItem]
      let total: Double
    }

    struct InvoiceItem: Identifiable {
      let id: String
      let name: String
      let quantity: Int
      let price: Double
    }


  init() {
    self.invoices = []
      self.counter = 0
  }

  func createInvoice( date: Date, items: [InvoiceItem]) {
    let invoiceNumber = counter
    counter += 1
      let total = items.reduce(0) { $0 + $1.quantity * Int($1.price) }
      let invoice = Invoice(id: invoiceNumber, invoiceNumber: invoiceNumber, date: date, items: items, total: Double(total))
    invoices.append(invoice)
  }
}


