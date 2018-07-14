//
//  DocumentEditorViewController.swift
//  Document-Core-DataUITests
//
//  Created by Landen Eagan on 7/13/18.
//  Copyright © 2018 Landen Eagan. All rights reserved.
//

import UIKit

class DocumentEditorViewController: UIViewController {

    
    @IBOutlet weak var titleTextField: UITextField!
    @IBOutlet weak var saveButton: UIBarButtonItem!
    @IBOutlet weak var textView: UITextView!
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        // Do any additional setup after loading the view.
    }
    
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    
    @IBAction func save(_ sender: Any) {
        let title = titleTextField.text
        let text = textView.text
        let date = NSDate()
        let size = 10
        
        if let document = Document(title: title, text: text, size: Int32(size), date: date as Date) {
            do {
                let managedContext = document.managedObjectContext
                
                try managedContext?.save()
                
                self.navigationController?.popViewController(animated: true)
            } catch {
                print("Context could not be saved")
            }
        }
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
