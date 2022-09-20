//
//  MenuService.swift
//  JobReadinessChallenge
//
//  Created by Dante Cervantes on 19/09/22.
//

import Foundation

struct MenuService {
    let menuItems = [MenuItem(iconName: "house", title: "Inicio"), MenuItem(iconName: "minus.magnifyingglass", title: "Buscar"), MenuItem(iconName: "bell.fill", title: "Notificaciones"), MenuItem(iconName: "bag.fill", title: "Mis Compras"), MenuItem(iconName: "heart", title: "Favoritos"), MenuItem(iconName: "giftcard.fill", title: "Ofertas"), MenuItem(iconName: "dollarsign.circle", title: "Mercado Crédito"), MenuItem(iconName: "clock", title: "Historial"), MenuItem(iconName: "person.circle", title: "Mi Cuenta")]
    
    func getMenuCount() -> Int{
        menuItems.count
    }
}
