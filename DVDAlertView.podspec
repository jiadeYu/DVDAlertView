Pod::Spec.new do |s|
    s.name = 'DVDAlertView'
    s.version = '1.0.0'
    s.license = 'MIT'
    s.summary = '自定义AlertView'
    s.homepage = 'https://github.com/jiadeYu/DVDAlertView'
    s.authors = { 'jiadeYu' => '13521864217@163.com' }
    s.source = { :git => 'https://github.com/jiadeYu/DVDAlertView.git', :tag => s.version.to_s }
    s.requires_arc = true
    s.ios.deployment_target = '7.0'
    s.source_files = 'DVDAlertView/**/*.{h,m}'
end

