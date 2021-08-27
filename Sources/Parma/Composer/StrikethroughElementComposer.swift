//
//  File.swift
//  
//
//  Created by Larry Tran on 8/27/21.
//

import SwiftUI

struct StrikethroughElementComposer: InlineElementComposer {
    func text(in context: ComposingContext, render: ParmaRenderable) -> Text {
        render.strikethrough(textView: context.concatenatedText)
    }
}
