//
//  CoffeeView.swift
//  PlayaroundApp
//
//  Created by Bekzhan Talgat on 04.07.2023.
//

import SwiftUI
//import PhotosUI
import CoreImage
import CoreImage.CIFilterBuiltins


struct CoffeeView: View {
    @State private var currentFilter: CIFilter = CIFilter.sepiaTone()
    
    @State private var image: Image?
    @State private var filterIntensity = 0.5
    @State private var showingImagePicker = false
    @State private var inputImage: UIImage?
    let context = CIContext()
    
    @State private var showingFilterSheet = false
    
    
    var body: some View {
        VStack {
            ZStack {
                Rectangle().fill(.secondary)
                
                Text("Tap to select a picture")
                    .foregroundColor(.white)
                    .font(.headline)
                
                image?
                    .resizable()
                    .scaledToFit()
            }
            .onTapGesture {
                 showingImagePicker = true
            }
            
            HStack {
                Text("Intensity")
                Slider(value: $filterIntensity)
                    .tint(.yellow)
                    .onChange(of: filterIntensity) { newValue in
                        applyProccesing()
                    }
            }
            .padding(.vertical)
            
            HStack {
                Button("Change filter") {
                    showingFilterSheet = true
                }
                .foregroundColor(.yellow)
                
                Spacer()
                
                Button("Save") {
                    save()
                }
                .foregroundColor(.orange)
            }
        }
        .padding()
        .padding(.bottom, 120)
        .onChange(of: inputImage) { newValue in
            loadImage()
        }
        .sheet(isPresented: $showingImagePicker) {
            ImagePicker(image: $inputImage)
        }
        .confirmationDialog("Select a filter", isPresented: $showingFilterSheet) {
            Button("Crysallize") { setFilter(.crystallize()) }
            Button("Edges") { setFilter(.edges()) }
            Button("Gaussian Blut") { setFilter(.gaussianBlur()) }
            Button("Pixellate") { setFilter(.pixellate()) }
            Button("Sepia Tone") { setFilter(.sepiaTone()) }
            Button("Unsharp Mask") { setFilter(.unsharpMask()) }
            Button("Vignette") { setFilter(.vignette()) }
            Button("Cancle", role: .cancel) {}
        }

    }
    
    
    func applyProccesing() {
        let inputKeys = currentFilter.inputKeys
        
        if inputKeys.contains(kCIInputIntensityKey) {
            currentFilter.setValue(filterIntensity, forKey: kCIInputIntensityKey)
        }
        
        if inputKeys.contains(kCIInputRadiusKey) {
            currentFilter.setValue(filterIntensity * 200, forKey: kCIInputRadiusKey)
        }
        
        if inputKeys.contains(kCIInputScaleKey) {
            currentFilter.setValue(filterIntensity * 10, forKey: kCIInputScaleKey)
        }
        
        
        guard let outputImage = currentFilter.outputImage else { return }
        
        if let cgimg = context.createCGImage(outputImage, from: outputImage.extent) {
            let uiImage = UIImage(cgImage: cgimg)
            image = Image(uiImage: uiImage)
        }
    }
    
    func setFilter(_ filter: CIFilter) {
        currentFilter = filter
        loadImage()
    }
    
    func loadImage() {
        guard let inputImage = inputImage else { return }
        
        let beginImage = CIImage(image: inputImage)
        currentFilter.setValue(beginImage, forKey: kCIInputImageKey)
        applyProccesing()
    }
    
    func save() {
        guard let inputImage = inputImage else { return }
        let imageSaver = ImageSaver()
        imageSaver.writeToPhotoAlbum(image: inputImage)
    }
    
}

//struct CoffeeView_Previews: PreviewProvider {
//    static var previews: some View {
//        CoffeeView()
//            .preferredColorScheme(.dark)
//    }
//}
