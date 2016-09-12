#!/usr/bin/swift
//
//  main.swift
//  TextMessage
//
//  Created by Luis  Costa on 24/08/16.
//  Copyright © 2016 Luis  Costa. All rights reserved.
//
// Teste teste
import Foundation

// Collecting textMessage and receiver phone number
func collectData() -> (String?, String?) {
    // Message to send
    print("Please, write your text message")
    let msgClient = readLine(stripNewline: true)
    
    // Collect the phone number
    print("Write the phone number that you want to send this message")
    let phoneNumber = readLine(stripNewline: true)
    
    return (msgClient, phoneNumber)
}

func sendTextMessage(msgClient: String?, phoneNumber: String?) {
    // Checking the optionals
    if let textMessageClient = msgClient, phoneNumberTextMessage = phoneNumber {
        // API URL
        let clockworkAPIURL = "https://api.clockworksms.com/http/send.aspx?"
        // API key: You can get your API key 
        // as soon as you sign up in clockworksms.com
        let clockworkAPIkey = "insert_your_own_clockworksms_API_key"
        
        // URL string
        var urlString = clockworkAPIURL
            + "key=" + clockworkAPIkey
            + "&to=" + phoneNumberTextMessage
            + "&content=" + textMessageClient
        // Replace " " for "+"
        // Example: http://www.your3favoritecodinglanguages.com/?names=python+swift+javascript
        // and not  http://www.your3favoritecodinglanguages.com/?names=python swift javascript 
        urlString = urlString.stringByReplacingOccurrencesOfString(" ", withString: "+")
        
        //NSURL
        if let clockworkSMSURL = NSURL(string: urlString),
            responseData = NSData(contentsOfURL: clockworkSMSURL) {
            let responseString = String(data: responseData, encoding: NSUTF8StringEncoding)
            print(responseString)
        }
    }
}

//main
let data = collectData()
sendTextMessage(data.0, phoneNumber: data.1)


