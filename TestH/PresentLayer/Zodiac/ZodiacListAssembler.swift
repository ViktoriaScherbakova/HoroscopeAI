//
//  ZodiacListAssembler.swift
//  TestH
//
//  Created by sherbakova on 18.08.2024.
//

import Foundation

struct ZodiacListAssembler {
    static func build(coordinator: AppCoordinator) -> ZodiacListViewControllerProtocol {
        let presenter = ZodiacListPresenter()
        let view = ZodiacListViewController(coordinator: coordinator, presenter: presenter)
        presenter.view = view
        return view
    }
}
