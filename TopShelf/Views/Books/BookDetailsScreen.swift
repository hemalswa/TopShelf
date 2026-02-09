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
      VStack(spacing: 24) {

          VStack(spacing: 12) {
              Image(systemName: "book.fill")
                  .font(.system(size: 48))
                  .foregroundColor(.accentColor)

              Text(book.name)
                  .font(.title)
                  .fontWeight(.semibold)
          }
          .padding()
          .frame(maxWidth: .infinity)
          .background(
              RoundedRectangle(cornerRadius: 16)
                  .fill(Color(.systemBackground))
                  .shadow(radius: 4)
          )
          Spacer()
      }
      .padding(.top, 24)
      .padding(.horizontal)
      .navigationTitle("Book Details")
      .navigationBarTitleDisplayMode(.inline)
      .toolbar {
          ToolbarItem(placement: .navigationBarTrailing) {
              Button {
                  onGoToRoot()
              } label: {
                  Image(systemName: "house.fill")
              }
          }
      }
  }

}


#Preview {
  BookDetailsScreen(book: Book(id: 1, name: "Book 1"))
}
