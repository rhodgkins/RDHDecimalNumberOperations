Pod::Spec.new do |s|
    s.name = 'RDHDecimalNumberOperations'
    s.version = '1.0.1'
    s.license = 'MIT'
    
    s.summary = 'Swift extension for NSDecimalNumber operations.'
    s.homepage = 'https://github.com/rhodgkins/RDHDecimalNumberOperations.git'
    s.author = 'Rich Hodgkins'
    s.source = { :git => 'https://github.com/rhodgkins/RDHDecimalNumberOperations.git', :tag => s.version.to_s }
    s.docset_url = 'http://cocoadocs.org/docsets/RDHDecimalNumberOperations.git/xcode-docset.atom'
    s.social_media_url = 'https://twitter.com/rhodgkins'
    
    s.frameworks = 'Foundation'
    s.requires_arc = true
    
    s.ios.deployment_target = '8.0'
    s.source_files = 'RDHDecimalNumberOperations.swift'
end
