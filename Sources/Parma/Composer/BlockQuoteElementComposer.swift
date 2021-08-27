//
//  File.swift
//  
//
//  Created by Larry Tran on 8/27/21.
//

import SwiftUI

class BlockQuoteElementComposer: BlockElementComposer {
    private var index = [Int]()
    
    func willStart(in context: ComposingContext) {
        index.append(context.views.count)
    }
    
    func willStop(in context: ComposingContext) {
        index = index.dropLast()
    }
    
    func view(in context: ComposingContext, render: ParmaRenderable) -> AnyView {
        let maxIndex = context.views.count
        let minIndex = index.last!
        
        // Get every view inside this element scope
        let views = Array(context.views[minIndex..<maxIndex])
        
        // Remove those views from context
        context.views = context.views.dropLast(maxIndex-minIndex)

        if views.count == 1, let view = views.first {
            return render.blockQuoteBlock(view: view)
        } else if views.count > 1 {
            let count = views.count
            return render.blockQuoteBlock(view: AnyView(
                VStack(alignment: .leading) {
                    ForEach(0..<count, id: \.self) { index in
                        views[index]
                    }
                }
            ))
        } else {
            return render.blockQuoteBlock(view: AnyView(EmptyView()))
        }
    }
}

