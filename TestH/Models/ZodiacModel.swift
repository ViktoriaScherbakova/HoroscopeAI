//
//  ZodiacModel.swift
//  TestH
//
//  Created by sherbakova on 16.08.2024.
//

import UIKit

enum ZodiacType: String, CaseIterable {
    case aries
    case taurus
    case gemini
    case cancer
    case leo
    case virgo
    case libra
    case scorpio
    case sagittarius
    case capricorn
    case acuarius
    case pisces
}

extension ZodiacType {
    
    var model: ZodiacModel {
        switch self {
        case .aries:
            return ZodiacModel(name: "Aries".localized(), 
                               period: "AriesPeriod".localized(),
                               image: UIImage(named: "ariesConstellation"),
                               icon: UIImage(named: "ariesIcon"))
        case .taurus:
            return ZodiacModel(name: "Taurus".localized(), 
                               period: "TaurusPeriod".localized(),
                               image: UIImage(named: "taurusConstellation"),
                               icon: UIImage(named: "taurusIcon"))
        case .gemini:
            return ZodiacModel(name: "Gemini".localized(), 
                               period: "GeminiPeriod".localized(),
                               image: UIImage(named: "geminiConstellation"),
                               icon: UIImage(named: "geminiIcon"))
        case .cancer:
            return ZodiacModel(name: "Cancer".localized(), 
                               period: "CancerPeriod".localized(),
                               image: UIImage(named: "cancerConstellation"),
                               icon: UIImage(named: "cancerIcon"))
        case .leo:
            return ZodiacModel(name: "Leo".localized(), 
                               period: "LeoPeriod".localized(),
                               image: UIImage(named: "leoConstellation"),
                               icon: UIImage(named: "leoIcon"))
        case .virgo:
            return ZodiacModel(name: "Virgo".localized(), 
                               period: "VirgoPeriod".localized(),
                               image: UIImage(named: "virgoConstellation"),
                               icon: UIImage(named: "virgoIcon"))
        case .libra:
            return ZodiacModel(name: "Libra".localized(),
                               period: "LibraPeriod".localized(),
                               image: UIImage(named: "libraConstellation"),
                               icon: UIImage(named: "libraIcon"))
        case .scorpio:
            return ZodiacModel(name: "Scorpio".localized(), 
                               period: "ScorpioPeriod".localized(),
                               image: UIImage(named: "scorpioConstellation"),
                               icon: UIImage(named: "scorpioIcon"))
        case .sagittarius:
            return ZodiacModel(name: "Sagittarius".localized(), 
                               period: "SagittariusPeriod".localized(),
                               image: UIImage(named: "sagittariusConstellation"),
                               icon: UIImage(named: "sagittariusIcon"))
        case .capricorn:
            return ZodiacModel(name: "Capricorn".localized(), 
                               period: "CapricornPeriod".localized(),
                               image: UIImage(named: "capricornConstellation"),
                               icon: UIImage(named: "capricornIcon"))
        case .acuarius:
            return ZodiacModel(name: "Aquarius".localized(),
                               period: "AquariusPeriod".localized(),
                               image: UIImage(named: "aquariusConstellation"),
                               icon: UIImage(named: "aquariusIcon"))
        case .pisces:
            return ZodiacModel(name: "Pisces".localized(), 
                               period: "PiscesPeriod".localized(),
                               image: UIImage(named: "piscesConstellation"),
                               icon: UIImage(named: "piscesIcon"))
        }
    }
}

struct ZodiacModel {
    let name: String
    let period: String
    let image: UIImage?
    let icon: UIImage?
}
