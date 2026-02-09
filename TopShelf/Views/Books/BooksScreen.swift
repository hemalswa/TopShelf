//
//  BooksScreen.swift
//  TopShelf
//
//  Created by Hemal Swarnasiri on 2026-02-02.
//

import SwiftUI

struct BooksScreen: View {
  let pricing: PricingType
  
  let onSelectBook: (Book) -> Void
  
  private let books: [Book] = [
    Book(id: 1, name: "Book 1"),
    Book(id: 2, name: "Book 2")
  ]
  
  init(
    pricing: PricingType,
    onSelectBook: @escaping (Book) -> Void = { _ in }
  ) {
    self.pricing = pricing
    self.onSelectBook = onSelectBook
  }
  
  var body: some View {
      List(books) { book in
          Button {
              onSelectBook(book)
          } label: {
              HStack(spacing: 12) {
                  Image(systemName: "book.fill")
                  
                  Text(book.name)
                  
                  Spacer()
                  
                  Image(systemName: "chevron.right")
                      .foregroundColor(.secondary)
              }
              .padding(.vertical, 6)
          }
      }
      .navigationTitle("\((pricing == .free ? "Free Books" : "Premium Books"))")
  }

}


#Preview {
  BooksScreen(pricing: .free)
}
