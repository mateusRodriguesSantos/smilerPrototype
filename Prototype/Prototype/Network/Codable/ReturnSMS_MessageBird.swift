//
//  ReturnSMS_MessageBird.swift
//  Smiler
//
//  Created by Mateus Rodrigues on 30/05/21.
//

import Foundation

struct ReturnSMS_MessageBird:Decodable{
    var id:String?
    var href:String?
    var direction:String?
    var type:String?
    var originator:String?
    var body:String?
    var reference:String?
    var validity:Int?
    var gateway:Int?
    var metadata:Metadata_MessageBird?
    var typeDetails:TypeDetails_MessageBird?
    var datacoding:String?
    var mclass:Int?
    var scheduledDatetime:Date?
    var createdDatetime:String?
    var recipients:Recipient_MessageBird?
}

struct TypeDetails_MessageBird:Decodable{

}

struct Metadata_MessageBird:Decodable{
    var acceptedAt:String?
}

struct Recipient_MessageBird:Decodable{
    var totalCount:Int?
    var totalSentCount:Int?
    var totalDeliveredCount:Int?
    var totalDeliveryFailedCount:Int?
    var items:[Item_MessageBird]?
}

struct Item_MessageBird:Decodable {
    var recipient:Int?
    var status:String?
    var statusDatetime:String?
    var recipientCountry:String?
    var recipientCountryPrefix:Int?
    var recipientOperator:String?
    var messageLength:Int?
    var statusReason:String?
    var price:Price_MessageBird?
    var mccmnc:String?
    var mcc:String?
    var mnc:String?
    var messagePartCount:Int?
}

struct Price_MessageBird:Decodable {
    var amount:Float?
    var currency:String?
}
