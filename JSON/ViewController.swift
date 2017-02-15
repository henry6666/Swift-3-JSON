//
//  ViewController.swift
//  JSON
//
//  Created by Henry Aguinaga on 2016-11-10.
//  Copyright © 2016 Henry Aguinaga. All rights reserved.
//

import UIKit

class ViewController: UIViewController, UITableViewDelegate, UITableViewDataSource {
    
    @IBOutlet weak var tableView: UITableView!
    
    var actorsArray = [AnyObject]()
    

    override func viewDidLoad() {
        super.viewDidLoad()
        
        let url = NSURL(string: "http://microblogging.wingnity.com/JSONParsingTutorial/jsonActors")
        let request = NSMutableURLRequest(url: url as! URL)
        URLSession.shared.dataTask(with: request as URLRequest) {(data:Data?, respons:URLResponse?, error:Error?) in
            
            if error != nil {
                print("Error \(error)")
            }
            
            do {
                let json = try JSONSerialization.jsonObject(with: data!, options: JSONSerialization.ReadingOptions.mutableContainers) as? NSDictionary
                guard let parsedJSON = json else {
                    
                    print("Error while parsing!")
                    return
                }
                
                //print(parsedJSON["actors"])
                
                guard let actorsJSON = parsedJSON["actors"] else {
                    print("Error while actoring")
                    return
                }
                print(actorsJSON)
                
                self.actorsArray = actorsJSON as! [AnyObject]
                self.tableView.reloadData()
                
                
            } catch {
                print("Caught an error \(error)")
            }
        
        }.resume()
        
    }
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return actorsArray.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "cell") as! TableViewCell
        
        let name = actorsArray[indexPath.row]["name"]
        let country = actorsArray[indexPath.row]["country"]
       
        
        cell.actorName.text = name as? String
        cell.actorCountry.text = country as? String
        
        // got url 1 by 1 of every object of array as string
        let imageUrlString = actorsArray[indexPath.row]["image"] as! String
        
        // converted string to URL
        let imageURL = NSURL(string: imageUrlString )
        
        // loaded data from URL
        let imageData = NSData(contentsOf: imageURL as! URL)
        
        // loaded data to imageView
        cell.actorPicture.image = UIImage(data: imageData as! Data)
        

        return cell
    }
}














