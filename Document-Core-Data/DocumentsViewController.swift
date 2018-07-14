//
//  DocumentsViewController.swift
//  Document-Core-DataUITests
//
//  Created by Landen Eagan on 7/13/18.
//  Copyright © 2018 Landen Eagan. All rights reserved.
//

import UIKit
import CoreData

class DocumentsViewController: UIViewController, UITableViewDelegate, UITableViewDataSource {
    
    
    @IBOutlet weak var documentTableView: UITableView!
    
    
    var documents = [Document]()
    
    var dateFormatter = DateFormatter()
    
    var displayDateFormatter = DateFormatter()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        displayDateFormatter.dateStyle = .medium
        displayDateFormatter.timeStyle = .medium
        
        dateFormatter.dateFormat = "MMMM d, yyyy HH:mm"
        
        //        if let date = dateFormatter.date(from: "June 1, 2018 18:30") {
        //            documents.append(Document(title: "Dog", size: 12, date: date, text: ""))
        //        }
        
        // Do any additional setup after loading the view.
    }
    
    override func viewWillAppear(_ animated: Bool) {
        guard let appDelegate = UIApplication.shared.delegate as? AppDelegate else {
            return
        }
        
        let managedContext = appDelegate.persistentContainer.viewContext
        let fetchRequest: NSFetchRequest<Document> = Document.fetchRequest()
        
        do {
            documents = try managedContext.fetch(fetchRequest)
            
            documentTableView.reloadData()
        } catch {
            print("Fetch could not be performed")
        }
    }
    
    
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    
    func numberOfSections(in tableView: UITableView) -> Int {
        return 2
    }
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return documents.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "documentCell", for: indexPath)
        
        if let cell = cell as? DocumentTableViewCell {
            
            let document = documents[indexPath.row]
            
            cell.titleLabel.text = document.title
            cell.sizeLabel.text = "Size: " + String(document.size) + " bytes"
            cell.dateLabel.text = "Modified: " + displayDateFormatter.string(from: document.date!)
        }
        
        return cell
    }
    

    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        // Get the new view controller using segue.destinationViewController.
        // Pass the selected object to the new view controller.
    }
    */

}
