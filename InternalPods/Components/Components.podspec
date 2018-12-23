Pod::Spec.new do |s|
  s.name                        = "Components"
  s.version                     = "0.1.0"
  s.source                      = { :git => "https://github.com/cliftonr/Components.git" }

  s.summary                     = "Development pod consisting of highly reusable components."
  s.homepage                    = "https://github.com/cliftonr/GraphQLClient-iOS/InternalPods/Components"
  s.authors                     = { "Clifton R." => "example@example.com" }
  s.license                     = "MIT"

  s.platform                    = :ios, "10.0"
  s.source_files             	= "Sources/**/*.{swift}"

  ### Rx
  s.dependency "RxCocoa"
  s.dependency "RxSwift"
end
