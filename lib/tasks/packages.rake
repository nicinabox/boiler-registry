namespace :packages do
  desc "List packages"
  task :list => :environment do
    packages = Package.all
    packages.each do |p|
      puts p.name
    end
  end

  desc "Find package"
  task :find => :environment do
    print "Name: "
    package = STDIN.gets.strip

    packages = Package.where name: package
    packages.each do |p|
      puts p.name
    end
  end

  desc 'Unregister package'
  task :unregister => :environment do
    print "Name: "
    package = STDIN.gets.strip

    puts "This will delete #{package}!"
    print "Type '#{package}' again to unregister: "
    package_confirmation = STDIN.gets.strip

    if package == package_confirmation
      Package.where(name: package).destroy_all
      puts "Aaaand it's gone."
    else
      puts "Canceling. Confirmation didn't match."
    end
  end
end
