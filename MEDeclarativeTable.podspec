Pod::Spec.new do |s|
  s.name             = "MEDeclarativeTable"
  s.version          = "0.3.0"
  s.summary          = "Describe the structure of your `UITableView`'s sections and rows in an object oriented way."
  s.description      = "Describe the structure of your `UITableView`'s sections and rows in an object oriented way.  Useful for building small and mostly static tables such as forms, settings, menus, etc...  We prefer readability over memory efficiency, so it is not recommended to use this with tables that may have a large number of cells."
  s.homepage         = "https://github.com/enriquez/MEDeclarativeTable"
  s.screenshots      = "http://i.imgur.com/ZENmO6l.png"
  s.license          = 'MIT'
  s.author           = { "Mike Enriquez" => "mike@enriquez.me" }
  s.source           = { :git => "https://github.com/enriquez/MEDeclarativeTable.git", :tag => s.version.to_s }
  s.social_media_url = 'https://twitter.com/enriquez'

  s.platform     = :ios, '7.0'
  s.requires_arc = true

  s.source_files = 'Pod/Classes/**/*'
  s.resource_bundles = {
    'MEDeclarativeTable' => ['Pod/Assets/*.png']
  }
end
