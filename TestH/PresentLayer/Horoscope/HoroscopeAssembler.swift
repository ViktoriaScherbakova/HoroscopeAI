//
//  HoroscopeAssembler.swift
//  TestH
//
//  Created by sherbakova on 18.08.2024.
//

import UIKit

struct HoroscopeAssembler {
    static func build(zodiac: ZodiacType, coordinator: AppCoordinator) -> HoroscopeViewControllerProtocol {
        let presenter = HoroscopePresenter()
        let view = HoroscopeViewController(presenter: presenter, coordinator: coordinator, zodiac: zodiac)
        presenter.view = view
        return view
    }
}
