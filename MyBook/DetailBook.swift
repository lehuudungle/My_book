//
//  DetailBook.swift
//  MyBook
//
//  Created by Admin on 2/23/17.
//  Copyright © 2017 Admin. All rights reserved.
//

import UIKit

class DetailBook: UIViewController,UIWebViewDelegate {

    @IBOutlet weak var webView: UIWebView!
    
    @IBOutlet weak var myActivity: UIActivityIndicatorView!
    
    @IBOutlet weak var showDate: UIButton!
    
    @IBAction func getCurrentTime(sender: AnyObject) {
        self.webView.stringByEvaluatingJavaScriptFromString("hello();")

    }
    
    
    @IBAction func btnRefesh(sender: AnyObject) {
        webView.reload()
    }
    
    @IBAction func btngoBack(sender: AnyObject) {
        webView.goBack()
    }
    
    @IBAction func goForward(sender: AnyObject) {
        webView.goForward()
    }
    var urlString: String!
    var type: String!
    override func viewDidLoad() {
        super.viewDidLoad()
        self.title = urlString
        self.webView.delegate = self
        self.myActivity.startAnimating()
        var urlPath = "default"
        print("type: \(type)")
        print("urlString: \(urlString)")
        print("title: \(self.title)")
        switch (type) {
        case "PDF": urlPath = NSBundle.mainBundle().pathForResource(urlString, ofType: "pdf")!
            showDate.hidden = true
        case "DOCX": urlPath = NSBundle.mainBundle().pathForResource(urlString, ofType: "docx")!
            showDate.hidden = true
            webView.contentMode = .Right
//            webView.autoresizingMask = UIViewAutoresizing.FlexibleWidth | UIViewAutoresizing.FlexibleHeight
           webView.stringByEvaluatingJavaScriptFromString("document.getElementsByTagName('body')[0].style.fontFamily =\"-apple-system\"")
            webView.autoresizingMask = UIViewAutoresizing.FlexibleWidth
            
            
        case "HTML": urlPath = NSBundle.mainBundle().pathForResource(urlString, ofType: "html")!
        default:
            break
        }
        
        // NSurl đường link tới 1 file trong ổ đĩa hoặc trong máy chủ từ xa
        let url: NSURL = NSURL.fileURLWithPath(urlPath)
        let urlRequest = NSURLRequest(URL: url)
        self.webView.loadRequest(urlRequest)
//        let elecUrl = NSURL(string: "https://www.youtube.com/watch?v=UFKBTiylaN4")
//        let elecUrlRe = NSURLRequest(URL: elecUrl!)
//        self.webView.loadRequest(elecUrlRe)
//        webView.scalesPageToFit = true
//        webView.contentMode = .ScaleAspectFit
        
        // phong to
//        let contentSize:CGSize = webView.scrollView.contentSize
//        let viewSize:CGSize = self.view.bounds.size
//        
//        let rw: CGFloat = CGFloat(viewSize.width / contentSize.width)
//        
//        webView.scrollView.minimumZoomScale = rw
//        webView.scrollView.maximumZoomScale = rw
//        webView.scrollView.zoomScale = rw
//        webView.description()
        
        
        

        // Do any additional setup after loading the view.
    }
    func webViewDidFinishLoad(webView: UIWebView) {
        self.myActivity.hidden = true
        self.myActivity.stopAnimating()
    }
    func webViewDidStartLoad(webView: UIWebView) {
        print("did Start Load")
        
    }
    func webView(webView: UIWebView, shouldStartLoadWithRequest request: NSURLRequest, navigationType: UIWebViewNavigationType) -> Bool {
        print("shouldStartLoadWithrequet")
        return true
    }
    

    
   

}
