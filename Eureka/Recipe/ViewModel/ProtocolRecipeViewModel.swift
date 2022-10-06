//
//  ProtocolRecipeViewModel.swift
//  Eureka
//
//  Created by 김민령 on 2022/10/06.
//

import Foundation
import Moya

protocol RecipeViewModelProtocol: ObservableObject {
    var recipe : [Recipe]? { get set }
    var recipeNetwork : Response { get set }
    func getRecipe()
}
