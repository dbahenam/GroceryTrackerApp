//
//  DataManager.swift
//  GroceryTracker
//
//  Created by David Bahena Moctezuma on 5/12/22.
//

import Foundation
protocol GroceryDataDelagate{
  func retrievedData(groceryData: [GroceryData])
}
struct DataManager{
  
  let dataURL = "http://144.126.222.53/get/Joshua"
  var totalItems : [GroceryData] = []
  var delagate : GroceryDataDelagate?
  func fetchData(){
	performRequest(urlString: dataURL)
  }
  
  func performRequest(urlString : String){
	// creat url
	if let url = URL(string: urlString){
	  
	  // create urlSession
	  let session = URLSession(configuration: .default)
	  
	  // give the urlSession a task
	  let task = session.dataTask(with: url) { (data, response, error) in
		if error != nil{
		  print(error!)
		  return  // exit function
		}
		
		if let safeData = data {
		  let dataString = String(data: safeData, encoding: .utf8)
		  //print("datastring is : " + dataString! + "\n")
		  if let infoData = self.parseJSON(groceryData: safeData){
			self.delagate?.retrievedData(groceryData: infoData)
		  }
		}
	  }
	  
	  // start the task
	  task.resume()
	}
  }
  
  func parseJSON(groceryData : Data)->[GroceryData]?{
	let decoder = JSONDecoder()
	do{
	  //let decodedData = try decoder.decode(GroceryData.self, from: groceryData)
	  var totalItems : [GroceryData] = []
	  let decodedData = try decoder.decode(Array<GroceryData>.self, from: groceryData)

	  for item in decodedData{
		var name = item.item_name
		var count = item.item_count
		var anItem = GroceryData(item_name: name, item_count: count)
		totalItems.append(anItem)
	  }
	  
	  return totalItems
	  print("printing items: \n")
	}
	catch{
	  print(error)
	}
	return nil
  }
  
}
