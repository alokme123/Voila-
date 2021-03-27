//
//  recipeWebViewViewController.swift
//  Voila!
//
//  Created by Alok N on 27/03/21.
//

import UIKit
import WebKit

class recipeWebViewViewController: UIViewController, UIWebViewDelegate {
    
    @IBOutlet weak var recipeWebView: WKWebView!
    var recipe: Array<String>?//Array to Receive Data

    override func viewDidLoad() {
        super.viewDidLoad()
        self.title=recipe![0]//Setting Title from Received Array
        recipeWebView.load(NSURLRequest(url: NSURL(string:recipe![2])! as URL) as URLRequest)//Loading WebView
    }
    
}
