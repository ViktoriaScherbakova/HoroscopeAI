//
//  HoroscopePresenter.swift
//  TestH
//
//  Created by sherbakova on 18.08.2024.
//

import Foundation

protocol HoroscopePresenterProtocol {
    func requestHoroscope()
}

final class HoroscopePresenter {
    
    weak var view: HoroscopeViewController?
}

extension HoroscopePresenter: HoroscopePresenterProtocol {
    
    func requestHoroscope() {
        ApiManager.shared.requestData(model: Horoscope.self) { data in
            
            
        }
    }
}
