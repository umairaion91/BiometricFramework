Pod::Spec.new do |spec|

  spec.name         = "AionBiometrics"
  spec.version      = "1.0.0"
  spec.summary      = "This is the framework to perform biometric varifation"
  spec.description      = "This framework perform identity verification for newly onboarded users"

  spec.homepage     = "https://github.com/umairaion91/BiometricFramework"
  
  spec.license = {
     type: 'MIT',
     file: 'LICENSE'
   }

  spec.author = {
    "Umair Irfan" => "160529780+umairaion91@users.noreply.github.com"
  }

  spec.platform = :ios
  spec.ios.deployment_target = '13.0'
  spec.requires_arc = true
  spec.swift_version = "5.0"
  
  spec.pod_target_xcconfig = {
     'SWIFT_VERSION' => '5.0'
   }
  
  spec.source = {
    git: "https://github.com/umairaion91/BiometricFramework.git",
    tag: spec.version.to_s
  }

  #spec.resources = "BundleFiles/Plist/*"
  #spec.source_files  = "AionBiometrics/**/*.{h,m,swift}", "Library/*.modulemap"
  spec.source_files = "AionBiometrics/**/*.{h,swift}", "Dependencies/*.*"
  
  #spec.resource_bundles = {'AionBiometrics/AionBiometrics/Dependencies' => ['Daon.bundle']}
  
  spec.vendored_frameworks = "Dependencies/DaonAuthenticatorFace.framework", "Dependencies/DaonAuthenticatorSDK.framework",
  "Dependencies/DaonCryptoSDK.framework", "Dependencies/DaonDocument.framework", "Dependencies/DaonFaceDetector.framework","Dependencies/DaonFaceLiveness.framework","Dependencies/DaonFaceLivenessBlink.framework","Dependencies/DaonFaceMatcher.framework","Dependencies/DaonFaceQuality.framework","Dependencies/DaonFaceSDK.framework","Dependencies/DaonFIDOSDK.framework","Dependencies/Microblink.framework"
  
  spec.pod_target_xcconfig = {
    'EXCLUDED_ARCHS[sdk=iphonesimulator*]' => 'arm64'
  }
  spec.user_target_xcconfig = { 'EXCLUDED_ARCHS[sdk=iphonesimulator*]' => 'arm64' }

  # ――― Project Linking ―――――――――――――――――――――――――――――――――――――――――――――――――――――――――― #
  #
  #  Link your library with frameworks, or libraries. Libraries do not include
  #  the lib prefix of their name.
  #

  # spec.framework  = "DaonDocument"
  # spec.frameworks = "SomeFramework", "AnotherFramework"
  #spec.vendored_frameworks = 'AionBiometrics/AionBiometrics/Dependencies/DaonDocument.framework'
  #spec.vendored_libraries = 'AionBiometrics/AionBiometrics/Dependencies/DaonDocument.framework/DaonDocument'

  # spec.library   = "iconv"
  # spec.libraries = "iconv", "xml2"

  #spec.xcconfig = { 'ALWAYS_EMBED_SWIFT_STANDARD_LIBRARIES' => 'YES' }

  # ――― Project Settings ――――――――――――――――――――――――――――――――――――――――――――――――――――――――― #
  #
  #  If your library depends on compiler flags you can set them in the xcconfig hash
  #  where they will only apply to your library. If you depend on other Podspecs
  #  you can include multiple dependencies to ensure it works.

  # spec.requires_arc = true

  # spec.xcconfig = { "HEADER_SEARCH_PATHS" => "$(SDKROOT)/usr/include/libxml2" }
  # spec.dependency "JSONKit", "~> 1.4"
  # spec.dependency "DaonDocument"

end
