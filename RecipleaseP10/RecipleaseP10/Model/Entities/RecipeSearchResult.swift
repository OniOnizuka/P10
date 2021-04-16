//
//  Recipe.swift
//  RecipleaseP10
//
//  Created by Alexandre NYS on 16/04/2021.
// Copyright © 2020 Alexandre NYS. All rights reserved.

import Foundation

// Decodable objects to parse the JSON data received by the API

struct RecipeSearchResult: Decodable {
    let hits: [Hit]
}

struct Hit: Decodable {
    let recipe: Recipes
}

struct Recipes: Decodable {
    let label: String
    let image: String
    let url: String
    let yield: Float?
    let ingredientLines: [String]
    let totalTime: Float?
}
