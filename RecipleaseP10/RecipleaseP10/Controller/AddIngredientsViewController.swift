import UIKit

class SearchViewController: UIViewController {
    // MARK: - Outlets
    @IBOutlet private weak var ingredientTextField: UITextField!
    @IBOutlet private weak var ingredientTextView: UITextView!
    @IBOutlet private weak var validateButton: UIButton!
    @IBOutlet private weak var activityIndicatorView: UIActivityIndicatorView!
    
    // MARK: - Properties
    private let segueIdentifier = "segueToRecipes"
    private var ingredientsList: [String] = []
    private var recipes: Recipes?

    // MARK: - Actions
    @IBAction func addIngredient() {
        addIngredientToList()
    }
    
    @IBAction func clearList() {
        ingredientsList.removeAll()
        ingredientTextView.text.removeAll()
    }
    
    @IBAction func searchRecipes() {
        loader(shown: true)
        
        if !ingredientsList.isEmpty {
            RecipeService.shared.getRecipes(for: self.ingredientsList, callback: { [weak self]  success, recipes in
                guard let self = self else { return }
                
                DispatchQueue.main.asyncAfter(deadline: .now() + 1.0) { [self] in
                    if success, let recipes = recipes {
                        if recipes.count > 0 {
                            self.recipes = recipes
                            self.performSegue(withIdentifier: self.segueIdentifier, sender: self)
                        } else {
                            self.presentAlert(title: "No recipe",
                                              message: "Sorry try again no recipe has been found",
                                              buttonTitle: "OK")
                        }
                    } else {
                        self.presentAlert(title: "Connexion issues",
                                          message: "Sorry try again ",
                                          buttonTitle: "OK")
                
                    }
                    self.loader(shown: false)
                }
            })
        } else {
            loader(shown: false)
        }
    }
    
    // MARK: - Life cycle
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        prepareView()
    }
    
//    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
//        if segue.identifier == segueIdentifier {
//            if let recipesListVC = segue.destination as? RecipeListViewController {
//                recipesListVC.recipeTableView
//            }
//        }
//    }
    
    // MARK: - Private functions
    private func prepareView() {
        ingredientsList.removeAll()
        ingredientTextView.text = ""
    }
    
    func presentAlert(title: String, message: String, buttonTitle: String) {
        let alertVC = UIAlertController(title: title, message: message, preferredStyle: .alert)
        alertVC.addAction(UIAlertAction(title: buttonTitle, style: .cancel, handler: nil))
        present(alertVC, animated: true, completion: nil)
    }
    
    private func loader(shown: Bool) {
        validateButton.isHidden = shown
        
        if shown {
            activityIndicatorView.startAnimating()
        } else {
            activityIndicatorView.stopAnimating()
        }
    }
    
    private func removeIngredient(at index: Int) {
        ingredientsList.remove(at: index)
    }
    
    private func add(ingredient: String) {
        ingredientsList.append(ingredient)
    }
    
    private func addIngredientToList() {
        if let ingredientName = ingredientTextField.text?.trimmingCharacters(
            in: .whitespacesAndNewlines).trimmingCharacters(
                in: .punctuationCharacters), !ingredientName.isEmpty {
            ingredientsList.append(ingredientName)
            ingredientTextView.text = ""
//            for ingredient in ingredientsList {
//                ingredientTextView.text += "\n- " + ingredient.capitalizingFirstLetter()
//            }
            ingredientTextField.text = ""
        }
    }
}
