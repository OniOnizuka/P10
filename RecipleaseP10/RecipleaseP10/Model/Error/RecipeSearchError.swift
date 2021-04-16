//
//  RecipeSearchError.swift
//  RecipleaseP10
//
//  Created by Alexandre NYS on 16/04/2021.
// Copyright © 2020 Alexandre NYS. All rights reserved.

import Foundation
// An enum for the error that can occur during the search for a recipe by the user
enum RecipeSearchError: Error {
    
    case noIngredients
    case noFavorite
    case noResults
    
    var errorDescription: String {
        return "Oups !"
    }
    
    var failureReason: String {
        switch self {
        case .noIngredients:
            return "Without ingredients, no recipes !"
        case .noFavorite:
            return "You have no recipe in your favorite list at the time."
        case .noResults:
            return "No recipes found, make sure you wrote your ingredients in english, check for misspelling and try again."
        }
    }
}
