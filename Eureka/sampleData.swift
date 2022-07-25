
class ReplaceRecipe {
    var recipe = [Recipe]()
    
    func getRecipes() -> [Recipe]{
        return recipe
    }
    
    init(){
        recipe.append(Recipe(id: 1, name: "순두부찌개", image: "stanford_iOS", isLike: true, ownIngredientList: own, replaceIngredient: replace, expireIngredient: nil, recipeSequenceList: seq))
        recipe.append(Recipe(id: 2, name: "단호박죽", image: "stanford_iOS", isLike: true, ownIngredientList: own, replaceIngredient: replace, expireIngredient: nil, recipeSequenceList: seq))
        recipe.append(Recipe(id: 3, name: "인도카레", image: "stanford_iOS", isLike: true, ownIngredientList: own, replaceIngredient: replace, expireIngredient: nil, recipeSequenceList: seq))
    }
}

let own = [
    Ingredient(id: 1, name: "재료1", icon: "tmpLogo"),
    Ingredient(id:2, name: "재료2", icon: "tmpLogo"),
    Ingredient(id:3, name: "재료3", icon: "tmpLogo"),
    Ingredient(id:4, name: "재료4", icon: "tmpLogo")
]

let replace = ReplaceIngredient(missingIngredient: Ingredient(id: 8, name: "재료8", icon: "tmpLogo"), ownIngredient: Ingredient(id: 1, name: "재료1", icon: "tmpLogo"), Similarity: 88)

let seq = [
    RecipeSequence(number: 1, Content: "이렇게 하세요", hightlightIndexList: nil),
    RecipeSequence(number: 2, Content: "저렇게 하세요", hightlightIndexList: nil),
    RecipeSequence(number: 3, Content: "요렇게 하세요", hightlightIndexList: nil)
]

class ExpireDataRecipe {
    
    var recipe = [Recipe]()
    
    func getRecipes() -> [Recipe]{
        return recipe
    }
    
    init(){
        recipe.append(Recipe(id: 1, name: "순두부찌개", image: "stanford_iOS", isLike: true, ownIngredientList: own, replaceIngredient: nil, expireIngredient: own[0], recipeSequenceList: seq))
        recipe.append(Recipe(id: 2, name: "단호박죽", image: "stanford_iOS", isLike: true, ownIngredientList: own, replaceIngredient: nil, expireIngredient: own[1], recipeSequenceList: seq))
        recipe.append(Recipe(id: 3, name: "인도카레", image: "stanford_iOS", isLike: true, ownIngredientList: own, replaceIngredient: nil, expireIngredient: own[2], recipeSequenceList: seq))
    }
    
    let own = [
        Ingredient(id: 1, name: "재료1", icon: "tmpLogo"),
        Ingredient(id:2, name: "재료2", icon: "tmpLogo"),
        Ingredient(id:3, name: "재료3", icon: "tmpLogo"),
        Ingredient(id:4, name: "재료4", icon: "tmpLogo")
    ]

    let seq = [
        RecipeSequence(number: 1, Content: "이렇게 하세요", hightlightIndexList: nil),
        RecipeSequence(number: 2, Content: "저렇게 하세요", hightlightIndexList: nil),
        RecipeSequence(number: 3, Content: "요렇게 하세요", hightlightIndexList: nil)
    ]
}
