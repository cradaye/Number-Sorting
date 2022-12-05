//
//  ViewController.swift
//  Number-Sorting
//
//  Created by BigAdmin on 04/12/22.
//

import UIKit

class ViewController: UIViewController {

    var userData: [Int] = []
    @IBOutlet weak var lblUserData: UILabel!
    @IBOutlet weak var lblUserInsertedData: UILabel!
    @IBOutlet weak var txtUserData: UITextField!
    @IBOutlet weak var lblSort: UILabel!
    @IBOutlet weak var lblUserSortedData: UILabel!
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
        lblUserData.text = "User Data->"
        lblUserInsertedData.text = ""
        lblUserSortedData.text = ""
        lblSort.text = "Sorted Data->"
        //txtUserData.becomeFirstResponder()
    }

    @IBAction func addUserData(_ sender: Any) {
        
        guard let inputData = Int(txtUserData.text!) else { return  }
        userData.append(inputData)
        txtUserData.text = ""
        
        var strUserData = ""
        for data in userData {
            strUserData += "\(data),"
        }
        lblUserInsertedData.text = strUserData
        
        if let sortedData = sortData(array: userData) {
            lblUserSortedData.text = sortedData
        } else {
            lblUserSortedData.text = strUserData
        }
        
        
    }
    
    @IBAction func clearUserData(_ sender: Any) {
        userData = []
        lblUserInsertedData.text = ""
        lblUserSortedData.text = ""
    }
    
    func sortData(array: [Int]) -> String! {
        if array.count == 0 {
            return nil
        }
        
        if array.count == 1 {
            return String(array[0])
        }
        
        var arr = array
               for _ in 0...arr.count {
                   for value in 1...arr.count - 1 {
                       if arr[value-1] > arr[value] {
                           let largerValue = arr[value-1]
                           arr[value-1] = arr[value]
                           arr[value] = largerValue
                       }
                   }
               }
         
        
        var strUserData = ""
        for data in arr {
            strUserData += "\(data),"
        }
        return strUserData
        
    }
    
}

