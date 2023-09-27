//
//  BaseReusableNibView.swift
//  SpaceXLatestLaunch
//
//  Created by Yunus Emre Celebi
//

import UIKit

/***
 Normalde UIView oluştururken "also xib.." seçemiyorsunuz.
 Önce bir swift file daha sonra bir Empty View(nib) oluşturun.
 Xib ile birlikte bir Custom UIView kullanmak için kendi sınıfınızı bu sınıftan türetin,
 daha sonra Xib dosyanızda File Owner kısmına classınızın adını vermeniz yeterlidir,
 nib bağlantısını bu base class kendisi hallediyor.
 */

open class BaseReusableNibView: UIView {

    internal var fakeContentView: UIView!

    override init(frame: CGRect) {
        super.init(frame: frame)
        nibInit()
        initializeComponent()
    }
    required public init?(coder aDecoder: NSCoder) {
        super.init(coder: aDecoder)
        nibInit()
        initializeComponent()
    }

    open override func prepareForInterfaceBuilder() {
        super.prepareForInterfaceBuilder()
        nibInit()
        initializeComponent()
    }

    internal func initializeComponent() {
        preconditionFailure("initializeComponent - This method must be overridden")
    }
}

private extension BaseReusableNibView {

    // bağlantıyı sağlaması için bu şekilde bir yöntem izleniyor.
    // bu kodu kaldırırsak nib ve swift dosyası bağlanmayacak ve crash olacaktır.
    func nibInit() {
        self.fakeContentView = loadViewFromNib()
        self.fakeContentView.frame = bounds
        self.fakeContentView.autoresizingMask = [.flexibleWidth, .flexibleHeight]
        addSubview(self.fakeContentView)
    }
}


