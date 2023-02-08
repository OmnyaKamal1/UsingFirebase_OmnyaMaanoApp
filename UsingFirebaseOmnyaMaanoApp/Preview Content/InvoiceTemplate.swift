////
////  InvoiceTemplate.swift
////  MAANOINVOICE
////
////  Created by Mashael Alghunaim on 17/05/1444 AH.
////
///
///
import SwiftUI
struct InvoiceTemplate: View {
@State private var name = ""
@State private var address = ""
@State private var item1 = ""
@State private var item1Price = 0.0
@State private var item2 = ""
@State private var item2Price = 0.0
@State private var item3 = ""
@State private var item3Price = 0.0
@State private var quantity1 = ""
@State private var quantity2 = ""
@State private var quantity3 = ""
@State private var quantity4 = ""
@State private var quantity5 = ""
@State private var item4 = ""
@State private var item5 = ""
@State private var item4Price = 0.0
@State private var item5Price = 0.0
@State public var items = [Itemm]()
@State private var newItemName = ""
@State private var newItemQuantity = 1
@State private var newItemPrice = 0.0
@State private var phoneNumber = ""
@State private var email = ""
@State private var customerName = ""
@State private var customerAddress = ""
@State private var customerPhoneNumber = ""
@State private var customerEmail = ""
@State var PDFUrl: URL?
@State var showShareSheet: Bool = false
 

var body: some View {
VStack{
Spacer()
Spacer()
Spacer()
Spacer()
InvoiceView(invoice: invoiceModel).padding(.leading, 50)
Form {
    Section(header: Text("المعلومات الشخصية:").padding(.trailing, -25)) {
HStack{
TextField("ادخل الاسم", text: $name)
Text("الاسم")
}
HStack{
TextField("العنوان", text: $address)
Text("العنوان")

}
HStack{
    TextField(" رقم الهاتف", text: $phoneNumber)
Text("رقم الهاتف")
}
HStack{
TextField("الإيميل", text: $email)
Text("الإيميل")
}
}.padding(.leading, 200 )

Section(header: Text("حررت الفاتورة إلى:").padding(.leading, 50)){
HStack{
TextField("اسم العميل", text: $customerName)
Text("اسم العميل")
}
HStack{
TextField("العنوان", text: $customerAddress)
Text("العنوان")
}
HStack{
TextField(" رقم الهاتف", text: $customerPhoneNumber)
Text("رقم الهاتف")
}
HStack{
TextField("الإيميل", text: $customerEmail)
Text("الإيميل")
}
}.padding(.leading, 170 )

ForEach([items] , id:\.self) { (items)
in

    Section(header: Text("وصف الفاتورة:").padding(.leading, 220.0)) {
HStack {
    TextField("السعر", value: $item1Price, formatter: NumberFormatter())
    Spacer()
    Spacer()
    TextField("الكمية", text: $quantity1)
    Spacer()
    TextField("الغرض", text: $item1)
}
HStack {
    TextField("السعر", value: $item2Price, formatter: NumberFormatter())
    Spacer()
    Spacer()
    TextField("الكمية", text: $quantity2)
    Spacer()
    TextField("الغرض", text: $item2)
}
HStack {
    TextField("السعر", value: $item3Price, formatter: NumberFormatter())
    Spacer()
    Spacer()
    TextField("الكمية", text: $quantity3)
    Spacer()
    TextField("الغرض", text: $item3)
}
HStack {
    TextField("السعر", value: $item4Price, formatter: NumberFormatter())
    Spacer()
    Spacer()
    TextField("الكمية", text: $quantity4)
    Spacer()
    TextField("الغرض", text: $item4)
}
HStack {
    TextField("السعر", value: $item5Price, formatter: NumberFormatter())
    Spacer()
    Spacer()
    TextField("الكمية", text: $quantity5)
    Spacer()
    TextField("الغرض", text: $item5)
}

}.padding(.leading)


Section(header: Text("المجموع")) {
Text("$\(totalAmount, specifier: "%.2f")")
}.padding(.trailing, 260)
}.onDelete {
index in deleteItem(at: index)
if index.contains(0) {
item1Price = 0
} else if index.contains(1) {
item2Price = 0
} else if index.contains(2) {
item3Price = 0
} else if index.contains(3) {
item4Price = 0
} else if index.contains(4) {
item5Price = 0
}
}
HStack{
Text("شكرا لتعاملكم معنا!").padding(.leading, 100)
}
}
}


}
var totalAmount: Double {
get {
return  item1Price + item2Price + item3Price + item4Price + item5Price
}
set {
newItemPrice = newValue - item1Price - item2Price - item3Price
}
}

private func deleteItem(at indexSet: IndexSet){
self.items.remove(atOffsets: indexSet)

}
}


struct invoiceTemplate_Previews: PreviewProvider {
static var previews: some View {
InvoiceTemplate()

}
}



func saveInvoiceTemplate(_ template: String) {
print("Saving invoice template")
    // Get the document directory
    let documentsDirectory = FileManager.default.urls(for: .documentDirectory, in: .userDomainMask)[0]

    // Create a file URL for the invoice template
    let fileURL = documentsDirectory.appendingPathComponent("invoice.txt")
print(fileURL)
    // Write the invoice template to the file
    do {
    
        try template.write(to: fileURL, atomically: true, encoding: .utf8)
    print(template)
    } catch {
        // Handle the error
        print("Error saving invoice template: \(error)")
    }
}



