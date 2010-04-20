namespace :db do
  desc "Bootstrap your database for Spree."
  task :bootstrap  => :environment do
    # load initial database fixtures (in db/sample/*.yml) into the current environment's database
    ActiveRecord::Base.establish_connection(RAILS_ENV.to_sym)
    Dir.glob(File.join(MarkiModeleExtension.root, "db", 'sample', '*.{yml,csv}')).each do |fixture_file|
      Fixtures.create_fixtures("#{MarkiModeleExtension.root}/db/sample", File.basename(fixture_file, '.*'))
    end
  end
  
  
end

namespace :spree do
  namespace :extensions do
    namespace :marki_modele do
      desc "Copies public assets of the Marki Modele to the instance public/ directory."
      task :update => :environment do
        is_svn_git_or_dir = proc {|path| path =~ /\.svn/ || path =~ /\.git/ || File.directory?(path) }
        Dir[MarkiModeleExtension.root + "/public/**/*"].reject(&is_svn_git_or_dir).each do |file|
          path = file.sub(MarkiModeleExtension.root, '')
          directory = File.dirname(path)
          puts "Copying #{path}..."
          mkdir_p RAILS_ROOT + directory
          cp file, RAILS_ROOT + path
        end
      end  
      
      desc "Importuj liste marek pojazdow"  
      task :importuj_marki => :environment do  
        require 'mechanize'  
        puts "Usuwanie istniejacej listy marek.."
        Marka.delete_all
        puts "\tUsunieto!!\n"
        agent = WWW::Mechanize.new  
        puts "Nawiązywanie polączenia z http://www.autocentrum.pl/auta/"
        agent.get('http://www.autocentrum.pl/auta/')
        puts "\tNawiązano!\n"
        agent.page.search('#main img').each do |marka|  
          nazwa = marka.attribute('alt').to_s
          puts "Importowanie marki: #{nazwa}"
          Marka.create!(:name => nazwa)  
        end
      end
    end
  end
end