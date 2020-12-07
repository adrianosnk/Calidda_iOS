//
//  RegisterView.swift
//  App
//
//  Created by Raul Quispe on 5/31/20.
//  Copyright © 2020 Raul Quispe. All rights reserved.
//
  
import UIKit
import RxSwift
import ImageSlideshow
import RxCocoa

class DetailNovedadesView: UIViewController {
    //var style: Style = Style.myApp
    var router:Router!
    let disposeBag = DisposeBag()
    
    @IBOutlet var viwBackContent:UIView!
    @IBOutlet var viwBackUser:UIView!
    @IBOutlet var emailTexfield:UITextField!
    @IBOutlet var titleDateLabel:UILabel!
    @IBOutlet var titleLabel:UILabel!
    @IBOutlet var subTitleLabel:UILabel!
    @IBOutlet var subTitleImageLabel:UILabel!
    

    
    var newGroupEventDetailSections = [ResponseEventDetailData]()
    
    
    open override var supportedInterfaceOrientations: UIInterfaceOrientationMask {
        return .portrait
    }

    @IBOutlet var slideshow: ImageSlideshow!

    let localSource = [BundleImageSource(imageString: "img1"), BundleImageSource(imageString: "img2"), BundleImageSource(imageString: "img3"), BundleImageSource(imageString: "img4")]
    //let afNetworkingSource = [AFURLSource(urlString: "https://images.unsplash.com/photo-1432679963831-2dab49187847?w=1080")!, AFURLSource(urlString: "https://images.unsplash.com/photo-1447746249824-4be4e1b76d66?w=1080")!, AFURLSource(urlString: "https://images.unsplash.com/photo-1463595373836-6e0b0a8ee322?w=1080")!]
    let alamofireSource = [AlamofireSource(urlString: "https://images.unsplash.com/photo-1432679963831-2dab49187847?w=1080")!, AlamofireSource(urlString: "https://images.unsplash.com/photo-1447746249824-4be4e1b76d66?w=1080")!, AlamofireSource(urlString: "https://images.unsplash.com/photo-1463595373836-6e0b0a8ee322?w=1080")!]
    let sdWebImageSource = [SDWebImageSource(urlString: "https://images.unsplash.com/photo-1432679963831-2dab49187847?w=1080")!, SDWebImageSource(urlString: "https://images.unsplash.com/photo-1447746249824-4be4e1b76d66?w=1080")!, SDWebImageSource(urlString: "https://images.unsplash.com/photo-1463595373836-6e0b0a8ee322?w=1080")!]
   // let kingfisherSource = [KingfisherSource(urlString: "https://images.unsplash.com/photo-1432679963831-2dab49187847?w=1080")!, KingfisherSource(urlString: "https://images.unsplash.com/photo-1447746249824-4be4e1b76d66?w=1080")!, KingfisherSource(urlString: "https://images.unsplash.com/photo-1463595373836-6e0b0a8ee322?w=1080")!]

    
    
    
    
    
     
    let disposebag = DisposeBag()
    private let presenter = DetailNovedadesPresenter(eventDetailService: EventDetailService())
    override func viewDidLoad() {
        super.viewDidLoad()
        
        setupUI()
        
        setupUISlider()
        loadDataEventoDetail()
        
        let stringTitulo =  UserDefaults.standard.string(forKey: "KeyTitulo")!
        
        self.titleLabel.text = stringTitulo
        let stringResumen =  UserDefaults.standard.string(forKey: "KeyResumen")!
        
        
        var htmlVariable:String
        htmlVariable  = stringResumen
                        
        self.subTitleLabel.text = htmlVariable.html2String//stringResumen
        self.subTitleImageLabel.text = htmlVariable.html2String//stringResumen
        
        let stringRutaImagen =  UserDefaults.standard.string(forKey: "KeyRutaImagen")!
        
        if stringRutaImagen == ""{
            self.subTitleLabel.isHidden = true
            self.subTitleImageLabel.isHidden = false
            self.slideshow.isHidden = true
            
        }else{
            
            self.subTitleImageLabel.isHidden = true
            self.subTitleLabel.isHidden = false
            self.slideshow.isHidden = false
        }
        print("stringRutaImagen::>",stringRutaImagen)
        
        
        let stringFecha =  UserDefaults.standard.string(forKey: "KeyFecha")!
        print("stringFecha:>>:>:>:",stringFecha)
        /*
        let dateFormatter = DateFormatter()
                              dateFormatter.dateFormat = "yyyy-MM-dd'T'HH:mm:ss.'Z'"
           let date = dateFormatter.date(from: stringFecha)
                           
             // change to a readable time format and change to local time zone
           dateFormatter.dateFormat = "dd / MMMM - YYYY"
           dateFormatter.timeZone = NSTimeZone.local
            let timeStamp = dateFormatter.string(from: date!)
                 
        var resultPorcentage:String = ""
          resultPorcentage = timeStamp.replacingOccurrences(of: "/", with: "de")
          resultPorcentage = resultPorcentage.replacingOccurrences(of: "-", with: "del")
        */
        
        //self.titleDateLabel.text = resultPorcentage
        self.titleDateLabel.text = stringFecha
                            
        
    }
    
    func loadDataEventoDetail(){
        //let userProperties = presenter.getMyUser().TokenAcceso!
        
        let userProperties =  UserDefaults.standard.string(forKey: "KeyToken")!
        let idEvento =  UserDefaults.standard.string(forKey: "KeyIdEvento")!
        presenter.getDetailEventos(token: userProperties,idEvento:idEvento)
            .subscribeOn(MainScheduler.asyncInstance)
            .subscribe(onNext: {result in
                
                //self.fillInfoTop(result.data)
                self.fillInfoEventDetailTop(result)
            },
                       onError: {error in
                        
            },
                       onCompleted: {},
                       onDisposed: {})
            .disposed(by: self.disposeBag)
        
        
    }
    
    func fillInfoEventDetailTop(_ info:[ResponseEventDetailData]){
           
              DispatchQueue.main.async {
                  //self.reponseFacturaModel = info
                  
                   self.newGroupEventDetailSections = info
                  
                  print(" infooooFac >>::", info)
                //  print(" self.reponseFacturaModelFac >>", self.newGroupEventSections as Any)
                 
                  //  self.reciboAnio = info.Recibos[0].Anio
                /*
                  let fileName = info.photo!
                  let fileArray = fileName.components(separatedBy: "/")
                  let finalFileName = fileArray.last
                  print("finalFileName::",String(finalFileName!))
                  */
          //myArray
                 // self.tableView.reloadData()
       
              }
          }
    
    func setupUISlider(){
        
        slideshow.slideshowInterval = 5.0
        slideshow.pageIndicatorPosition = .init(horizontal: .center, vertical: .under)
        slideshow.contentScaleMode = UIViewContentMode.scaleAspectFill

        let pageControl = UIPageControl()
        pageControl.currentPageIndicatorTintColor = UIColor.lightGray
        pageControl.pageIndicatorTintColor = UIColor.black
        slideshow.pageIndicator = pageControl

        // optional way to show activity indicator during image load (skipping the line will show no activity indicator)
        slideshow.activityIndicator = DefaultActivityIndicator()
        slideshow.delegate = self

        // can be used with other sample sources as `afNetworkingSource`, `alamofireSource` or `sdWebImageSource` or `kingfisherSource`
        slideshow.setImageInputs(sdWebImageSource)

        let recognizer = UITapGestureRecognizer(target: self, action: #selector(DetailNovedadesView.didTap))
        slideshow.addGestureRecognizer(recognizer)
    }
    @objc func didTap() {
         let fullScreenController = slideshow.presentFullScreenController(from: self)
         // set the activity indicator for full screen controller (skipping the line will show no activity indicator)
         fullScreenController.slideshow.activityIndicator = DefaultActivityIndicator(style: .white, color: nil)
     }
    
    func setupUI(){
        
      
    }
    @IBAction func goToBack(){
        router.pop(sender: self)
    }

    
}
extension DetailNovedadesView: ImageSlideshowDelegate {
    func imageSlideshow(_ imageSlideshow: ImageSlideshow, didChangeCurrentPageTo page: Int) {
        print("current page:", page)
    }
}
