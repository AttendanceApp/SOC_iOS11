//
//  StateController.swift
//  Straight Outta Casti
//
//  Created by Vanessa Woo on 3/6/17.
//  Copyright © 2017 Attendance App. All rights reserved.
//

import Foundation

class StateController {
    fileprivate let accountStorage: AccountStorage
    fileprivate(set) var accounts: [Account]
    
    init(accountStorage: AccountStorage) {
        self.accountStorage = accountStorage
        self.accounts = accountStorage.fetchAccounts()
    }
    
    func set(_ userInfo: Account) {
        self.accounts.removeAll()
        self.accounts.append(userInfo)
        accountStorage.save(self.accounts)
    }
    
    func get() -> Account {
        if accountStorage.fetchAccounts().count > 0 {
            return accountStorage.fetchAccounts()[0]
        } else {
            return Account(firstName: "No", lastName: "Account", teacher: false)
        }
    }
    
    func hasUserInfo() -> Bool {
        let userInfoArray = self.accountStorage.fetchAccounts()
        if userInfoArray.count > 0 {
            return true
        } else {
            return false
        }
        
    }
    
}
