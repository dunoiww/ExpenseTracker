//
//  QRViewViewModel.swift
//  ExpenseTracker
//
//  Created by Ngô Nam on 21/09/2023.
//

import Foundation
import SwiftUI

class QRViewViewModel: ObservableObject {
    
    var creditList = creditListPreviewData
    @Published var qrSelected = 1
    @Published var image: UIImage?
    @Published var showPhotoLibrary = false
}
