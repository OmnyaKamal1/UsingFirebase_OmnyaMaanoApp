//
//  InvoiceView.swift
//  MAANOINVOICE
//
//  Created by Mashael Alghunaim on 22/05/1444 AH.
//

import SwiftUI

struct Invoice: Identifiable {
  let id: Int
  let invoiceNumber: Int
  let date: Date
    var items: [InvoiceeItem]
    var total: Double
}

struct InvoiceeItem: Identifiable, Equatable {
  let id: String
  let name: String
  let quantity: Int
  let price: Double
}
struct Itemm: Identifiable, Hashable {
var id = UUID()
var name: String
var quantity: Int
var price: Double
}
struct InvoiceView: View {
  let invoice: Invoice
    @State private var showInvoiceTemplate = false
    private let dateFormatter: DateFormatter = {
        let formatter = DateFormatter()
        formatter.dateStyle = .medium
        return formatter
    }()

    var body: some View {

        VStack {
            HStack{
                Button(action: {
                    self.showInvoiceTemplate.toggle()
                }){
                    Text("Save").padding()
                }
                .fullScreenCover(isPresented: $showInvoiceTemplate, onDismiss: {
                    
                }, content: {
                    Addinvoice()
                })
               
               
                
                Spacer()
                VStack{
                    HStack {
                        Text("\(invoice.invoiceNumber)")
                        Text("فاتورة رقم #:")
                    }.padding()
                    
                    HStack {
                        Text("\(invoice.date, formatter: dateFormatter)")
                        Text("التاريخ:")
                    }
                    //            ForEach(invoice.items) { item in
                    //                HStack {
                    //                    Text(item.name)
                    //                    Text("\(item.quantity)")
                    //                    Text("\(item.price)")
                    //                    Text("\(Double(item.quantity) * item.price)")
                    //                }
                    //            }
                    
                } .multilineTextAlignment(.trailing)
            }
        }
    }
}

let invoiceModel = Invoice(id: 0, invoiceNumber: 0, date: Date(), items: [], total: 0.0)

struct InvoiceView_Previews: PreviewProvider {
    static var previews: some View {
        InvoiceView(invoice: invoiceModel)
    }
}


extension Invoice {
    mutating func addItem(item: Itemm) {
           let invoiceItem = InvoiceeItem(id: item.id.uuidString, name: item.name, quantity: item.quantity, price: item.price)
           items.append(invoiceItem)
           total += invoiceItem.price * Double(invoiceItem.quantity)
        
       }
    mutating func deleteItem(item: InvoiceeItem) {
           if let index = items.firstIndex(of: item) {
               items.remove(at: index)
               total -= item.price * Double(item.quantity)
           }
       }
}
