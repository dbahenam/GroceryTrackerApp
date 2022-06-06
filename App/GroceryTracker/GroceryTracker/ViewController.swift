//
//  ViewController.swift
//  GroceryTracker
//
//  Created by David Bahena Moctezuma
//

import UIKit

class ViewController: UIViewController,  GroceryDataDelagate, UISearchBarDelegate{
  
  @IBAction func settingsIcon(_ sender: UIButton) {}
 // @IBOutlet weak var searchTextField: UITextField!
  @IBOutlet weak var TableOfItems: UITableView!
  
  @IBOutlet weak var searchBar: UISearchBar!
  
  @IBOutlet weak var userName: UILabel!
  
  let searchController = UISearchController()
  var dataManager = DataManager()
  var decodedData: [GroceryData] = [GroceryData(item_name: "", item_count: 0)]
  var count = 0
  var currentData: GroceryData {
	  get { return decodedData[count] }
	  set { decodedData[count] = newValue }
  }
 
  var cells : [Cell] = []
  var filteredCells : [Cell]!
  
  override func viewDidLoad() {
		super.viewDidLoad()
		//Load table with items
		TableOfItems.delegate = self
		TableOfItems.dataSource = self
		TableOfItems.register(UINib(nibName: "ItemCell", bundle: nil), forCellReuseIdentifier: "ReusableCell")
		// Do any additional setup after loading the view.
		searchBar.delegate = self
		dataManager.delagate = self
		loadData()
		filteredCells = cells
	}

  func loadData(){
	self.dataManager.fetchData()
  }
}

extension ViewController: UITableViewDataSource{
  
  func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
	print("count is : "  + "\(cells.count)")
	return filteredCells.count
  }
  
  func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
	let cell = tableView.dequeueReusableCell(withIdentifier: "ReusableCell", for: indexPath)
	as! ItemCell
	
	cell.label.text = filteredCells[indexPath.row].item
	cell.count.text = "\(filteredCells[indexPath.row].count)"
	return cell
  }
  
  func retrievedData(groceryData : [GroceryData]){
	  cells = []
	  for items in groceryData{
		var aCell = Cell(item : items.item_name, count : items.item_count)
		self.cells.append(aCell)
		filteredCells = cells
	  }
	  DispatchQueue.main.async {
		self.TableOfItems.reloadData();
	  }
		
  }
  
  func searchBar(_ searchBar: UISearchBar, textDidChange searchText: String) {
	filteredCells = []
	
	if searchText == "" {
	  filteredCells = cells
	}
	else{
	  for grocery in cells {
		if grocery.item.lowercased().contains(searchText.lowercased()){
		  //let aCell = Cell(item : grocery.item, count : grocery.count)
		  filteredCells.append(grocery)
		}
	  }
	}
	DispatchQueue.main.async {
	  self.TableOfItems.reloadData();
	}
  }
}

extension ViewController: UITableViewDelegate{
  func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
	print(indexPath.row)
  }
}
