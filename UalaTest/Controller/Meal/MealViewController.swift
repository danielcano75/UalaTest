//
//  MealViewController.swift
//  UalaTest
//
//  Created by Cano Bohorquez on 16/02/21.
//

import UIKit

// Mark: Lyfe Cycle
class MealViewController: UIViewController {
    private let detail = "detail"
    var viewModel = MealViewModel()
    @IBOutlet weak var tvMeals: UITableView!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        confing()
    }
    
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        load()
    }
    
    private func confing() {
        // Create search component
        navigationController?.navigationBar.prefersLargeTitles = true
        navigationItem.searchController = UISearchController(searchResultsController: nil)
        navigationItem.searchController?.searchBar.delegate = self
        navigationItem.hidesSearchBarWhenScrolling = false
        let cancelButton = UIButton.appearance(whenContainedInInstancesOf: [UISearchBar.self])
        cancelButton.tintColor = UIColor.systemBlue
        
        // Register cell for reuse
        tvMeals.register(UINib(nibName: MealCellView.identifier, bundle: nil),
                            forCellReuseIdentifier: MealCellView.identifier)
    }
    
    func load() {
        // load all meals
        viewModel.meals()
        viewModel.reload = {
            DispatchQueue.main.async {
                self.tvMeals.reloadData()
            }
        }
    }
    
    // MARK: - Navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        if segue.identifier == detail {
            guard let detail = segue.destination as? MealDetailViewController else {
                return
            }
            guard let meal = viewModel.selected else {
                return
            }
            detail.meal = meal
        }
    }
}

// MARK: Table View Data source
extension MealViewController: UITableViewDataSource {
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return viewModel.datasource.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let meal = viewModel.datasource[indexPath.row]
        guard let cell = tableView.dequeueReusableCell(withIdentifier: MealCellView.identifier) as? MealCellView else {
            return UITableViewCell()
        }
        cell.load(meal: meal)
        return cell
    }
}

// MARK: Table View Delegate
extension MealViewController: UITableViewDelegate {
    func tableView(_ tableView: UITableView,
                   didSelectRowAt indexPath: IndexPath) {
        let meal = viewModel.datasource[indexPath.row]
        viewModel.selected = meal
        performSegue(withIdentifier: detail, sender: self)
    }
}

// MARK: Search Bar Delegate
extension MealViewController: UISearchBarDelegate {
    func searchBar(_ searchBar: UISearchBar,
                   textDidChange searchText: String) {
        viewModel.filter = searchText
        viewModel.meals()
    }
    
    func searchBarCancelButtonClicked(_ searchBar: UISearchBar) {
        viewModel.filter = ""
        viewModel.meals()
    }
}
