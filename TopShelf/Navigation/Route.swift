//
//  Route.swift
//  TopShelf
//
//  Created by Hemal Swarnasiri on 2026-02-02.
//

import Foundation

enum Route: Hashable, Codable {
  
  case podcasts(PodcastsRoute)
  case books(BooksRoute)
  
  enum PodcastsRoute: Hashable, Codable {
    case list(pricing: PricingType)
    case detail(podcast: Podcast)
  }
  
  enum BooksRoute: Hashable, Codable {
    case list(pricing: PricingType)
    case detail(book: Book)
  }
}
