//
//  ContentView.swift
//  PhotoPicker
//
//  Created by Winsome Tang on 2024-07-22.
//

import SwiftUI

struct ContentView: View {
    @State private var isPickerPresented = false
    @State private var isCameraPresented = false
    @State private var selectedImage: UIImage?

    var body: some View {
        VStack {
            // Display the selected image if there is one
            if let image = selectedImage {
                Image(uiImage: image)
                    .resizable()
                    .scaledToFit()
                    .frame(width: 300, height: 300)
                    .clipShape(RoundedRectangle(cornerRadius: 10))
                    .shadow(radius: 10)
            } else {
                Text("Select an image")
                    .font(.headline)
            }

            // Button to pick a photo from the gallery
            Button(action: {
                isPickerPresented = true
            }) {
                Text(selectedImage == nil ? "Pick a photo" : "Pick another image")
                    .font(.headline)
                    .padding()
                    .frame(maxWidth: .infinity)
                    .background(Color.blue)
                    .foregroundColor(.white)
                    .cornerRadius(30)
            }
            .padding()
            .sheet(isPresented: $isPickerPresented) {
                PickYourImageView(selectedImage: $selectedImage)
            }

            // Button to take a new photo with the camera
            Button(action: {
                isCameraPresented = true
            }) {
                Text("Take a photo")
                    .font(.headline)
                    .padding()
                    .frame(maxWidth: .infinity)
                    .background(Color.green)
                    .foregroundColor(.white)
                    .cornerRadius(30)
            }
            .padding()
            .sheet(isPresented: $isCameraPresented) {
                CameraView(selectedImage: $selectedImage)
            }
        }
        .padding()
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
