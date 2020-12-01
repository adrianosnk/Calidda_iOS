//
//  RegisterPresenter.swift
//  App
//
//  Created by Raul Quispe on 5/31/20.
//  Copyright © 2020 Raul Quispe. All rights reserved.
//

import UIKit

struct ChangeLoginLinkPasswordPresenter {
    private var service:AuthenticationService!
    init(loginService:AuthenticationService) {
        service = loginService
    }
}
