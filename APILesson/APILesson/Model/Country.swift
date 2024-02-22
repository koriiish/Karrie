//
//  Country.swift
//  APILesson
//
//  Created by berdy on 22.02.24.
//

import Foundation

struct Country: Codable {
    let name: Name
    let tld: [String]?
    let cca2: String
    let ccn3: String?
    let cca3: String
    let cioc: String?
    let independent: Bool?
    let status: Status
    let unMember: Bool
    let currencies: Currencies?
    let idd: Idd
    let capital: [String]?
    let altSpellings: [String]
    let region: Region
    let subregion: String?
    let languages: [String: String]?
    let translations: [String: Translation]
    let latlng: [Double]
    let landlocked: Bool
    let borders: [String]?
    let area: Double
    let demonyms: Demonyms?
    let flag: String?
    let maps: Maps
    let population: Int
    let gini: [String: Double]?
    let fifa: String?
    let car: Car
    let timezones: [String]
    let continents: [Continent]
    let flags: [String]
}

// MARK: - Car
struct Car: Codable {
    let signs: [String]?
    let side: Side
}

enum Side: String, Codable {
    case sideLeft = "left"
    case sideRight = "right"
}

enum Continent: String, Codable {
    case africa = "Africa"
    case antarctica = "Antarctica"
    case asia = "Asia"
    case europe = "Europe"
    case northAmerica = "North America"
    case oceania = "Oceania"
    case southAmerica = "South America"
}

// MARK: - Currencies
struct Currencies: Codable {
    let xaf, stn, eur, usd: Aed?
    let khr, xof, nio, twd: Aed?
    let mad: Aed?
    let sdg: BAM?
    let kzt, gbp, shp, xcd: Aed?
    let kmf, mkd, aud, tvd: Aed?
    let gtq, bhd, idr, kyd: Aed?
    let fkp, mmk, syp, dzd: Aed?
    let mvr, btn, inr, top: Aed?
    let mru, ils, afn, qar: Aed?
    let jmd, omr, tzs, hnl: Aed?
    let kpw, rwf, sbd, szl: Aed?
    let zar, irr, gel, kgs: Aed?
    let lkr, sos, gmd, ngn: Aed?
    let clp, mop, currenciesTRY, pgk: Aed?
    let nzd, chf, isk, krw: Aed?
    let bif, jpy, kid, dkk: Aed?
    let kwd, ron, ang, gnf: Aed?
    let dop, jep, bmd, egp: Aed?
    let xpf, byn, huf, gyd: Aed?
    let lyd, tnd, ugx, sll: Aed?
    let amd, yer, azn, fjd: Aed?
    let nad, brl, tmt, ghs: Aed?
    let pyg, cdf, fok, ggp: Aed?
    let cop, rub, pkr, bsd: Aed?
    let cad, sek, vnd, lbp: Aed?
    let tjs, iqd, crc, rsd: Aed?
    let scr, uah, awg, mdl: Aed?
    let srd, bnd, sgd, cve: Aed?
    let mnt, lrd, pln, lak: Aed?
    let myr, mur, pen: Aed?
    let bam: BAM?
    let imp, vuv, bob, uzs: Aed?
    let php, cuc, cup, ves: Aed?
    let bzd, jod, mxn, aed: Aed?
    let ttd, bbd, cny, bgn: Aed?
    let djf, hkd, pab, thb: Aed?
    let kes, nok, etb, zmw: Aed?
    let ern, mzn, uyu, aoa: Aed?
    let ssp, czk, htg, ckd: Aed?
    let mga, bdt, mwk, npr: Aed?
    let zwl, wst, all, ars: Aed?
    let bwp, sar, gip, lsl: Aed?

    enum CodingKeys: String, CodingKey {
        case xaf = "XAF"
        case stn = "STN"
        case eur = "EUR"
        case usd = "USD"
        case khr = "KHR"
        case xof = "XOF"
        case nio = "NIO"
        case twd = "TWD"
        case mad = "MAD"
        case sdg = "SDG"
        case kzt = "KZT"
        case gbp = "GBP"
        case shp = "SHP"
        case xcd = "XCD"
        case kmf = "KMF"
        case mkd = "MKD"
        case aud = "AUD"
        case tvd = "TVD"
        case gtq = "GTQ"
        case bhd = "BHD"
        case idr = "IDR"
        case kyd = "KYD"
        case fkp = "FKP"
        case mmk = "MMK"
        case syp = "SYP"
        case dzd = "DZD"
        case mvr = "MVR"
        case btn = "BTN"
        case inr = "INR"
        case top = "TOP"
        case mru = "MRU"
        case ils = "ILS"
        case afn = "AFN"
        case qar = "QAR"
        case jmd = "JMD"
        case omr = "OMR"
        case tzs = "TZS"
        case hnl = "HNL"
        case kpw = "KPW"
        case rwf = "RWF"
        case sbd = "SBD"
        case szl = "SZL"
        case zar = "ZAR"
        case irr = "IRR"
        case gel = "GEL"
        case kgs = "KGS"
        case lkr = "LKR"
        case sos = "SOS"
        case gmd = "GMD"
        case ngn = "NGN"
        case clp = "CLP"
        case mop = "MOP"
        case currenciesTRY = "TRY"
        case pgk = "PGK"
        case nzd = "NZD"
        case chf = "CHF"
        case isk = "ISK"
        case krw = "KRW"
        case bif = "BIF"
        case jpy = "JPY"
        case kid = "KID"
        case dkk = "DKK"
        case kwd = "KWD"
        case ron = "RON"
        case ang = "ANG"
        case gnf = "GNF"
        case dop = "DOP"
        case jep = "JEP"
        case bmd = "BMD"
        case egp = "EGP"
        case xpf = "XPF"
        case byn = "BYN"
        case huf = "HUF"
        case gyd = "GYD"
        case lyd = "LYD"
        case tnd = "TND"
        case ugx = "UGX"
        case sll = "SLL"
        case amd = "AMD"
        case yer = "YER"
        case azn = "AZN"
        case fjd = "FJD"
        case nad = "NAD"
        case brl = "BRL"
        case tmt = "TMT"
        case ghs = "GHS"
        case pyg = "PYG"
        case cdf = "CDF"
        case fok = "FOK"
        case ggp = "GGP"
        case cop = "COP"
        case rub = "RUB"
        case pkr = "PKR"
        case bsd = "BSD"
        case cad = "CAD"
        case sek = "SEK"
        case vnd = "VND"
        case lbp = "LBP"
        case tjs = "TJS"
        case iqd = "IQD"
        case crc = "CRC"
        case rsd = "RSD"
        case scr = "SCR"
        case uah = "UAH"
        case awg = "AWG"
        case mdl = "MDL"
        case srd = "SRD"
        case bnd = "BND"
        case sgd = "SGD"
        case cve = "CVE"
        case mnt = "MNT"
        case lrd = "LRD"
        case pln = "PLN"
        case lak = "LAK"
        case myr = "MYR"
        case mur = "MUR"
        case pen = "PEN"
        case bam = "BAM"
        case imp = "IMP"
        case vuv = "VUV"
        case bob = "BOB"
        case uzs = "UZS"
        case php = "PHP"
        case cuc = "CUC"
        case cup = "CUP"
        case ves = "VES"
        case bzd = "BZD"
        case jod = "JOD"
        case mxn = "MXN"
        case aed = "AED"
        case ttd = "TTD"
        case bbd = "BBD"
        case cny = "CNY"
        case bgn = "BGN"
        case djf = "DJF"
        case hkd = "HKD"
        case pab = "PAB"
        case thb = "THB"
        case kes = "KES"
        case nok = "NOK"
        case etb = "ETB"
        case zmw = "ZMW"
        case ern = "ERN"
        case mzn = "MZN"
        case uyu = "UYU"
        case aoa = "AOA"
        case ssp = "SSP"
        case czk = "CZK"
        case htg = "HTG"
        case ckd = "CKD"
        case mga = "MGA"
        case bdt = "BDT"
        case mwk = "MWK"
        case npr = "NPR"
        case zwl = "ZWL"
        case wst = "WST"
        case all = "ALL"
        case ars = "ARS"
        case bwp = "BWP"
        case sar = "SAR"
        case gip = "GIP"
        case lsl = "LSL"
    }
}

// MARK: - Aed
struct Aed: Codable {
    let name, symbol: String
}

// MARK: - BAM
struct BAM: Codable {
    let name: String
}

// MARK: - Demonyms
struct Demonyms: Codable {
    let eng: Eng
    let fra: Eng?
}

// MARK: - Eng
struct Eng: Codable {
    let f, m: String
}

// MARK: - Idd
struct Idd: Codable {
    let root: String?
    let suffixes: [String]?
}

// MARK: - Maps
struct Maps: Codable {
    let googleMaps, openStreetMaps: String
}

// MARK: - Name
struct Name: Codable {
    let common, official: String
    let nativeName: [String: Translation]?
}

// MARK: - Translation
struct Translation: Codable {
    let official, common: String
}

enum Region: String, Codable {
    case africa = "Africa"
    case americas = "Americas"
    case antarctic = "Antarctic"
    case asia = "Asia"
    case europe = "Europe"
    case oceania = "Oceania"
}

enum Status: String, Codable {
    case officiallyAssigned = "officially-assigned"
    case userAssigned = "user-assigned"
}
