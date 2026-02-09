//
//  HomeScreen.swift
//  TopShelf
//
//  Created by Hemal Swarnasiri on 2026-02-02.
//

import SwiftUI

enum PricingType: String, CaseIterable, Identifiable, Codable {
  case free = "Free"
  case paid = "Paid"
  
  var id: String { rawValue }
}

struct HomeScreen: View {
  
  @State private var selectedPricing: PricingType = .free
  
  @State private var path: NavigationPath = NavigationPath()
  
  // Persists navigation state across app launches.
  // In production, scope this carefully to avoid restoring invalid flows.
  @AppStorage("navigation_path")
  private var storedPathData: Data = Data()
  
  var body: some View {
    NavigationStack(path: $path) {
      
      VStack(spacing: 16) {
          
          Picker("Pricing", selection: $selectedPricing) {
              ForEach(PricingType.allCases) { pricing in
                  Text(pricing.rawValue)
                      .tag(pricing)
              }
          }
          .pickerStyle(.segmented)
          
          VStack(spacing: 24) {
              Button {
                  path.append(Route.podcasts(.list(pricing: selectedPricing)))
              } label: {
                  Label("Show Podcasts", systemImage: "mic.fill")
              }
              .buttonStyle(.borderedProminent)
              
              Button {
                  path.append(Route.books(.list(pricing: selectedPricing)))
              } label: {
                  Label("Show Books", systemImage: "book.fill")
              }
              .buttonStyle(.bordered)
          }
          .padding(.top, 24)
          
          Spacer()
      }
      .navigationTitle("Home")
      .navigationBarTitleDisplayMode(.inline)
      .padding()
      .navigationDestination(for: Route.self) { route in
        destination(for: route)
      }
    }
    .onChange(of: path) { newValue in
      guard !newValue.isEmpty else {
        storedPathData = Data()
        return
      }
      
      if let data = try? JSONEncoder().encode(newValue.codable) {
        storedPathData = data
      }
      
    }
    .onAppear {
      guard !storedPathData.isEmpty else { return }
      
      do {
        let decoded = try JSONDecoder().decode(
          NavigationPath.CodableRepresentation.self,
          from: storedPathData
        )
        path = NavigationPath(decoded)
      } catch {
        storedPathData = Data()
        path = NavigationPath()
      }
    }
  }
  
  // Centralized navigation handling
  @ViewBuilder
  private func destination(for route: Route) -> some View {
    switch route {
      
    case .podcasts(let podcastsRoute):
      switch podcastsRoute {
      case .list(let pricing):
        PodcastsScreen(pricing: pricing) { podcast in
          path.append(Route.podcasts(.detail(podcast: podcast)))
        }
        
      case .detail(let podcast):
        PodcastDetailsScreen(podcast: podcast) {
          path = NavigationPath()
        }
      }
      
    case .books(let booksRoute):
      switch booksRoute {
      case .list(let pricing):
        BooksScreen(pricing: pricing) { book in
          path.append(Route.books(.detail(book: book)))
        }
        
      case .detail(let book):
        BookDetailsScreen(book: book) {
          path = NavigationPath()
        }
      }
    }
  }
}


#Preview {
  HomeScreen()
}
