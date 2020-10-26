//
//  UserData.swift
//  Calidda
//
//  Created by MacAdrian on 10/22/20.
//  Copyright © 2020 Calidda. All rights reserved.
//

import UIKit

struct DoctorInfo: Codable {
    var success:Bool
    var data:DoctorProperties!
}
struct DoctorProperties:Codable {

    var id:Int!
    var first_name:String!
    var last_name:String!
    var sex:String!
    var speciality:String!
    var phone:String!
    var address:String!
    var curriculum:String!
    var number_stars:String!
    var number_recommendations:Int!
    var workplace:String!
    var photo:String!
    var number_record:String!
    var professional_studies:String!
    var work_experience:String!
    var about_me:String!
    var area_interest:String!
    
    var bank:HomeBank!
    var bank_owner:String!
    var bank_num_doc:String!
    var bank_email:String!
    var bank_account_number:String!
    var bank_cci:String!
    var services:[HomeServices]!
}

struct HomeBank:Codable {
    var idBank:Int!
    var code:String!
    var name:String!
    var weight:Int!
}

struct HomeServices:Codable {
    var service_id:Int!
    var service_code:String!
    var service_name:String!
    var service_description:String!
    var cost_pen:String!
    var cost_usd:String!
    var duration:String!
    var accept_free:Bool!
    var is_active:Bool!
}

