//
//  ViewController.swift
//  paypal-popup
//
//  Created by Alan Daligault on 05/07/2022.
//

import UIKit
import WebKit
import PopupBridge


class ViewController: UIViewController, WKUIDelegate , POPPopupBridgeDelegate{
   
    private var webView: WKWebView?
    private var popupBridge: POPPopupBridge?
    //var webView: WKWebView!
    
    //override func loadView() {
    //    let webConfiguration = WKWebViewConfiguration()
    //    webView = WKWebView(frame: .zero, configuration: webConfiguration)
    //    webView.uiDelegate = self
    //    view = webView
    //}
    override func viewDidLoad() {
        super.viewDidLoad()
        
        webView = WKWebView(frame: CGRect(x: 0, y: 0, width: view.frame.size.width, height: view.frame.size.height))
            if let webView = webView {
                view.addSubview(webView)
            }

        popupBridge = POPPopupBridge(webView: webView!, delegate: self)

            // replace http://localhost:3099/ with the webpage you want to open in the webview
            if let url = URL(string: "https://btplayground.herokuapp.com/") {
                webView?.load(URLRequest(url: url))
            }
    
    }
    
    func popupBridge(_ bridge: POPPopupBridge?, requestsPresentationOf viewController: UIViewController?) {
        if let viewController = viewController {
            present(viewController, animated: true)
        }
    }

    func popupBridge(_ bridge: POPPopupBridge?, requestsDismissalOf viewController: UIViewController?) {
        viewController?.dismiss(animated: true)
    }
}
