//
//  MarkerView.swift
//  GoogleMapsDemo
//
//  Created by Milton Palaguachi on 2/4/21.
//

import UIKit
protocol MarkerViewDelegate: AnyObject {
    func rideToLocation()
    func rideFromLocation()
}

class MarkerView: UIView {
    
    @IBOutlet weak var contentView: UIView!
    @IBOutlet weak var titleLabel: UILabel!
    @IBOutlet weak var addressLabel: UILabel!
    weak var delegate: MarkerViewDelegate?

    override init(frame: CGRect) {
        super.init(frame: frame)
        self.initSubView()
    }
    
    required init?(coder: NSCoder) {
        super.init(coder: coder)
        self.initSubView()
    }
    
    override func awakeFromNib() {
        super.awakeFromNib()
    }
    
    @IBAction func toHere(_ sender: UIButton) {
        self.delegate?.rideToLocation()
    }
    
    @IBAction func fromHere(_ sender: UIButton) {
        self.delegate?.rideFromLocation()
    }
    
    func confiure(marker: Marker) {
        self.titleLabel.text = marker.name
        self.addressLabel.text = marker.address
    }
}

extension MarkerView {
    func initSubView() {
        let nib = UINib(nibName: String(describing: type(of: self)), bundle: nil)
        nib.instantiate(withOwner: self, options: nil)
        addSubview(self.contentView)
        self.contentView.translatesAutoresizingMaskIntoConstraints = false

        let constraints = [
            self.contentView.topAnchor.constraint(equalTo: self.topAnchor),
            self.contentView.bottomAnchor.constraint(equalTo: self.bottomAnchor),
            self.contentView.leadingAnchor.constraint(equalTo: self.leadingAnchor),
            self.contentView.trailingAnchor.constraint(equalTo: self.trailingAnchor)
        ]
        NSLayoutConstraint.activate(constraints)
    }
}
