//
//  ErrorView.swift
//  Calidda
//
//  Created by MacAdrian on 10/22/20.
//  Copyright © 2020 Calidda. All rights reserved.
//

import UIKit

class ErrorView: UIView {

    @IBOutlet var viewContent: UIView!
    @IBOutlet weak var viewBorder: UIView!
    @IBOutlet weak var imageViewIcon: UIImageView!
    @IBOutlet weak var labelTitle: UILabel!
    @IBOutlet weak var labelDescription: UILabel!
    
    private struct DefaultText {
        static let description = "Por favor, intenta de nuevo en unos minutos."
        static let title = "¡Hubo un problema!"
        
    }
    
    // MARK: - Init
    override init(frame: CGRect) {
        super.init(frame: frame)
        commonInit()
    }
    
    required init?(coder aDecoder: NSCoder) {
        super.init(coder: aDecoder)
        commonInit()
    }
    
    private func commonInit() {
        
        viewContent = loadNib()
        
        addSubViewWithLayout(view: viewContent)
        viewContent.frame = self.bounds
        
        NSLayoutConstraint.activate([
            viewContent.leadingAnchor.constraint(equalTo: leadingAnchor),
            viewContent.trailingAnchor.constraint(equalTo: trailingAnchor),
            viewContent.topAnchor.constraint(equalTo: topAnchor),
            viewContent.bottomAnchor.constraint(equalTo: bottomAnchor)
            ])
        
        initialDesign()
    }
    
    func initialDesign() {
        viewBorder.layer.cornerRadius = 10
        viewBorder.backgroundColor = CaliddaColors.white
        viewBorder.addShadowViewCustom(cornerRadius: 10.0)
        
        //imageViewIcon.image = DoctorImage.getImage(named: .iconProblem)
        imageViewIcon.image = CaliddaImage.getImage(named: .iconClose)
        imageViewIcon.contentMode = .scaleAspectFit
        
        labelTitle.text = DefaultText.title
        labelTitle.font = CaliddaFont.bold14
        //labelTitle.textColor = DoctorColors.greenOne
        labelTitle.textColor = CaliddaColors.purple
        
        labelDescription.text = DefaultText.description
        labelDescription.font = CaliddaFont.regular13
        labelDescription.textColor = CaliddaColors.darkGray
    }
    
}
