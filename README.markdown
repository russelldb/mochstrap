My bootstrap env for basic erlang webdevelopment. This is small scale stuff. It creates a [mochiweb](http://github.com/mochi/mochiweb) skeleton app. It uses [rebar](http://hg.basho.com/rebar) for building and dependancy management. The site is a basic site with [ErlyDtl](http://github.com/evanmiller/erlydtl) for templating and erlgmail for sending mail.

It is for that standard brochure site with contact form, but you can do what you like with it. There is nothing smart like url dispatching, have a look in <<you_app>>/src/<<yourapp>>_web.erl for path handling.

I use [Vagrant](http://vagrantup.com) for development, you should too.

You will beed to have VirtualBox installed. Get 3.2.8 from Oracle [here](http://www.virtualbox.org/).

Then install Vagrant

     gem install vagrant

To get the box, run 

	vagrant box add base http://files.vagrantup.com/lucid32.box

then clone this repo

     git clone git://github.com/russelldb/mochstrap.git

then run

	vagrant up

then

	vagrant ssh

then 
	
	cd /vagrant
	./rebar create template=mochi appid=mywebapp nodeid=mywebapp erlgmail_usr=you@gmail.com erlgmail_pass=yourpassword erlgmail_to=your@emailaddress.com

then
	./rebar get-deps
	chmod +x start_dev.sh
	./start_dev.sh

then point your browser at http://127.0.0.1:8080 and see your running erlang web dev bootstrap. Edit code in
	apps/mywebapp/src

edit templates and static content in

	rel/overlay/site

when you are happy

	./rebar generate

then package up the 

	rel/yourappname

directory and drop on your target linux host (like say slicehost)

see <http://russelldb.github.com> for a blog on all this.
