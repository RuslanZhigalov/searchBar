//
//  ViewController.swift
//  searchBar
//
//  Created by Руслан Жигалов on 13.12.2022.
//

import UIKit
import SnapKit

class ViewController: UIViewController {
    var timer = Timer()
    var charactersInst = SearchQuery()
    var endPoint:[CharactersIMDB]?{
        didSet{
            DispatchQueue.main.async {
                self.uiTable.reloadData()
            }
        }
    }
    
    let searchController = UISearchController()
    let iden = "identificators"
    private let uiTable: UITableView = {
        let table = UITableView()
        table.translatesAutoresizingMaskIntoConstraints = false
        return table
    }()
    override func viewDidLoad() {
        super.viewDidLoad()
        view.backgroundColor = .systemBackground
        uiTable.delegate = self
        uiTable.dataSource = self
        title = "Search"
        searchController.searchResultsUpdater = self
        navigationItem.searchController = searchController
        constr()
        
    }
    func updateSearchResults(for searchController: UISearchController) {
        
        //Invalidate and Reinitialise
        self.timer.invalidate()
        
        guard let searchText = searchController.searchBar.text else { return }
        
        timer = Timer.scheduledTimer(withTimeInterval: 0.5, repeats: false, block: {  (timer) in
            DispatchQueue.main.async {
                self.charactersInst.taskImdb(searchString: searchText) { result in
                    self.endPoint = result
                    
                }
            }
            
        })
    }
    
    func constr(){
        uiTable.register(CellWithTwoLabelAndImage.self, forCellReuseIdentifier: iden)
        view.addSubview(uiTable)
        uiTable.snp.makeConstraints { make in
            make.bottom.equalTo(view.safeAreaLayoutGuide.snp.bottomMargin)
            make.top.equalTo(view.safeAreaLayoutGuide.snp.topMargin)
            make.left.right.equalToSuperview()
        }
    }
}
extension ViewController: UITableViewDelegate, UITableViewDataSource, UISearchResultsUpdating{
    
    func numberOfSections(in tableView: UITableView) -> Int {
        return endPoint?.count ?? 0
    }
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        1
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: iden, for: indexPath) as? CellWithTwoLabelAndImage
        guard let data = (endPoint?[indexPath.section]) else { return UITableViewCell() }
        
        cell?.configure(data)
        return cell ?? UITableViewCell()
    }
}

