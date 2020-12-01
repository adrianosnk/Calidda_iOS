//
//  RegisterView.swift
//  App
//
//  Created by Raul Quispe on 5/31/20.
//  Copyright © 2020 Raul Quispe. All rights reserved.
//
  
import UIKit
import RxSwift
import TinyConstraints
import Alamofire
class DetailConsumoPdfView: UIViewController {
    //var style: Style = Style.myApp
    var router:Router!
    
    @IBOutlet var viwBackContent:UIView!
    @IBOutlet var viwBackUser:UIView!
    @IBOutlet var emailTexfield:UITextField!
    
    var base64String:String = ""
    @IBOutlet var viewWeb:UIWebView!
    
    let disposebag = DisposeBag()
    private let presenter = DetailConsumoPdfPresenter(loginService: AuthenticationService())
    override func viewDidLoad() {
        super.viewDidLoad()
        
        setupUI()
    }
    func setupUI(){
        self.viewWeb.isOpaque = false;
        self.viewWeb.backgroundColor = UIColor.clear
        
        self.base64String = "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"
               if let decodeData = Data(base64Encoded: self.base64String, options: .ignoreUnknownCharacters) {
                   self.viewWeb.load(decodeData, mimeType: "application/vnd.openxmlformats-officedocument.spreadsheetml.sheet", textEncodingName: "utf-8", baseURL: URL(fileURLWithPath: ""))
                
               }
        
  
       // let fromDataToString = String(data: download.fileContent!, encoding: .isoLatin1)
       // let fromStringToData = Data(base64Encoded: fromDataToString!, options: .ignoreUnknownCharacters)
        
        
        
            let destination: DownloadRequest.Destination = { _, _ in
                             let documentsURL = FileManager.default.urls(for: .picturesDirectory, in: .userDomainMask)[0]
                                 let fileURL = documentsURL.appendingPathComponent("f_1312015203355628490.xls")
                                 return (fileURL, [.removePreviousFile, .createIntermediateDirectories])
                         }
                         AF.download("https://s3-eu-west-1.amazonaws.com/schooly/handasaim/news/", to: destination).response { response in
                             debugPrint(response)
                             if response.error == nil, let imagePath = response.fileURL?.path {
                                 let image = UIImage(contentsOfFile: imagePath)
                             }
                         }
        
       
    }
    @IBAction func goToBack(){
        router.pop(sender: self)
    }

    
}
