//
//  QuotesView.swift
//  Quotes
//
//  Created by Sean Megan on 2/29/24.
//

import ScreenSaver

class BlankScreenSaverView: ScreenSaverView {
    
    private var textAttributes: [NSAttributedString.Key: Any] = {
        let paragraphStyle = NSMutableParagraphStyle()
        paragraphStyle.alignment = .center
        return [.font: NSFont.systemFont(ofSize: 24),
                .paragraphStyle: paragraphStyle,
                .foregroundColor: NSColor.white]
    }()
    
    override init?(frame: NSRect, isPreview: Bool) {
        super.init(frame: frame, isPreview: isPreview)
        self.animationTimeInterval = 1.0 / 30.0
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    override func draw(_ rect: NSRect) {
        super.draw(rect)
        
        let backgroundColor = NSColor.black
        backgroundColor.setFill()
        rect.fill()
        
        let text = "This is a screensaver"
        let textSize = text.size(withAttributes: textAttributes)
        let textRect = CGRect(x: rect.midX - textSize.width / 2,
                              y: rect.midY - textSize.height / 2,
                              width: textSize.width,
                              height: textSize.height)
        
        text.draw(in: textRect, withAttributes: textAttributes)
    }
    
    override func animateOneFrame() {
        super.animateOneFrame()
        // Add any animations here if necessary
        setNeedsDisplay(bounds)
    }
    
}
