//
//  ViewController.swift
//  StockRank
//
//  Created by Salvator Guarnera on 6/13/20.
//  Copyright © 2020 Spiralus, LLC. All rights reserved.
//

import UIKit
import FirebaseFunctions

class ViewController: UIViewController {
    
    let stockDict : [String : String] = ["MMM" : "3M Company", "ABT": "Abbott Laboratories", "ABBV": "AbbVie Inc.", "ABMD": "ABIOMED Inc", "ACN": "Accenture plc", "ATVI": "Activision Blizzard", "ADBE": "Adobe Inc.", "AMD": "Advanced Micro Devices Inc", "AAP": "Advance Auto Parts", "AES": "AES Corp", "AFL": "AFLAC Inc", "A": "Agilent Technologies Inc", "APD": "Air Products & Chemicals Inc", "AKAM": "Akamai Technologies Inc", "ALK": "Alaska Air Group Inc", "ALB": "Albemarle Corp", "ARE": "Alexandria Real Estate Equities", "ALXN": "Alexion Pharmaceuticals", "ALGN": "Align Technology", "ALLE": "Allegion", "ADS": "Alliance Data Systems", "LNT": "Alliant Energy Corp", "ALL": "Allstate Corp", "GOOGL": "Alphabet Inc. (Class A)", "GOOG": "Alphabet Inc. (Class C)", "MO": "Altria Group Inc", "AMZN": "Amazon.com Inc.", "AMCR": "Amcor plc", "AEE": "Ameren Corp", "AAL": "American Airlines Group", "AEP": "American Electric Power", "AXP": "American Express Co", "AIG": "American International Group", "AMT": "American Tower Corp.", "AWK": "American Water Works Company Inc", "AMP": "Ameriprise Financial", "ABC": "AmerisourceBergen Corp", "AME": "AMETEK Inc.", "AMGN": "Amgen Inc.", "APH": "Amphenol Corp", "ADI": "Analog Devices, Inc.", "ANSS": "ANSYS", "ANTM": "Anthem", "AON": "Aon plc", "AOS": "A.O. Smith Corp", "APA": "Apache Corporation", "AIV": "Apartment Investment & Management", "AAPL": "Apple Inc.", "AMAT": "Applied Materials Inc.", "APTV": "Aptiv PLC", "ADM": "Archer", "ANET": "Arista Networks", "AJG": "Arthur J. Gallagher & Co.", "AIZ": "Assurant", "T": "AT&T Inc.", "ATO": "Atmos Energy", "ADSK": "Autodesk Inc.", "ADP": "Automatic Data Processing", "AZO": "AutoZone Inc", "AVB": "AvalonBay Communities", "AVY": "Avery Dennison Corp", "BKR": "Baker Hughes Co", "BLL": "Ball Corp", "BAC": "Bank of America Corp", "BK": "The Bank of New York Mellon", "BAX": "Baxter International Inc.", "BDX": "Becton Dickinson", "BRK.B": "Berkshire Hathaway", "BBY": "Best Buy Co. Inc.", "BIIB": "Biogen Inc.", "BLK": "BlackRock", "BA": "Boeing Company", "BKNG": "Booking Holdings Inc", "BWA": "BorgWarner", "BXP": "Boston Properties", "BSX": "Boston Scientific", "BMY": "Bristol", "AVGO": "Broadcom Inc.", "BR": "Broadridge Financial Solutions", "BF.B": "Brown", "CHRW": "C. H. Robinson Worldwide", "COG": "Cabot Oil & Gas", "CDNS": "Cadence Design Systems", "CPB": "Campbell Soup", "COF": "Capital One Financial", "CAH": "Cardinal Health Inc.", "KMX": "Carmax Inc", "CCL": "Carnival Corp.", "CARR": "Carrier Global", "CAT": "Caterpillar Inc.", "CBOE": "Cboe Global Markets", "CBRE": "CBRE Group", "CDW": "CDW", "CE": "Celanese", "CNC": "Centene Corporation", "CNP": "CenterPoint Energy", "CTL": "CenturyLink Inc", "CERN": "Cerner", "CF": "CF Industries Holdings Inc", "SCHW": "Charles Schwab Corporation", "CHTR": "Charter Communications", "CVX": "Chevron Corp.", "CMG": "Chipotle Mexican Grill", "CB": "Chubb Limited", "CHD": "Church & Dwight", "CI": "CIGNA Corp.", "CINF": "Cincinnati Financial", "CTAS": "Cintas Corporation", "CSCO": "Cisco Systems", "C": "Citigroup Inc.", "CFG": "Citizens Financial Group", "CTXS": "Citrix Systems", "CLX": "The Clorox Company", "CME": "CME Group Inc.", "CMS": "CMS Energy", "KO": "Coca", "CTSH": "Cognizant Technology Solutions", "CL": "Colgate", "CMCSA": "Comcast Corp.", "CMA": "Comerica Inc.", "CAG": "Conagra Brands", "CXO": "Concho Resources", "COP": "ConocoPhillips", "ED": "Consolidated Edison", "STZ": "Constellation Brands", "COO": "The Cooper Companies", "CPRT": "Copart Inc", "GLW": "Corning Inc.", "CTVA": "Corteva", "COST": "Costco Wholesale Corp.", "COTY": "Coty, Inc", "CCI": "Crown Castle International Corp.", "CSX": "CSX Corp.", "CMI": "Cummins Inc.", "CVS": "CVS Health", "DHI": "D. R. Horton", "DHR": "Danaher Corp.", "DRI": "Darden Restaurants", "DVA": "DaVita Inc.", "DE": "Deere & Co.", "DAL": "Delta Air Lines Inc.", "XRAY": "Dentsply Sirona", "DVN": "Devon Energy", "DXCM": "DexCom", "FANG": "Diamondback Energy", "DLR": "Digital Realty Trust Inc", "DFS": "Discover Financial Services", "DISCA": "Discovery, Inc. (Class A)", "DISCK": "Discovery, Inc. (Class C)", "DISH": "Dish Network", "DG": "Dollar General", "DLTR": "Dollar Tree", "D": "Dominion Energy", "DPZ": "Domino's Pizza", "DOV": "Dover Corporation", "DOW": "Dow Inc.", "DTE": "DTE Energy Co.", "DUK": "Duke Energy", "DRE": "Duke Realty Corp", "DD": "DuPont de Nemours Inc", "DXC": "DXC Technology", "ETFC": "E*Trade", "EMN": "Eastman Chemical", "ETN": "Eaton Corporation", "EBAY": "eBay Inc.", "ECL": "Ecolab Inc.", "EIX": "Edison Int'l", "EW": "Edwards Lifesciences", "EA": "Electronic Arts", "EMR": "Emerson Electric Company", "ETR": "Entergy Corp.", "EOG": "EOG Resources", "EFX": "Equifax Inc.", "EQIX": "Equinix", "EQR": "Equity Residential", "ESS": "Essex Property Trust, Inc.", "EL": "Estée Lauder Companies", "EVRG": "Evergy", "ES": "Eversource Energy", "RE": "Everest Re Group Ltd.", "EXC": "Exelon Corp.", "EXPE": "Expedia Group", "EXPD": "Expeditors", "EXR": "Extra Space Storage", "XOM": "Exxon Mobil Corp.", "FFIV": "F5 Networks", "FB": "Facebook, Inc.", "FAST": "Fastenal Co", "FRT": "Federal Realty Investment Trust", "FDX": "FedEx Corporation", "FIS": "Fidelity National Information Services", "FITB": "Fifth Third Bancorp", "FE": "FirstEnergy Corp", "FRC": "First Republic Bank", "FISV": "Fiserv Inc", "FLT": "FleetCor Technologies Inc", "FLIR": "FLIR Systems", "FLS": "Flowserve Corporation", "FMC": "FMC Corporation", "F": "Ford Motor Company", "FTNT": "Fortinet", "FTV": "Fortive Corp", "FBHS": "Fortune Brands Home & Security", "FOXA": "Fox Corporation (Class A)", "FOX": "Fox Corporation (Class B)", "BEN": "Franklin Resources", "FCX": "Freeport", "GPS": "Gap Inc.", "GRMN": "Garmin Ltd.", "IT": "Gartner Inc", "GD": "General Dynamics", "GE": "General Electric", "GIS": "General Mills", "GM": "General Motors", "GPC": "Genuine Parts", "GILD": "Gilead Sciences", "GL": "Globe Life Inc.", "GPN": "Global Payments Inc.", "GS": "Goldman Sachs Group", "GWW": "Grainger (W.W.) Inc.", "HRB": "H&R Block", "HAL": "Halliburton Co.", "HBI": "Hanesbrands Inc", "HOG": "Harley", "HIG": "Hartford Financial Svc.Gp.", "HAS": "Hasbro Inc.", "HCA": "HCA Healthcare", "PEAK": "Healthpeak Properties", "HSIC": "Henry Schein", "HSY": "The Hershey Company", "HES": "Hess Corporation", "HPE": "Hewlett Packard Enterprise", "HLT": "Hilton Worldwide Holdings Inc", "HFC": "HollyFrontier Corp", "HOLX": "Hologic", "HD": "Home Depot", "HON": "Honeywell Int'l Inc.", "HRL": "Hormel Foods Corp.", "HST": "Host Hotels & Resorts", "HWM": "Howmet Aerospace", "HPQ": "HP Inc.", "HUM": "Humana Inc.", "HBAN": "Huntington Bancshares", "HII": "Huntington Ingalls Industries", "IEX": "IDEX Corporation", "IDXX": "IDEXX Laboratories", "INFO": "IHS Markit Ltd.", "ITW": "Illinois Tool Works", "ILMN": "Illumina Inc", "INCY": "Incyte", "IR": "Ingersoll Rand", "INTC": "Intel Corp.", "ICE": "Intercontinental Exchange", "IBM": "International Business Machines", "IP": "International Paper", "IPG": "Interpublic Group", "IFF": "Intl Flavors & Fragrances", "INTU": "Intuit Inc.", "ISRG": "Intuitive Surgical Inc.", "IVZ": "Invesco Ltd.", "IPGP": "IPG Photonics Corp.", "IQV": "IQVIA Holdings Inc.", "IRM": "Iron Mountain Incorporated", "JKHY": "Jack Henry & Associates", "J": "Jacobs Engineering Group", "JBHT": "J. B. Hunt Transport Services", "SJM": "JM Smucker", "JNJ": "Johnson & Johnson", "JCI": "Johnson Controls International", "JPM": "JPMorgan Chase & Co.", "JNPR": "Juniper Networks", "KSU": "Kansas City Southern", "K": "Kellogg Co.", "KEY": "KeyCorp", "KEYS": "Keysight Technologies", "KMB": "Kimberly", "KIM": "Kimco Realty", "KMI": "Kinder Morgan", "KLAC": "KLA Corporation", "KSS": "Kohl's Corp.", "KHC": "Kraft Heinz Co", "KR": "Kroger Co.", "LB": "L Brands Inc.", "LHX": "L3Harris Technologies", "LH": "Laboratory Corp. of America Holding", "LRCX": "Lam Research", "LW": "Lamb Weston Holdings Inc", "LVS": "Las Vegas Sands", "LEG": "Leggett & Platt", "LDOS": "Leidos Holdings", "LEN": "Lennar Corp.", "LLY": "Lilly (Eli) & Co.", "LNC": "Lincoln National", "LIN": "Linde plc", "LYV": "Live Nation Entertainment", "LKQ": "LKQ Corporation", "LMT": "Lockheed Martin Corp.", "L": "Loews Corp.", "LOW": "Lowe's Cos.", "LYB": "LyondellBasell", "MTB": "M&T Bank Corp.", "MRO": "Marathon Oil Corp.", "MPC": "Marathon Petroleum", "MKTX": "MarketAxess", "MAR": "Marriott Int'l.", "MMC": "Marsh & McLennan", "MLM": "Martin Marietta Materials", "MAS": "Masco Corp.", "MA": "Mastercard Inc.", "MKC": "McCormick & Co.", "MXIM": "Maxim Integrated Products Inc", "MCD": "McDonald's Corp.", "MCK": "McKesson Corp.", "MDT": "Medtronic plc", "MRK": "Merck & Co.", "MET": "MetLife Inc.", "MTD": "Mettler Toledo", "MGM": "MGM Resorts International", "MCHP": "Microchip Technology", "MU": "Micron Technology", "MSFT": "Microsoft Corp.", "MAA": "Mid", "MHK": "Mohawk Industries", "TAP": "Molson Coors Brewing Company", "MDLZ": "Mondelez International", "MNST": "Monster Beverage", "MCO": "Moody's Corp", "MS": "Morgan Stanley", "MOS": "The Mosaic Company", "MSI": "Motorola Solutions Inc.", "MSCI": "MSCI Inc", "MYL": "Mylan N.V.", "NDAQ": "Nasdaq, Inc.", "NOV": "National Oilwell Varco Inc.", "NTAP": "NetApp", "NFLX": "Netflix Inc.", "NWL": "Newell Brands", "NEM": "Newmont Corporation", "NWSA": "News Corp. Class A", "NWS": "News Corp. Class B", "NEE": "NextEra Energy", "NLSN": "Nielsen Holdings", "NKE": "Nike", "NI": "NiSource Inc.", "NBL": "Noble Energy Inc", "JWN": "Nordstrom", "NSC": "Norfolk Southern Corp.", "NTRS": "Northern Trust Corp.", "NOC": "Northrop Grumman", "NLOK": "NortonLifeLock", "NCLH": "Norwegian Cruise Line Holdings", "NRG": "NRG Energy", "NUE": "Nucor Corp.", "NVDA": "Nvidia Corporation", "NVR": "NVR Inc", "ORLY": "O'Reilly Automotive", "OXY": "Occidental Petroleum", "ODFL": "Old Dominion Freight Line", "OMC": "Omnicom Group", "OKE": "ONEOK", "ORCL": "Oracle Corp.", "OTIS": "Otis Worldwide", "PCAR": "PACCAR Inc.", "PKG": "Packaging Corporation of America", "PH": "Parker", "PAYX": "Paychex Inc.", "PAYC": "Paycom", "PYPL": "PayPal", "PNR": "Pentair plc", "PBCT": "People's United Financial", "PEP": "PepsiCo Inc.", "PKI": "PerkinElmer", "PRGO": "Perrigo", "PFE": "Pfizer Inc.", "PM": "Philip Morris International", "PSX": "Phillips 66", "PNW": "Pinnacle West Capital", "PXD": "Pioneer Natural Resources", "PNC": "PNC Financial Services", "PPG": "PPG Industries", "PPL": "PPL Corp.", "PFG": "Principal Financial Group", "PG": "Procter & Gamble", "PGR": "Progressive Corp.", "PLD": "Prologis", "PRU": "Prudential Financial", "PEG": "Public Serv. Enterprise Inc.", "PSA": "Public Storage", "PHM": "PulteGroup", "PVH": "PVH Corp.", "QRVO": "Qorvo", "PWR": "Quanta Services Inc.", "QCOM": "QUALCOMM Inc.", "DGX": "Quest Diagnostics", "RL": "Ralph Lauren Corporation", "RJF": "Raymond James Financial Inc.", "RTX": "Raytheon Technologies", "O": "Realty Income Corporation", "REG": "Regency Centers Corporation", "REGN": "Regeneron Pharmaceuticals", "RF": "Regions Financial Corp.", "RSG": "Republic Services Inc", "RMD": "ResMed", "RHI": "Robert Half International", "ROK": "Rockwell Automation Inc.", "ROL": "Rollins Inc.", "ROP": "Roper Technologies", "ROST": "Ross Stores", "RCL": "Royal Caribbean Cruises Ltd", "SPGI": "S&P Global, Inc.", "CRM": "Salesforce.com", "SBAC": "SBA Communications", "SLB": "Schlumberger Ltd.", "STX": "Seagate Technology", "SEE": "Sealed Air", "SRE": "Sempra Energy", "NOW": "ServiceNow", "SHW": "Sherwin", "SPG": "Simon Property Group Inc", "SWKS": "Skyworks Solutions", "SLG": "SL Green Realty", "SNA": "Snap", "SO": "Southern Company", "LUV": "Southwest Airlines", "SWK": "Stanley Black & Decker", "SBUX": "Starbucks Corp.", "STT": "State Street Corp.", "STE": "STERIS plc", "SYK": "Stryker Corp.", "SIVB": "SVB Financial", "SYF": "Synchrony Financial", "SNPS": "Synopsys Inc.", "SYY": "Sysco Corp.", "TMUS": "T", "TROW": "T. Rowe Price Group", "TTWO": "Take", "TPR": "Tapestry, Inc.", "TGT": "Target Corp.", "TEL": "TE Connectivity Ltd.", "FTI": "TechnipFMC", "TFX": "Teleflex", "TXN": "Texas Instruments", "TXT": "Textron Inc.", "TMO": "Thermo Fisher Scientific", "TIF": "Tiffany & Co.", "TJX": "TJX Companies Inc.", "TSCO": "Tractor Supply Company", "TT": "Trane Technologies plc", "TDG": "TransDigm Group", "TRV": "The Travelers Companies Inc.", "TFC": "Truist Financial", "TWTR": "Twitter, Inc.", "TSN": "Tyson Foods", "UDR": "UDR, Inc.", "ULTA": "Ulta Beauty", "USB": "U.S. Bancorp", "UAA": "Under Armour (Class A)", "UA": "Under Armour (Class C)", "UNP": "Union Pacific Corp", "UAL": "United Airlines Holdings", "UNH": "United Health Group Inc.", "UPS": "United Parcel Service", "URI": "United Rentals, Inc.", "UHS": "Universal Health Services, Inc.", "UNM": "Unum Group", "VFC": "V.F. Corp.", "VLO": "Valero Energy", "VAR": "Varian Medical Systems", "VTR": "Ventas Inc", "VRSN": "Verisign Inc.", "VRSK": "Verisk Analytics", "VZ": "Verizon Communications", "VRTX": "Vertex Pharmaceuticals Inc", "VIAC": "ViacomCBS", "V": "Visa Inc.", "VNO": "Vornado Realty Trust", "VMC": "Vulcan Materials", "WRB": "W. R. Berkley Corporation", "WAB": "Wabtec Corporation", "WMT": "Walmart", "WBA": "Walgreens Boots Alliance", "DIS": "The Walt Disney Company", "WM": "Waste Management Inc.", "WAT": "Waters Corporation", "WEC": "WEC Energy Group", "WFC": "Wells Fargo", "WELL": "Welltower Inc.", "WST": "West Pharmaceutical Services", "WDC": "Western Digital", "WU": "Western Union Co", "WRK": "WestRock", "WY": "Weyerhaeuser", "WHR": "Whirlpool Corp.", "WMB": "Williams Cos.", "WLTW": "Willis Towers Watson", "WYNN": "Wynn Resorts Ltd", "XEL": "Xcel Energy Inc", "XRX": "Xerox", "XLNX": "Xilinx", "XYL": "Xylem Inc.", "YUM": "Yum! Brands Inc", "ZBRA": "Zebra Technologies", "ZBH": "Zimmer Biomet Holdings", "ZION": "Zions Bancorp", "ZTS": "Zoetis"]
    
    //Declare views
    let welcomeLabel = ObjectBuilder.shared.buildLabel(text: "Welcome to StockRank!", textSize: Constants.shared.widthBased(val: 20), textColor: UIColor.darkGray, textAlignment: .center)
    let continueButton = ObjectBuilder.shared.buildButton(text: "Continue", textSize: Constants.shared.widthBased(val: 18), textColor: UIColor.white, buttonColor: Constants.shared.GET_BLUE(), cornerRadius: 15)
    let appIcon = ObjectBuilder.shared.appIcon()
    
    lazy var functions = Functions.functions()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
        setupConstraints()
    }
    
    func databaseFill(){
        functions.httpsCallable("setupStocks").call(["stockDict" : stockDict]) { (result, error) in
            if let error = error as NSError?{
                if error.domain == FunctionsErrorDomain{
                    let code = FunctionsErrorCode(rawValue: error.code)
                    let message = error.localizedDescription
                    let details = error.userInfo[FunctionsErrorDetailsKey]
                    print(message)
                }
            }
            if let text = (result?.data as? [String : Any])?["MMM"] as? String{
                print(text)
            }
        }
    }
    
    override func viewWillAppear(_ animated: Bool) {
        self.navigationController?.isNavigationBarHidden = true
    }
    
    func setupConstraints(){
        
        self.view.addSubview(appIcon)
        appIcon.translatesAutoresizingMaskIntoConstraints = false
        appIcon.topAnchor.constraint(equalTo: self.view.safeAreaLayoutGuide.topAnchor, constant: Constants.shared.widthBased(val: 10)).isActive = true
        appIcon.centerXAnchor.constraint(equalTo: self.view.centerXAnchor, constant: 0).isActive = true
        appIcon.widthAnchor.constraint(equalToConstant: Constants.shared.widthBased(val: 50)).isActive = true
        appIcon.heightAnchor.constraint(equalToConstant: Constants.shared.widthBased(val: 50)).isActive = true
        
        self.view.addSubview(welcomeLabel)
        welcomeLabel.translatesAutoresizingMaskIntoConstraints = false
        welcomeLabel.centerXAnchor.constraint(equalTo: self.view.centerXAnchor).isActive = true
        welcomeLabel.centerYAnchor.constraint(equalTo: self.view.centerYAnchor, constant: -UIScreen.main.bounds.height * 0.1).isActive = true
        
        self.view.addSubview(continueButton)
        continueButton.translatesAutoresizingMaskIntoConstraints = false
        continueButton.topAnchor.constraint(equalTo: self.view.centerYAnchor, constant: UIScreen.main.bounds.width * 0.1).isActive = true
        continueButton.widthAnchor.constraint(equalToConstant: UIScreen.main.bounds.width * 0.3).isActive = true
        continueButton.heightAnchor.constraint(equalToConstant: UIScreen.main.bounds.width * 0.125).isActive = true
        continueButton.centerXAnchor.constraint(equalTo: self.view.centerXAnchor).isActive = true
        
        continueButton.addTarget(self, action: #selector(buttonPressed), for: .touchUpInside)
        continueButton.addTarget(self, action: #selector(buttonHeld), for: .touchDown)
        continueButton.addTarget(self, action: #selector(buttonCancel), for: .touchDragExit)
    }
    
    @objc func buttonPressed(sender : UIButton){
        sender.alpha = 1
        if let navigator = self.navigationController{
            if let nextView = self.storyboard?.instantiateViewController(identifier: "IntroductionViewController") as? IntroductionViewController{
                navigator.pushViewController(nextView, animated: true)
            }
        }
    }
    
    @objc func buttonHeld(sender : UIButton){
        sender.alpha = 0.75
    }
    
    @objc func buttonCancel(sender : UIButton){
        sender.alpha = 1
    }


}

