//
//  ViewController.swift
//  Project3
//
//  Created by Felipe Moreno on 15/11/23.
//

import UIKit

class ViewController: UITableViewController {
    var pictures = [String]()
    var sortedArray = [String]()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        title = "Storm Viewer"
        navigationController?.navigationBar.prefersLargeTitles = true
        
        let fm = FileManager.default
        let path = Bundle.main.resourcePath!
        let items = try! fm.contentsOfDirectory(atPath: path)
        
        for item in items {
            if item.hasPrefix("nssl") {
                pictures.append(item)
            }
        }
        
        sortedArray = pictures.sorted()
        
    }
    
    override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return sortedArray.count
    }
    
    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "Picture", for: indexPath)
        cell.textLabel?.text = sortedArray[indexPath.row]
        return cell
    }
    
    override func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        if let vc = storyboard?.instantiateViewController(withIdentifier: "Detail") as? DetailViewController{
            vc.selectedImage = sortedArray[indexPath.row]
            vc.imageTitle = "Imagem \(indexPath.row + 1) de \(sortedArray.count)"
            navigationController?.pushViewController(vc, animated: true)
        }
    }
}
