//
//  loadURL.swift
//  MyBook
//
//  Created by Admin on 2/23/17.
//  Copyright © 2017 Admin. All rights reserved.
//

import UIKit

class loadURL: UIViewController, UITextFieldDelegate, UIWebViewDelegate {
    

    @IBOutlet weak var myActivity: UIActivityIndicatorView!
    
    @IBOutlet weak var urlString: UITextField!
   
    @IBOutlet weak var webView: UIWebView!
   
    let baseUrl = "http://www."
    
    override func viewDidLoad() {
        
    myActivity.hidden = true
    super.viewDidLoad()
    }
    func textFieldShouldReturn(textField: UITextField) -> Bool {
        print("nhap and enter")
        myActivity.hidden = false
        let url = NSURL(string: baseUrl + textField.text!)
        let urlRequest = NSURLRequest(URL: url!)
        self.webView.loadRequest(urlRequest)
        myActivity.startAnimating()
        return true
    }
    func webViewDidFinishLoad(webView: UIWebView)
    {
        myActivity.hidden = true
        myActivity.stopAnimating()
    }


}
