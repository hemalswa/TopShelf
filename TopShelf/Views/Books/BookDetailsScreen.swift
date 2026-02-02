//
//  BookDetailsScreen.swift
//  TopShelf
//
//  Created by Hemal Swarnasiri on 2026-02-02.
//

import SwiftUI

struct BookDetailsScreen: View {
  let book: Book
  
  let onGoToRoot: () -> Void
  
  init(
    book: Book,
    onGoToRoot: @escaping () -> Void = { }
  ) {
    self.book = book
    self.onGoToRoot = onGoToRoot
  }
  
  var body: some View {
    VStack {
      Text(book.name)
      Button("Go to Root view") {
        onGoToRoot()
      }
    }
  }
}


#Preview {
  BookDetailsScreen(book: Book(id: 1, name: "Book 1"))
}
