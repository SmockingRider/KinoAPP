//
//  CinemasList.swift
//  KinoApp
//
//  Created by Seidaly Rustem on 30.01.2023.
//

import Foundation
import UIKit


class CinemasList {
    var cinemas = [Cinema]()
    init() {
        let Kino1 = Cinema(name: "Cinemax Dostyk Multiplex", image:UIImage(named: "Cinemax") , address: "Samal-2street Zholdasbekiva")
        let Kino2 = Cinema(name: "Lumiera Cinema", image:UIImage(named: "lumiera") , address: "Abylai-khana 62, Arbat")
        let Kino3 = Cinema(name: "Kinopark 11(Yessentai)", image: UIImage(named: "KinoparkYessentai") , address: "Essentai Mall")
        let Kino4 = Cinema(name: "Kinoforum 10", image: UIImage(named: "Kinoforum") , address: "Forum, Seifulina street")
        let Kino5 = Cinema(name: "Chaplin", image: UIImage(named: "chaplin") , address: "Rozibakieva, 24")
        let Kino6 = Cinema(name: "KinoPark 5 Premium Forum", image: UIImage(named: "kinoprak") , address: "Forum, Seifulina street")
        let Kino7 = Cinema(name: "ARMAN 3D (Dostyk)", image: UIImage(named: "arman") , address: "Dostyk 104")
        let Kino8 = Cinema(name: "Cesar", image: UIImage(named: "Cesar") , address: "Nazarbayev 50")
        let Kino9 = Cinema(name: "KinoPark 6", image: UIImage(named: "sputnik") , address: "Mamyr - 1 ")
        cinemas = [Kino1, Kino2, Kino3,Kino4,Kino5,Kino6,Kino7,Kino8,Kino9]
    }
}
