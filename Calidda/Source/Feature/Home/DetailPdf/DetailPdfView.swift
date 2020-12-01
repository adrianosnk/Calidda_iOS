//
//  RegisterView.swift
//  App
//
//  Created by Raul Quispe on 5/31/20.
//  Copyright © 2020 Raul Quispe. All rights reserved.
//
  
import UIKit
import RxSwift
class DetailPdfView: UIViewController {
    //var style: Style = Style.myApp
    var router:Router!
    
    @IBOutlet var viwBackContent:UIView!
    @IBOutlet var viwBackUser:UIView!
    @IBOutlet var emailTexfield:UITextField!
    
    var base64String:String = ""
    @IBOutlet var viewWeb:UIWebView!
    
    let disposebag = DisposeBag()
    private let presenter = DetailPdfPresenter(loginService: AuthenticationService())
    override func viewDidLoad() {
        super.viewDidLoad()
        
        setupUI()
    }
    func setupUI(){
        self.viewWeb.isOpaque = false;
        self.viewWeb.backgroundColor = UIColor.clear
        
        self.base64String = "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cmwub3JnL2RjL2VsZW1lbnRzLzEuMS8iIHhtbG5zOnhtcD0iaHR0cDovL25zLmFkb2JlLmNvbS94YXAvMS4wLyIgeG1sbnM6eG1wTU09Imh0dHA6Ly9ucy5hZG9iZS5jb20veGFwLzEuMC9tbS8iPgogICAgICA8ZGM6Zm9ybWF0PmFwcGxpY2F0aW9uL3BkZjwvZGM6Zm9ybWF0PgogICAgICA8ZGM6dGl0bGU+PHJkZjpBbHQ+PHJkZjpsaSB4bWw6bGFuZz0ieC1kZWZhdWx0Ij5FbnZpbyBTQVAgWSBUaXBvIEE8L3JkZjpsaT48L3JkZjpBbHQ+PC9kYzp0aXRsZT4KICAgICAgPGRjOmNyZWF0b3I+PHJkZjpCYWc+PHJkZjpsaSB4bWw6bGFuZz0ieC1kZWZhdWx0Ij5ZcnZpbmcgSGV5c2VuIE1vbGluYSBZcmlhcnRlPC9yZGY6bGk+PC9yZGY6QmFnPjwvZGM6Y3JlYXRvcj4KICAgICAgPGRjOmRlc2NyaXB0aW9uPjxyZGY6QWx0PjxyZGY6bGkgeG1sOmxhbmc9IngtZGVmYXVsdCI+THVjaWRjaGFydDwvcmRmOmxpPjwvcmRmOkFsdD48L2RjOmRlc2NyaXB0aW9uPgogICAgICA8eG1wOkNyZWF0ZURhdGU+MjAyMC0wOS0xNFQwOToxNjowOFVUQzwveG1wOkNyZWF0ZURhdGU+CiAgICAgIDx4bXA6TW9kaWZ5RGF0ZT4yMDIwLTA5LTE0VDA5OjE2OjA4VVRDPC94bXA6TW9kaWZ5RGF0ZT4KICAgICAgPHhtcDpNZXRhZGF0YURhdGU+MjAyMC0wOS0xNFQwOToxNjowOFVUQzwveG1wOk1ldGFkYXRhRGF0ZT4KICAgICAgPHhtcE1NOkRvY3VtZW50SUQ+dXVpZDo1ZTNhODMzNS02ZDU5LTQ3YjYtOTQwYS1hZWY3Njc0NGNhNjM8L3htcE1NOkRvY3VtZW50SUQ+CiAgICAgIDx4bXBNTTpJbnN0YW5jZUlEPnV1aWQ6NWUzYTgzMzUtNmQ1OS00N2I2LTk0MGEtYWVmNzY3NDRjYTYzPC94bXBNTTpJbnN0YW5jZUlEPgogICAgPC9yZGY6RGVzY3JpcHRpb24+CiAgPC9yZGY6UkRGPgo8L3g6eG1wbWV0YT4KPD94cGFja2V0IGVuZD0idyI/PgplbmRzdHJlYW0KZW5kb2JqCjExMCAwIG9iago8PC9NZXRhZGF0YSAxMDkgMCBSL1BhZ2VzIDEgMCBSL01hcmtJbmZvPDwvTWFya2VkIHRydWU+Pi9PdXRsaW5lcyAxMDYgMCBSL0xhbmcoZW4pL1N0cnVjdFRyZWVSb290IDEyIDAgUi9WaWV3ZXJQcmVmZXJlbmNlczw8L0Rpc3BsYXlEb2NUaXRsZSB0cnVlPj4vVHlwZS9DYXRhbG9nPj4KZW5kb2JqCjExMSAwIG9iago8PC9JRFs8MzQ2NjM5MzIzNDM1MzkzMT48MzQ2NjM5MzIzNDM1MzkzMT5dL1Jvb3QgMTEwIDAgUi9MZW5ndGggMjM5L1NpemUgMTEyL0luZm8gMTA5IDAgUi9XWzEgNCAyXS9GaWx0ZXIvRmxhdGVEZWNvZGUvVHlwZS9YUmVmPj4Kc3RyZWFtCnicLdI1ToRhFAXQb3B3H9x9gMHd3d1CQ0GoWQYJiyD07IDtULAI+PMfXvFOcpPb3RCi+/1NRL8yhIjR75jUV0zYjOl9iRmZxBt+FPbwGTP2GkJG1HsO17jBf5hABjKRhWzkIBd5yEcBClGEYpSgFGUoRwUqUYVq1KAWdahHA5JoRBOa0YJWtKEdHehEF7rRg170oR8DGMQQhpHCCEYxhjTGMYFJTGEaM5jFHOaxgEUsYRkrWMUa1rGBTWxhGzvYxR72cYBDHOEYJzjFGc5xgUtc4RZ3uI8WmX6MhznzAaOdfcB7zNJTzHIyhD+G9kYDCmVuZHN0cmVhbQplbmRvYmoKc3RhcnR4cmVmCjE2NDExCiUlRU9G"
               if let decodeData = Data(base64Encoded: self.base64String, options: .ignoreUnknownCharacters) {
                   self.viewWeb.load(decodeData, mimeType: "application/pdf", textEncodingName: "utf-8", baseURL: URL(fileURLWithPath: ""))
               }
        
      
    }
    @IBAction func goToBack(){
        router.pop(sender: self)
    }

    
}