//
//  AccountStorage.swift
//  Straight Outta Casti
//
//  Created by Vanessa Woo on 3/2/17.
//  Copyright © 2017 Attendance App. All rights reserved.
//

import Foundation

class AccountStorage {
    fileprivate let documentsDirectoryURL = FileManager.default
        .urls(for: .documentDirectory, in: .userDomainMask)
        .first!
    
    fileprivate var accountsFileURL: URL {
        return documentsDirectoryURL
            .appendingPathComponent("Accounts")
            .appendingPathExtension("plist")
    }
    
    func save(_ accounts: [Account]) {
        let accountsPlist = accounts.map { $0.plistRepresentation } as NSArray
        accountsPlist.write(to: accountsFileURL, atomically: true)
    }
    
    func fetchAccounts() -> [Account] {
        guard let accountPlists = NSArray(contentsOf: accountsFileURL) as? [[String: AnyObject]] else {
            return []
        }
        return accountPlists.map(Account.init(plist:))
    }
}
