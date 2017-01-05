namespace :db do 
	desc "Importing All Rake Tasks in Single Rake Task"
 	task :populate => [:environment] do 

 		p "Importing Customer "

 	 	Rake::Task["customer:import"].invoke
 	 	
 	 	p "Importing Orders"

 	    Rake::Task["order:import"].invoke
 	 	
 	end
end