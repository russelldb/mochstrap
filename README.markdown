This requires a vagrant box that is hosted @[tbc].

To get the box, run 

	vagrant box add moch_strap @[tbc] moch_strap

then run

	vagrant up

then

	vagrant ssh

then 
	
	cd /vagrant
	./rebar create template=mochi appid=yourappname nodeid=yournodename erlgmail_usr=you@gmail.com erlgmail_pass=yourpassword erlgmail_to=your@emailaddress.com

then
	./rebar get-deps
	chmod +x start_dev.sh
	./start_dev.sh

then point your browser at http://127.0.0.1:8080 and see your running erlang web dev bootstrap. Edit code in
	apps/yourappname/src

edit templates and static content in

	rel/overlay/site

when you are happy

	./rebar generate

then package up the 

	rel/yourappname

directory and drop on your target linux host (like say slicehost)

see http://russelldb.github.com for a blog on all this.
