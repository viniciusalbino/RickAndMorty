//
//  LoadingController.swift
//  RickyAndMorty
//
//  Created by Vinicius Albino on 23/01/23.
//

import Foundation
import UIKit

class LoadingView: UIView {
    private var loading: UIActivityIndicatorView = UIActivityIndicatorView(frame: .zero)
    private var blurView: UIVisualEffectView!
    public override init(frame: CGRect) {
         super.init(frame: frame)
        setupView()
     }
     
     public required init?(coder aDecoder: NSCoder) {
         super.init(coder: aDecoder)
         setupView()
     }
    
    private func setupView() {
        frame = bounds
        autoresizingMask = [.flexibleWidth, .flexibleHeight]
        translatesAutoresizingMaskIntoConstraints = true
        
        let blurEffect = UIBlurEffect(style: .extraLight)
        blurView = UIVisualEffectView(effect: blurEffect)
        blurView.translatesAutoresizingMaskIntoConstraints = false
        blurView.pinToBounds(of: self)
        
        addSubview(loading)
        loading.translatesAutoresizingMaskIntoConstraints = false
        NSLayoutConstraint.activate([
            loading.centerYAnchor.constraint(equalTo: centerYAnchor),
            loading.centerXAnchor.constraint(equalTo: centerXAnchor),
            loading.widthAnchor.constraint(equalToConstant: 44),
            loading.heightAnchor.constraint(equalToConstant: 44)
        ])
    }
    
    func startLoading() {
        loading.startAnimating()
        loading.color = .black
        loading.hidesWhenStopped = true
    }
    
    func stopLoading() {
        loading.stopAnimating()
    }
}
