//
//  RecipeService.swift
//  RecipleaseP10
//
//  Created by Alexandre NYS on 16/04/2021.
// Copyright © 2020 Alexandre NYS. All rights reserved.

import Foundation
import Alamofire
// The recipe service will perform our requests to the edamam API 
class RecipeService {
    
    // MARK: - Properties
       static var shared = RecipeService()
       private init() {}
       
       // MARK: - Internal functions
       func getRecipes(for ingredients: [String], callback: @escaping (Bool, Recipes?) -> Void) {
        let ingredientsParameter = ["app_key":ApiKey.key,
                                    "app_id": ApiKey.id,
                                       "q": ingredients.joined(separator: ",")]
           
        AF.request(ServiceUrl.endpoint, method: .get, parameters: ingredientsParameter)
               .validate(contentType: ["application/json"])
               .responseJSON { response in
                   guard let data = response.data else {
                       return
                   }
                   do {
                       let decoder = JSONDecoder()
                       let recipes = try decoder.decode(Recipes.self, from: data)
                       callback(true, recipes)
                   } catch {
                       callback(false, nil)
                   }
           }
       }
       
       func getImage(url: String, callback: @escaping ((UIImage?) -> Void)) {
           AF.download(url).responseData { response in
               if let data = response.value {
                   let image = UIImage(data: data)
                   callback(image)
               }
           }
       }
}
