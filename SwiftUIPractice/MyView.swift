//
//  MyView.swift
//  SwiftUIPractice
//
//  Created by 강민우 on 2023/01/30.
//

import SwiftUI

struct MyView: View {
    var body: some View { // some View는  body의 속성이 view를 준수하는지만 확인함
            VStack {
                Text("Hello World")
                    .font(.title)
                Text("만나서 반가워요")
        }
    }
}

struct MyView_Previews: PreviewProvider {
    static var previews: some View{
        MyView()
    }
}
