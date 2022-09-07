

let ingredients = [
    Ingredient(id: 1, name: "야채", icon: "tmpLogo"),
    Ingredient(id: 2, name: "시러", icon: "tmpLogo"),
    Ingredient(id: 13, name: "고기", icon: "tmpLogo")
]

let replaced = ReplaceIngredient(missingIngredient: Ingredient(id: 1, name: "하누", icon: "tmpLogo"), ownIngredient: Ingredient(id: 1, name: "하누", icon: "tmpLogo"), Similarity: 80)

let ingredient = Ingredient(id: 1, name: "하누", icon: "tmpLogo")

let recipleSeq = [
    RecipeSequence(number: 1, Content: "이렇게하세요", hightlightIndexList: nil),
    RecipeSequence(number: 2, Content: "저렇게하세요", hightlightIndexList: nil)
]

class ReplaceRecipe {
    private var recipe = [
        replacedRecipe(id: 1, name: "된장찌개", image: "stanford_iOS", isLike: false, ownIngredientList: ingredients ,replaceIngredient: replaced, recipeSequenceList: recipleSeq),
        replacedRecipe(id: 2, name: "김치찌개", image: "stanford_iOS", isLike: false, ownIngredientList: ingredients ,replaceIngredient: replaced, recipeSequenceList: recipleSeq),
        replacedRecipe(id: 3, name: "순두부찌개", image: "stanford_iOS", isLike: false, ownIngredientList: ingredients ,replaceIngredient: replaced, recipeSequenceList: recipleSeq)
    ]
    
    
    func getRecipes() -> [replacedRecipe] {
        return recipe
    }
    
}
