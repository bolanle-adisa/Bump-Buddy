//
//  EditProfileView.swift
//  BumpBuddy
//
//  Created by Bolanle Adisa on 11/21/23.
//

import SwiftUI
import PhotosUI

struct EditProfileView: View {
    @Binding var userName: String
    @State private var userAge: String = ""
    @State private var profileImage: UIImage?
    @State private var isImagePickerPresented = false

    var body: some View {
        VStack(spacing: 20) {
            Text("Edit Profile")
                .font(.title)
                .fontWeight(.bold)

            // Profile Image
            Button(action: {
                isImagePickerPresented = true
            }) {
                if let profileImage = profileImage {
                    Image(uiImage: profileImage)
                        .resizable()
                        .scaledToFill()
                        .frame(width: 120, height: 120)
                        .clipShape(Circle())
                } else {
                    Image(systemName: "person.crop.circle.fill")
                        .resizable()
                        .scaledToFit()
                        .frame(width: 120, height: 120)
                        .foregroundColor(.blue)
                }
            }
            .padding()
            .overlay(Circle().stroke(Color.blue, lineWidth: 4))
            .sheet(isPresented: $isImagePickerPresented) {
                PhotoPicker(selectedImage: $profileImage)
            }

            // User Details Fields
            Group {
                CustomTextField(placeholder: "Username", text: $userName)
                CustomTextField(placeholder: "Age", text: $userAge)
            }

            // Save Button
            Button("Save Changes", action: saveProfileChanges)
                .foregroundColor(.white)
                .padding()
                .frame(maxWidth: .infinity)
                .background(Color.green)
                .cornerRadius(10)
            
            Spacer()
        }
        .padding()
    }
    
    private func saveProfileChanges() {
        // Save changes to user profile
    }
    
    // Custom styled text field
    private func CustomTextField(placeholder: String, text: Binding<String>) -> some View {
        TextField(placeholder, text: text)
            .padding()
            .background(Color(.systemGray6)) // Light gray background
            .cornerRadius(8)
            .padding(.horizontal)
    }
}

struct PhotoPicker: UIViewControllerRepresentable {
    @Binding var selectedImage: UIImage?

    func makeUIViewController(context: Context) -> some UIViewController {
        var configuration = PHPickerConfiguration()
        configuration.selectionLimit = 1
        configuration.filter = .images

        let picker = PHPickerViewController(configuration: configuration)
        picker.delegate = context.coordinator
        return picker
    }

    func updateUIViewController(_ uiViewController: UIViewControllerType, context: Context) {}

    func makeCoordinator() -> Coordinator {
        Coordinator(self)
    }

    class Coordinator: NSObject, PHPickerViewControllerDelegate {
        var parent: PhotoPicker

        init(_ parent: PhotoPicker) {
            self.parent = parent
        }

        func picker(_ picker: PHPickerViewController, didFinishPicking results: [PHPickerResult]) {
            picker.dismiss(animated: true)

            guard let provider = results.first?.itemProvider else { return }
            if provider.canLoadObject(ofClass: UIImage.self) {
                provider.loadObject(ofClass: UIImage.self) { image, _ in
                    self.parent.selectedImage = image as? UIImage
                }
            }
        }
    }
}


struct EditProfileView_Previews: PreviewProvider {
    @State static var userName = "Sample User" // Temporary state variable for preview

    static var previews: some View {
        EditProfileView(userName: $userName) // Passing a binding to the temporary variable
    }
}
