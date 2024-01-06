//
//  GETVC.swift
//  DEMO APP
//
//  Created by Mubasir Siddiqui on 25/10/23.
//

import UIKit
import Combine

class GETVC: UIViewController, UITableViewDelegate, UITableViewDataSource {
    
    
    @IBOutlet weak var tableView: UITableView!
    
//Created a property of ViewModel
    
    @Published var viewModel: GETVCViewModel = GETVCViewModel()
// Created a set of cancellables to manage subscriptions to Combine publishers.
        private var cancellables: Set<AnyCancellable> = []
    
    override func viewDidLoad() {
        super.viewDidLoad()
        viewModel.fetchProducts()

        tableView.delegate = self
        tableView.dataSource = self
        tableView.register(UINib(nibName: "ProductCell", bundle: nil), forCellReuseIdentifier: "ProductCell")
        
//Subscribe to changes in the products property.
// When the 'products' array in the viewModel is filled, the 'sink' closure is called and it updates the tableView by calling the 'tableView.reloadData(),This is done using a weak self which indicates that this is a losely coupled View-ViewModel.
        viewModel.$products
            .receive(on: DispatchQueue.main)
            .sink{[weak self] products in
                self?.tableView.reloadData()
            }
            .store(in: &cancellables)
        
            
    }
    
    @IBAction func getBtn(_ sender: Any) {
        // here the button action is smplified due to Combine Data Binding as we no longer need to pass a trailing closure like previous for async operations in the buttons, instead we call the ViewModel's functions directly , So whenn the get Button is tapped it directly calls the "fetchProducts' func in the ViewModel and the data binding takes care of updating the UI when the data is fetched...
        
        
//        { result in
//            switch result {
//            case .success:
//                print(result)
//                DispatchQueue.main.async {
//                    self.tableView.reloadData()
//                }
//            case .failure(let error):
//                print("Error fetching data: \(error)")
//            }
//        }
    }
    
//Rest ofthe code for the tableView remains the same
    
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return viewModel.products.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        if let cell = tableView.dequeueReusableCell(withIdentifier: "ProductCell", for: indexPath) as? ProductCell {
            let product = viewModel.products[indexPath.row]
            cell.titleLabel.text = product.title
            cell.descriptionLabel.text = product.description
            return cell
        } else {
            return UITableViewCell()
        }
    }
}

