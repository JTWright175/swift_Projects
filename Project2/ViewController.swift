//
//  ViewController.swift
//  Project2
//
//  Created by JeTevius Wright on 9/28/19.
//  Copyright © 2019 JeTevius Wright. All rights reserved.
//

import UIKit

class ViewController: UITableViewController {
    var pictures = [String]()
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        title = "Storm Viewer"
        navigationController?.navigationBar.prefersLargeTitles = true
        
        let fm = FileManager.default
        let path = Bundle.main.resourcePath!
        let items = try! fm.contentsOfDirectory(atPath: path)
        
        for item in items{
            if item.hasPrefix("pexels"){
                pictures.append(item)
            }
        }
        
        //print(pictures)
    }
    
//    func count(x : Int) -> Int{
//        return pictures.count
//    }
    
    override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return pictures.count
            
        }

    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {

        //Creates a reusable cell
        let cell = tableView.dequeueReusableCell(withIdentifier: "Picture")!
        //Gets the picture name at each index
        //print(pictures.sorted())
        
        let sortedPictures = pictures.sorted()
        let object = sortedPictures[indexPath.row]
        //Adds the picture name to the cells
        cell.textLabel?.text = object
        return cell
    }
    
    override func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        if let vc = storyboard?.instantiateViewController(withIdentifier: "Detail") as? DetailViewController{
            let sortedPictures = pictures.sorted()
            vc.selectedImage = sortedPictures[indexPath.row]
            vc.selectedImageIndex = indexPath.row + 1
            vc.totalImageNumber = pictures.count
            
            navigationController?.pushViewController(vc, animated: true)
        }
    }
}
